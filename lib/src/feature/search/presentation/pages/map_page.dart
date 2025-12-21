import 'dart:async';
import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/search/bloc/road_problems_provider.dart';
import 'package:ikidz/src/feature/search/model/road_problem_dto.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';

@RoutePage()
class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  late GoogleMapController _mapController;
  final Completer<GoogleMapController> _controllerCompleter = Completer();

  Set<Marker> _markers = {};
  RoadProblemDTO? _selectedProblem;
  double _currentZoom = 14.0;
  List<RoadProblemDTO> _problems = [];

  bool _showCameraButton = false;
  Position? _currentPosition;

  static const CameraPosition _initialCamera = CameraPosition(
    target: LatLng(43.238949, 76.889709),
    zoom: 14,
  );

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final provider = context.read<RoadProblemsProvider>();
      provider.addListener(_onProblemsUpdated);
      _loadProblems();
    });
  }

  void _onProblemsUpdated() {
    final provider = context.read<RoadProblemsProvider>();
    setState(() {
      _problems = provider.problems;
      _updateMarkers(_problems);
    });
  }

  void _loadProblems() {
    final provider = context.read<RoadProblemsProvider>();

    if (provider.problems.isEmpty) {
      provider.initializeWithMockData();
    }

    _problems = provider.problems;
    _updateMarkers(_problems);
  }

  @override
  void dispose() {
    final provider = context.read<RoadProblemsProvider>();
    provider.removeListener(_onProblemsUpdated);
    super.dispose();
  }

  void _updateMarkers(List<RoadProblemDTO> problems) {
    final newMarkers = <Marker>{};
    for (final problem in problems) {
      if (problem.latitude != null && problem.longitude != null) {
        newMarkers.add(
          Marker(
            markerId: MarkerId(problem.id.toString()),
            position: LatLng(
              problem.latitude!,
              problem.longitude!,
            ),
            infoWindow: InfoWindow(title: problem.title),
            onTap: () => _onMarkerTap(problem),
            icon: _getMarkerIcon(problem.severity),
          ),
        );
      }
    }

    setState(() {
      _markers = newMarkers;
    });
  }

  BitmapDescriptor _getMarkerIcon(String? severity) {
    switch (severity) {
      case 'critical':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed);
      case 'high':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueCyan);
      case 'medium':
        return BitmapDescriptor.defaultMarkerWithHue(
            BitmapDescriptor.hueYellow);
      case 'low':
        return BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueGreen);
      default:
        return BitmapDescriptor.defaultMarker;
    }
  }

  void _onMapCreated(GoogleMapController controller) {
    _mapController = controller;
    if (!_controllerCompleter.isCompleted) {
      _controllerCompleter.complete(controller);
    }
  }

  void _zoomIn() {
    _currentZoom = (_currentZoom + 1).clamp(0.0, 22.0);
    _mapController.animateCamera(CameraUpdate.zoomTo(_currentZoom));
  }

  void _zoomOut() {
    _currentZoom = (_currentZoom - 1).clamp(0.0, 22.0);
    _mapController.animateCamera(CameraUpdate.zoomTo(_currentZoom));
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
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 80,
      );

      if (photo != null) {
        if (mounted) {
          context.router.push(
            CameraPreviewRoute(
              imagePath: photo.path,
              latitude: _currentPosition?.latitude,
              longitude: _currentPosition?.longitude,
            ),
          );
        }
      }
    } catch (e) {
      debugPrint('Ошибка при открытии камеры: $e');
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Не удалось открыть камеру'),
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
                            problem.title ?? 'Дорожная проблема',
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
                          _getSeverityText(problem.severity),
                          _getSeverityColor(problem.severity),
                        ),
                        const Gap(8),
                        _buildChip(
                          _getStatusText(problem.status),
                          _getStatusColor(problem.status),
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
                            problem.address ?? 'Адрес не указан',
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
                            'Сообщено: ${DateFormat('dd.MM.yyyy').format(problem.reportedDate!)}',
                            style: AppTextStyles.body14w400.copyWith(
                              color: Colors.grey,
                            ),
                          ),
                        ],
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
                        child: const Text('Подробнее'),
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
      setState(() {
        _selectedProblem = null;
      });
    });
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

  String _getStatusText(String? status) {
    switch (status) {
      case 'new':
        return 'Новая';
      case 'in_progress':
        return 'В работе';
      case 'fixed':
        return 'Исправлено';
      default:
        return 'Не определен';
    }
  }

  Color _getStatusColor(String? status) {
    switch (status) {
      case 'new':
        return Colors.red;
      case 'in_progress':
        return Colors.orange;
      case 'fixed':
        return Colors.green;
      default:
        return Colors.grey;
    }
  }

  String _getSeverityText(String? severity) {
    switch (severity) {
      case 'critical':
        return 'Критическая';
      case 'high':
        return 'Высокая';
      case 'medium':
        return 'Средняя';
      case 'low':
        return 'Низкая';
      default:
        return '';
    }
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
          GoogleMap(
            initialCameraPosition: _initialCamera,
            onMapCreated: _onMapCreated,
            markers: _markers,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            zoomControlsEnabled: false,
            onTap: (pos) {
              setState(() {
                _selectedProblem = null;
              });
            },
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
