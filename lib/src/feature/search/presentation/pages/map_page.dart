import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/local_storage/report_status_ui.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';
import 'package:city_drive/src/core/utils/map_status_marker_icon.dart';
import 'package:city_drive/src/feature/search/presentation/utils/road_problem_labels.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  GoogleMapController? _mapController;
  Completer<GoogleMapController> _controllerCompleter =
      Completer<GoogleMapController>();

  Set<Marker> _markers = {};
  RoadProblemDTO? _selectedProblem;
  double _currentZoom = 14.0;
  int _markerZoomBucket = MapStatusMarkerIcon.zoomBucket(14.0);
  List<RoadProblemDTO> _problems = [];

  bool _showCameraButton = false;
  Position? _currentPosition;
  RoadProblemsProvider? _problemsProvider;
  bool _listenerAttached = false;
  bool _mapActive = true;
  TabsRouter? _tabsRouter;
  int? _mapTabIndex;

  static const CameraPosition _initialCamera = CameraPosition(
    target: LatLng(43.238949, 76.889709),
    zoom: 14,
  );

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final tabsRouter = TabsRouterScope.of(context)?.controller;
    if (tabsRouter == null) return;

    _mapTabIndex ??= _resolveMapTabIndex(tabsRouter);
    if (_tabsRouter != tabsRouter) {
      _tabsRouter?.removeListener(_onTabsChanged);
      _tabsRouter = tabsRouter;
      _tabsRouter!.addListener(_onTabsChanged);
    }
    _syncMapVisibility();
  }

  int _resolveMapTabIndex(TabsRouter tabsRouter) {
    for (var i = 0; i < tabsRouter.pageCount; i++) {
      if (tabsRouter.stackRouterOfIndex(i)?.current.name == MapRoute.name) {
        return i;
      }
    }
    return 1;
  }

  bool get _isMapTabVisible {
    final tabsRouter = _tabsRouter;
    final mapIndex = _mapTabIndex;
    if (tabsRouter == null || mapIndex == null) return _mapActive;
    return tabsRouter.activeIndex == mapIndex;
  }

  void _onTabsChanged() => _syncMapVisibility();

  void _syncMapVisibility() {
    final visible = _isMapTabVisible;
    if (visible == _mapActive) return;

    _mapActive = visible;
    if (!visible) {
      _teardownMapPlatform();
    } else {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted && _mapActive) _loadProblems();
      });
    }
    if (mounted) setState(() {});
  }

  void _teardownMapPlatform() {
    _mapController?.dispose();
    _mapController = null;
    _controllerCompleter = Completer<GoogleMapController>();
    _markers = {};
  }

  bool get _canUpdateMap => mounted && _mapActive && _isMapTabVisible;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!mounted) return;
      _problemsProvider = context.read<RoadProblemsProvider>();
      _attachListener();
      if (_canUpdateMap) _loadProblems();
    });
  }

  @override
  void activate() {
    super.activate();
    _attachListener();
    _syncMapVisibility();
  }

  @override
  void deactivate() {
    _teardownMapPlatform();
    super.deactivate();
  }

  void _attachListener() {
    if (_listenerAttached || !mounted) return;
    _problemsProvider ??= context.read<RoadProblemsProvider>();
    _problemsProvider!.addListener(_onProblemsUpdated);
    _listenerAttached = true;
  }

  void _detachListener() {
    if (!_listenerAttached) return;
    _problemsProvider?.removeListener(_onProblemsUpdated);
    _listenerAttached = false;
  }

  void _onProblemsUpdated() {
    if (!_canUpdateMap || _problemsProvider == null) return;

    final problems = _problemsProvider!.problems;
    unawaited(_applyMarkers(problems));
  }

  Future<void> _applyMarkers(List<RoadProblemDTO> problems) async {
    if (!_canUpdateMap) return;
    final newMarkers = await _buildMarkers(problems);
    if (!_canUpdateMap) return;
    setState(() {
      _problems = problems;
      _markers = newMarkers;
    });
  }

  Future<void> _loadProblems() async {
    if (!_canUpdateMap) return;
    final provider = _problemsProvider ?? context.read<RoadProblemsProvider>();
    await provider.load();
    if (!_canUpdateMap) return;
    if (provider.loadError != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(provider.loadError!)),
      );
    }
    setState(() {
      _problems = provider.problems;
    });
    await _applyMarkers(_problems);
  }

  @override
  void dispose() {
    _mapActive = false;
    _tabsRouter?.removeListener(_onTabsChanged);
    _detachListener();
    _mapController?.dispose();
    _mapController = null;
    super.dispose();
  }

  Future<Set<Marker>> _buildMarkers(List<RoadProblemDTO> problems) async {
    if (!_canUpdateMap) return {};
    final l10n = context.localized;
    final newMarkers = <Marker>{};
    for (final problem in problems) {
      if (!ReportStatus.showOnMap(problem.status)) continue;
      if (problem.latitude == null || problem.longitude == null) continue;

      final status = problem.status;
      final icon = await MapStatusMarkerIcon.forStatus(
        status,
        zoom: _currentZoom,
      );
      newMarkers.add(
        Marker(
          markerId: MarkerId(problem.id.toString()),
          position: LatLng(problem.latitude!, problem.longitude!),
          anchor: const Offset(0.5, 1.0),
          infoWindow: InfoWindow(
            title: mapStatusLabel(l10n, status),
            snippet: problem.title ?? problem.address ?? '',
          ),
          onTap: () => _onMarkerTap(problem),
          icon: icon,
        ),
      );
    }
    return newMarkers;
  }

  void _onCameraMove(CameraPosition position) {
    if (!_canUpdateMap) return;
    _currentZoom = position.zoom;
    final bucket = MapStatusMarkerIcon.zoomBucket(_currentZoom);
    if (bucket == _markerZoomBucket) return;
    _markerZoomBucket = bucket;
    unawaited(_applyMarkers(_problems));
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (!_controllerCompleter.isCompleted) {
      _controllerCompleter.complete(controller);
    }
  }

  void _zoomIn() {
    final controller = _mapController;
    if (controller == null) return;
    _currentZoom = (_currentZoom + 1).clamp(0.0, 22.0);
    controller.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  void _zoomOut() {
    final controller = _mapController;
    if (controller == null) return;
    _currentZoom = (_currentZoom - 1).clamp(0.0, 22.0);
    controller.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  Future<void> _animateTo(LatLng pos, {double? zoom}) async {
    final controller = await _controllerCompleter.future;
    if (zoom != null) {
      controller.animateCamera(CameraUpdate.newCameraPosition(
          CameraPosition(target: pos, zoom: zoom)));
      _currentZoom = zoom;
    } else {
      controller.animateCamera(CameraUpdate.newLatLng(pos));
    }
  }

  Future<void> _goToMyLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return;
    }

    final position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    setState(() {
      _currentPosition = position;
      _showCameraButton = true;
    });

    _animateTo(
      LatLng(position.latitude, position.longitude),
      zoom: 16,
    );
  }

  Future<void> _openCamera() async {
    final ImagePicker picker = ImagePicker();

    try {
      Position? capturePosition = _currentPosition;
      try {
        capturePosition = await Geolocator.getCurrentPosition(
          locationSettings: const LocationSettings(
            accuracy: LocationAccuracy.high,
          ),
        );
        if (mounted) {
          setState(() => _currentPosition = capturePosition);
        }
      } catch (e) {
        debugPrint('Не удалось обновить GPS перед съёмкой: $e');
      }

      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (photo != null) {
        if (mounted) {
          context.router.push(
            CameraPreviewRoute(
              imagePath: photo.path,
              latitude: capturePosition?.latitude,
              longitude: capturePosition?.longitude,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Ошибка при открытии камеры: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(context.localized.cityDriveCameraFailed),
          ),
        );
      }
    }
  }

  void _onMarkerTap(RoadProblemDTO problem) {
    setState(() {
      _selectedProblem = problem;
    });
    _showProblemBottomSheet(problem);
  }

  void _showProblemBottomSheet(RoadProblemDTO problem) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.4,
          minChildSize: 0.2,
          maxChildSize: 0.7,
          expand: false,
          builder: (context, scrollController) {
            final l10n = context.localized;
            return Container(
              decoration: const BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
              ),
              padding: const EdgeInsets.all(20),
              child: SingleChildScrollView(
                controller: scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            problem.title ?? l10n.cityDriveRoadProblem,
                            style: AppTextStyles.title22BoldW700,
                          ),
                        ),
                        GestureDetector(
                          onTap: () => context.router.maybePop(),
                          child: const Icon(Icons.close, size: 24),
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        _buildChip(
                          severityLabel(l10n, problem.normalizedSeverity),
                          _getSeverityColor(problem.normalizedSeverity),
                        ),
                        const Gap(8),
                        _buildStatusChip(
                          mapStatusLabel(l10n, problem.status),
                          problem.status,
                        ),
                      ],
                    ),
                    const Gap(16),
                    Row(
                      children: [
                        const Icon(Icons.location_on,
                            color: AppColors.mainColor, size: 18),
                        const Gap(8),
                        Expanded(
                          child: Text(
                            problem.address ?? l10n.cityDriveAddressNotSpecified,
                            style: AppTextStyles.body14w400,
                          ),
                        ),
                      ],
                    ),
                    const Gap(12),
                    if (problem.reportedDate != null) ...[
                      Row(
                        children: [
                          const Icon(Icons.access_time,
                              color: Colors.grey, size: 18),
                          const Gap(8),
                          Text(
                            l10n.cityDriveReportedOn(
                              DateFormat('dd.MM.yyyy')
                                  .format(problem.reportedDate!),
                            ),
                            style: AppTextStyles.body14w400.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      const Gap(16),
                    ],
                    if (problem.images != null &&
                        problem.images!.isNotEmpty) ...[
                      ClipRRect(
                        borderRadius: BorderRadius.circular(12),
                        child: CachedNetworkImage(
                          imageUrl: problem.images!.first,
                          height: 160,
                          width: double.infinity,
                          fit: BoxFit.cover,
                          errorWidget: (_, __, ___) => const SizedBox(
                            height: 160,
                            child: Icon(Icons.broken_image),
                          ),
                        ),
                      ),
                      const Gap(16),
                    ],
                    if (problem.description != null) ...[
                      Text(
                        problem.description!,
                        style: AppTextStyles.body16w400,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const Gap(20),
                    ],
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          context.router.maybePop();
                          context.router.push(
                            RoadProblemDetailRoute(problem: problem),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.mainColor,
                          foregroundColor: AppColors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          ),
                        ),
                        child: Text(l10n.cityDriveMoreDetails),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    ).whenComplete(() {
      if (mounted && _canUpdateMap) {
        setState(() {
          _selectedProblem = null;
        });
      }
    });
  }

  Widget _buildStatusChip(String label, String? status) {
    final color = ReportStatusUi.colorFor(status);
    final icon = ReportStatusUi.iconFor(status);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: color),
          const Gap(4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChip(String label, Color color) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color, width: 1),
      ),
      child: Text(
        label,
        style: TextStyle(
          color: color,
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Color _getSeverityColor(String? severity) {
    switch (severity) {
      case 'critical':
        return Colors.red;
      case 'high':
        return Colors.cyan;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          if (_mapActive)
            GoogleMap(
              key: const ValueKey('city_drive_map'),
              initialCameraPosition: _initialCamera,
              onMapCreated: _onMapCreated,
              onCameraMove: _onCameraMove,
              markers: _markers,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              onTap: (pos) {
                if (!_canUpdateMap) return;
                setState(() {
                  _selectedProblem = null;
                });
              },
            )
          else
            const ColoredBox(
              color: Color(0xFFE8E8E8),
              child: SizedBox.expand(),
            ),
          Positioned(
            bottom: 162,
            right: 11,
            child: Column(
              children: [
                _floatingIconButton(Icons.add, null, onTap: _zoomIn),
                const Gap(8),
                _floatingIconButton(Icons.remove, null, onTap: _zoomOut),
              ],
            ),
          ),
          Positioned(
            bottom: 40,
            left: 20,
            child: _floatingIconButton(
              Icons.my_location,
              Assets.images.png.locationInMap.path,
              onTap: _goToMyLocation,
            ),
          ),
          if (_showCameraButton)
            Positioned(
              bottom: 40,
              right: 20,
              child: _cameraButton(),
            ),
        ],
      ),
    );
  }

  Widget _floatingIconButton(
    IconData icon,
    String? iconPath, {
    required VoidCallback onTap,
  }) {
    return iconPath != null
        ? GestureDetector(
            onTap: onTap,
              child: SizedBox(
              height: 60,
              width: 60,
              child: Image.asset(iconPath),
            ),
          )
        : Material(
            color: Colors.white,
            elevation: 4,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            child: InkWell(
              onTap: onTap,
              borderRadius: BorderRadius.circular(10),
              child: SizedBox(
                height: 44,
                width: 44,
                child: Icon(icon, color: Colors.black87, size: 22),
              ),
            ),
          );
  }

  Widget _cameraButton() {
    return Material(
      color: Colors.white,
      elevation: 6,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      child: InkWell(
        onTap: _openCamera,
        borderRadius: BorderRadius.circular(30),
        child: Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(30),
            border: Border.all(color: Colors.grey.shade300, width: 2),
          ),
          child: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.black87,
            size: 30,
          ),
        ),
      ),
    );
  }
}
