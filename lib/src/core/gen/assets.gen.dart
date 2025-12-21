// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart' as _svg;
import 'package:vector_graphics/vector_graphics.dart' as _vg;

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Eye-off.svg
  SvgGenImage get eyeOff => const SvgGenImage('assets/icons/Eye-off.svg');

  /// File path: assets/icons/Eye.svg
  SvgGenImage get eye => const SvgGenImage('assets/icons/Eye.svg');

  /// File path: assets/icons/GlobeHemisphereWest.svg
  SvgGenImage get globeHemisphereWest =>
      const SvgGenImage('assets/icons/GlobeHemisphereWest.svg');

  /// File path: assets/icons/Medal.svg
  SvgGenImage get medal => const SvgGenImage('assets/icons/Medal.svg');

  /// File path: assets/icons/Right-Icons.svg
  SvgGenImage get rightIcons =>
      const SvgGenImage('assets/icons/Right-Icons.svg');

  /// File path: assets/icons/UsersThree.svg
  SvgGenImage get usersThree =>
      const SvgGenImage('assets/icons/UsersThree.svg');

  /// File path: assets/icons/dollar-blue.svg
  SvgGenImage get dollarBlue =>
      const SvgGenImage('assets/icons/dollar-blue.svg');

  /// File path: assets/icons/dollar-grey.svg
  SvgGenImage get dollarGrey =>
      const SvgGenImage('assets/icons/dollar-grey.svg');

  /// File path: assets/icons/home-blue.svg
  SvgGenImage get homeBlue => const SvgGenImage('assets/icons/home-blue.svg');

  /// File path: assets/icons/home-grey.svg
  SvgGenImage get homeGrey => const SvgGenImage('assets/icons/home-grey.svg');

  /// File path: assets/icons/illustration.svg
  SvgGenImage get illustration =>
      const SvgGenImage('assets/icons/illustration.svg');

  /// File path: assets/icons/notification.svg
  SvgGenImage get notification =>
      const SvgGenImage('assets/icons/notification.svg');

  /// File path: assets/icons/scale-blue.svg
  SvgGenImage get scaleBlue => const SvgGenImage('assets/icons/scale-blue.svg');

  /// File path: assets/icons/scale-grey.svg
  SvgGenImage get scaleGrey => const SvgGenImage('assets/icons/scale-grey.svg');

  /// File path: assets/icons/trending-up-blue.svg
  SvgGenImage get trendingUpBlue =>
      const SvgGenImage('assets/icons/trending-up-blue.svg');

  /// File path: assets/icons/trending-up-grey.svg
  SvgGenImage get trendingUpGrey =>
      const SvgGenImage('assets/icons/trending-up-grey.svg');

  /// File path: assets/icons/user-blue.svg
  SvgGenImage get userBlue => const SvgGenImage('assets/icons/user-blue.svg');

  /// File path: assets/icons/user-grey.svg
  SvgGenImage get userGrey => const SvgGenImage('assets/icons/user-grey.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        eyeOff,
        eye,
        globeHemisphereWest,
        medal,
        rightIcons,
        usersThree,
        dollarBlue,
        dollarGrey,
        homeBlue,
        homeGrey,
        illustration,
        notification,
        scaleBlue,
        scaleGrey,
        trendingUpBlue,
        trendingUpGrey,
        userBlue,
        userGrey
      ];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/career.png
  AssetGenImage get career => const AssetGenImage('assets/images/career.png');

  /// File path: assets/images/global-group-logo.png
  AssetGenImage get globalGroupLogo =>
      const AssetGenImage('assets/images/global-group-logo.png');

  /// File path: assets/images/rating.png
  AssetGenImage get rating => const AssetGenImage('assets/images/rating.png');

  /// File path: assets/images/town.png
  AssetGenImage get town => const AssetGenImage('assets/images/town.png');

  /// File path: assets/images/winner.png
  AssetGenImage get winner => const AssetGenImage('assets/images/winner.png');

  /// List of all assets
  List<AssetGenImage> get values =>
      [career, globalGroupLogo, rating, town, winner];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  ImageProvider provider({
    AssetBundle? bundle,
    String? package,
  }) {
    return AssetImage(
      _assetName,
      bundle: bundle,
      package: package,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}

class SvgGenImage {
  const SvgGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = false;

  const SvgGenImage.vec(
    this._assetName, {
    this.size,
    this.flavors = const {},
  }) : _isVecFormat = true;

  final String _assetName;
  final Size? size;
  final Set<String> flavors;
  final bool _isVecFormat;

  _svg.SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    _svg.SvgTheme? theme,
    _svg.ColorMapper? colorMapper,
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    final _svg.BytesLoader loader;
    if (_isVecFormat) {
      loader = _vg.AssetBytesLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
      );
    } else {
      loader = _svg.SvgAssetLoader(
        _assetName,
        assetBundle: bundle,
        packageName: package,
        theme: theme,
        colorMapper: colorMapper,
      );
    }
    return _svg.SvgPicture(
      loader,
      key: key,
      matchTextDirection: matchTextDirection,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      colorFilter: colorFilter ??
          (color == null ? null : ColorFilter.mode(color, colorBlendMode)),
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
