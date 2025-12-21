import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:geocoding/geocoding.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/search/bloc/road_problems_provider.dart';
import 'package:ikidz/src/feature/search/model/road_problem_dto.dart';
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
  String _address = 'Определение адреса...';
  bool _isLoadingAddress = true;

  @override
  void initState() {
    super.initState();
    _getAddressFromCoordinates();
  }

  Future<void> _getAddressFromCoordinates() async {
    if (widget.latitude == null || widget.longitude == null) {
      setState(() {
        _address = 'Координаты недоступны';
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
        _address = 'ул. Абая, 143'; 
        _isLoadingAddress = false;
      });
    }
  }

  void _publishReport() {
    final newProblem = RoadProblemDTO(
      id: DateTime.now().millisecondsSinceEpoch,
      title: 'Повреждение дороги',
      description: _commentController.text.isEmpty
          ? 'Повреждение дороги требует внимания'
          : _commentController.text,
      address: _address,
      latitude: widget.latitude,
      longitude: widget.longitude,
      type: 'damage',
      severity: 'high',
      status: 'new',
      reportedDate: DateTime.now(),
      images: [widget.imagePath],
      author: 'Вы',
      likes: 0,
      commentsCount: 0,
      comments: [],
    );

    context.read<RoadProblemsProvider>().addProblem(newProblem);

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Отчет успешно опубликован!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );

   
    context.router.popUntilRoot();
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
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Подтвердить'),
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
                        'Повреждение дороги',
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
                                _address,
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
                      hintText: 'Добавить комментарий (необязательно)...',
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
                        'Опубликовать',
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
                        'Переснять',
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
