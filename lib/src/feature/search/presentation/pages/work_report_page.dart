import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/search/presentation/pages/report_success_page.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ikidz/src/core/theme/resources.dart';

@RoutePage()
class WorkReportPage extends StatefulWidget {
  const WorkReportPage({super.key});

  @override
  State<WorkReportPage> createState() => _WorkReportPageState();
}

class _WorkReportPageState extends State<WorkReportPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final List<File?> _images = [null, null, null];
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() {
        _images[index] = File(image.path);
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Отчёт о выполнении работ',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            // Информация о работе
            Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    color: AppColors.mainColor,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: const Icon(
                    Icons.location_on,
                    color: Colors.white,
                    size: 40,
                  ),
                ),
                const Gap(16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Ямочный ремонт',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(4),
                      const Text(
                        'ул. Абая, 150',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                      const Gap(4),
                      const Text(
                        '850 000 ₸',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(32),

            // Фото выполненной работы
            const Text(
              'Фото выполненной работы',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(16),
            Row(
              children: [
                for (int i = 0; i < 3; i++) ...[
                  Expanded(
                    child: GestureDetector(
                      onTap: () => _pickImage(i),
                      child: Container(
                        height: 120,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                            strokeAlign: BorderSide.strokeAlignInside,
                          ),
                          borderRadius: BorderRadius.circular(12),
                          image: _images[i] != null
                              ? DecorationImage(
                                  image: FileImage(_images[i]!),
                                  fit: BoxFit.cover,
                                )
                              : null,
                        ),
                        child: _images[i] == null
                            ? Icon(
                                Icons.add,
                                size: 40,
                                color: Colors.grey.shade400,
                              )
                            : null,
                      ),
                    ),
                  ),
                  if (i < 2) const Gap(12),
                ],
              ],
            ),
            const Gap(32),

            // Описание работ
            const Text(
              'Описание работ',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const Gap(12),
            Container(
              height: 150,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: const Color(0xFFF5F5F5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                controller: _descriptionController,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Напишите как прошел работа',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
                style: const TextStyle(
                  fontSize: 14,
                ),
              ),
            ),
            const Gap(32),

            // Кнопка отправить
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Переход на страницу успеха
                 context.router.push(ReportSuccessRoute());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: const Text(
                  'Отправить отчет',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
