import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';

@RoutePage()
class CompanyDocumentsPage extends StatefulWidget {
  const CompanyDocumentsPage({super.key});

  @override
  State<CompanyDocumentsPage> createState() => _CompanyDocumentsPageState();
}

class _CompanyDocumentsPageState extends State<CompanyDocumentsPage> {
  File? registrationDocument;
  File? portfolioDocument;

  Future<void> _pickFile(String documentType) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        setState(() {
          if (documentType == 'registration') {
            registrationDocument = File(result.files.single.path!);
          } else if (documentType == 'portfolio') {
            portfolioDocument = File(result.files.single.path!);
          }
        });
      }
    } catch (e) {
      print('Error picking file: $e');
    }
  }

  bool get canSubmit {
    return registrationDocument != null && portfolioDocument != null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(top: 24, bottom: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Документы компании',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Свидетельство о регистрации',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DocumentUploadCard(
                        title: 'Нажмите для загрузки',
                        subtitle: 'PDF, JPG до 10 МБ',
                        uploadedFile: registrationDocument,
                        onTap: () => _pickFile('registration'),
                        onRemove: () {
                          setState(() {
                            registrationDocument = null;
                          });
                        },
                      ),
                      const SizedBox(height: 32),
                      const Text(
                        'Портфолио работ',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.black87,
                        ),
                      ),
                      const SizedBox(height: 12),
                      DocumentUploadCard(
                        title: 'Фото выполненных работ',
                        subtitle: 'PDF, JPG до 10 МБ',
                        uploadedFile: portfolioDocument,
                        onTap: () => _pickFile('portfolio'),
                        onRemove: () {
                          setState(() {
                            portfolioDocument = null;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: SizedBox(
                  width: double.infinity,
                  height: 56,
                  child: ElevatedButton(
                    onPressed: canSubmit
                        ? () {
                            context.router.push(ApplicationSubmittedRoute());
                          }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF4A9EFF),
                      disabledBackgroundColor:
                          const Color(0xFF4A9EFF).withValues(alpha: 0.5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      'Подать заявку',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DocumentUploadCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final File? uploadedFile;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  const DocumentUploadCard({
    super.key,
    required this.title,
    required this.subtitle,
    this.uploadedFile,
    required this.onTap,
    required this.onRemove,
  });

  String _getFileName(File file) {
    return file.path.split('/').last;
  }

  String _getFileSize(File file) {
    final bytes = file.lengthSync();
    if (bytes < 1024) return '$bytes Б';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} КБ';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} МБ';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: uploadedFile == null ? onTap : null,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(16),
        ),
        child: uploadedFile == null
            ? Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    Assets.images.png.upload11.path,
                    width: 37,
                    height: 37,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              )
            : Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A9EFF).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      color: Color(0xFF4A9EFF),
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getFileName(uploadedFile!),
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.black87,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 2),
                        Text(
                          _getFileSize(uploadedFile!),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey.shade600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onRemove,
                    icon: const Icon(
                      Icons.close,
                      color: Colors.black54,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
