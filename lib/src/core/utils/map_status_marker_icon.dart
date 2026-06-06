import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:city_drive/src/core/local_storage/report_status_ui.dart';

/// Генерирует bitmap-маркеры карты с иконкой статуса внутри pin.
class MapStatusMarkerIcon {
  MapStatusMarkerIcon._();

  static final _cache = <String, BitmapDescriptor>{};

  /// Дискретные «ступени» зума — пересборка маркеров только при смене ступени.
  static int zoomBucket(double zoom) {
    if (zoom < 14) return 0;
    if (zoom < 15.5) return 1;
    if (zoom < 17) return 2;
    if (zoom < 19) return 3;
    return 4;
  }

  static double _zoomForBucket(int bucket) => switch (bucket) {
        0 => 13.0,
        1 => 14.75,
        2 => 16.25,
        3 => 18.0,
        _ => 20.0,
      };

  /// Компактный вдали; при приближении заметно крупнее (ускоренный рост).
  static Size displaySizeForZoom(double zoom) {
    final linear = ((zoom - 12) / 8).clamp(0.0, 1.0);
    final t = linear * linear;
    return Size(
      ui.lerpDouble(48, 100, t)!,
      ui.lerpDouble(56, 115, t)!,
    );
  }

  static Future<BitmapDescriptor> forStatus(
    String? status, {
    required double zoom,
  }) async {
    final bucket = zoomBucket(zoom);
    final key = '${status ?? 'unknown'}_$bucket';
    final cached = _cache[key];
    if (cached != null) return cached;

    final displaySize = displaySizeForZoom(_zoomForBucket(bucket));
    final descriptor = await _build(
      icon: ReportStatusUi.iconFor(status),
      color: ReportStatusUi.colorFor(status),
      displaySize: displaySize,
    );
    _cache[key] = descriptor;
    return descriptor;
  }

  static Future<BitmapDescriptor> _build({
    required IconData icon,
    required Color color,
    required Size displaySize,
  }) async {
    const renderSize = Size(96, 112);

    return _bitmapFromWidget(
      size: renderSize,
      child: SizedBox(
        width: renderSize.width,
        height: renderSize.height,
        child: Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              bottom: 0,
              child: Icon(
                Icons.arrow_drop_down,
                size: 46,
                color: color,
              ),
            ),
            Positioned(
              top: 0,
              child: Container(
                width: 76,
                height: 76,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.2),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Icon(icon, color: Colors.white, size: 40),
              ),
            ),
          ],
        ),
      ),
      displaySize: displaySize,
    );
  }

  static Future<BitmapDescriptor> _bitmapFromWidget({
    required Widget child,
    required Size size,
    required Size displaySize,
    double pixelRatio = 3,
  }) async {
    final repaintBoundary = RenderRepaintBoundary();

    final view = ui.PlatformDispatcher.instance.views.first;
    final renderView = RenderView(
      view: view,
      child: RenderPositionedBox(
        alignment: Alignment.center,
        child: repaintBoundary,
      ),
      configuration: ViewConfiguration.fromView(view),
    );

    final pipelineOwner = PipelineOwner();
    final buildOwner = BuildOwner(focusManager: FocusManager());
    pipelineOwner.rootNode = renderView;
    renderView.prepareInitialFrame();

    final rootElement = RenderObjectToWidgetAdapter<RenderBox>(
      container: repaintBoundary,
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: MediaQuery(
          data: MediaQueryData(devicePixelRatio: pixelRatio),
          child: Material(
            color: Colors.transparent,
            child: child,
          ),
        ),
      ),
    ).attachToRenderTree(buildOwner);

    buildOwner.buildScope(rootElement);
    buildOwner.finalizeTree();
    pipelineOwner
      ..flushLayout()
      ..flushCompositingBits()
      ..flushPaint();

    final image = await repaintBoundary.toImage(pixelRatio: pixelRatio);
    final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

    return BitmapDescriptor.bytes(
      bytes!.buffer.asUint8List(),
      width: displaySize.width,
      height: displaySize.height,
    );
  }
}
