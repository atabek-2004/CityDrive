import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';
import 'package:intl/intl.dart';

@RoutePage()
class CameraPreviewPage extends StatefulWidget {
  final String imagePath;
  final double? latitude;
  final double? longitude;

  const CameraPreviewPage({
    super.key,
    required this.imagePath,
    this.latitude,
    this.longitude,
  });

  @override
  State<CameraPreviewPage> createState() => _CameraPreviewPageState();
}

class _CameraPreviewPageState extends State<CameraPreviewPage> {
  final TextEditingController _commentController = TextEditingController();
  String _address = '';
  bool _isLoadingAddress = true;

  @override
  void initState() {
    super.initState();
    _getAddressFromCoordinates();
  }

  Future<void> _getAddressFromCoordinates() async {
    if (widget.latitude == null || widget.longitude == null) {
      setState(() {
        _address = context.localized.cityDriveCoordsUnavailable;
        _isLoadingAddress = false;
      });
      return;
    }

    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(
        widget.latitude!,
        widget.longitude!,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        setState(() {
          _address = '${place.street ?? ''}, ${place.subThoroughfare ?? ''}';
          _isLoadingAddress = false;
        });
      }
    } catch (e) {
      debugPrint('Ошибка получения адреса: $e');
      setState(() {
        _address =
            '${widget.latitude!.toStringAsFixed(5)}, ${widget.longitude!.toStringAsFixed(5)}';
        _isLoadingAddress = false;
      });
    }
  }

  Future<void> _publishReport() async {
    final user = context.repository.authRepository.user;
    final authorId = user?.id;
    if (authorId == null) {
      final l10n = context.localized;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(l10n.cityDriveLoginToPublish),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }
    final l10n = context.localized;
    final authorName = user?.fullName ?? l10n.cityDriveResident;

    final newProblem = RoadProblemDTO(
      id: 0,
      authorUserId: authorId,
      title: l10n.cityDriveRoadDamage,
      description: _commentController.text.isEmpty
          ? l10n.cityDriveDamageNeedsAttention
          : _commentController.text,
      address: _address,
      latitude: widget.latitude,
      longitude: widget.longitude,
      type: 'damage',
      severity: 'high',
      status: ReportStatus.newReport,
      reportedDate: DateTime.now(),
      images: [widget.imagePath],
      author: authorName,
      likes: 0,
      commentsCount: 0,
      comments: [],
    );

    await context.read<RoadProblemsProvider>().addProblem(newProblem);

    if (!mounted) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(l10n.cityDriveReportPublished),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
      ),
    );

    // Возврат на карту, без popUntilRoot — иначе GoogleMap теряет channel.
    context.router.maybePop();
  }

  void _retakePhoto() {
   
    context.router.maybePop();
  }

  @override
  void dispose() {
    _commentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final displayAddress = _isLoadingAddress && _address.isEmpty
        ? l10n.cityDriveDeterminingAddress
        : _address;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(l10n.cityDriveConfirm),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           
            Container(
              width: double.infinity,
              height: 280,
              color: Colors.grey[200],
              child: Image.file(
                File(widget.imagePath),
                fit: BoxFit.cover,
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                
                  Row(
                    children: [
                      Icon(
                        Icons.warning_amber_rounded,
                        size: 24,
                        color: Colors.grey[700],
                      ),
                      const Gap(12),
                      Text(
                        l10n.cityDriveRoadDamage,
                        style: AppTextStyles.body15w500,
                      ),
                    ],
                  ),
                  const Gap(16),

                
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        size: 24,
                        color: Colors.grey[700],
                      ),
                      const Gap(12),
                      Expanded(
                        child: _isLoadingAddress
                            ? const SizedBox(
                                height: 20,
                                width: 20,
                                child:
                                    Center(child: CircularProgressIndicator(strokeWidth: 2)),
                              )
                            : Text(
                                displayAddress,
                                style: AppTextStyles.body15w500,
                              ),
                      ),
                    ],
                  ),
                  const Gap(16),

                  
                  Row(
                    children: [
                      Icon(
                        Icons.access_time_outlined,
                        size: 24,
                        color: Colors.grey[700],
                      ),
                      const Gap(12),
                      Text(
                        DateFormat('HH:mm').format(DateTime.now()),
                        style: AppTextStyles.body15w500,
                      ),
                    ],
                  ),
                  const Gap(24),

                 
                  TextField(
                    controller: _commentController,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: l10n.cityDriveAddCommentHint,
                      hintStyle: TextStyle(
                        color: Colors.grey[400],
                        fontSize: 14,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide(color: Colors.grey[300]!),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide:
                            const BorderSide(color: AppColors.mainColor),
                      ),
                      suffixIcon: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.edit_outlined,
                          color: Colors.grey[400],
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                  const Gap(24),

                  
                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: ElevatedButton(
                      onPressed: _publishReport,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(
                            0xFF4FC3F7), 
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        l10n.cityDrivePublish,
                        style: AppTextStyles.title18W600.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const Gap(12),

                  SizedBox(
                    width: double.infinity,
                    height: 52,
                    child: OutlinedButton(
                      onPressed: _retakePhoto,
                      style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.black87,
                        side: BorderSide(color: Colors.grey[300]!),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                      ),
                      child: Text(
                        l10n.cityDriveRetake,
                        style: AppTextStyles.title18W600.copyWith(
                          color: Colors.black87,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
