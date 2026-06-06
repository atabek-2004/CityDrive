import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/bloc/company_cubit.dart';

@RoutePage()
class CompanyDocumentsPage extends StatefulWidget implements AutoRouteWrapper {
  const CompanyDocumentsPage({
    super.key,
    this.rejectionReason,
    this.onDocumentsSubmitted,
  });

  final String? rejectionReason;

  /// When embedded in [ControllerRegistrationGate], advances the gate instead
  /// of replacing the navigation stack.
  final VoidCallback? onDocumentsSubmitted;

  @override
  State<CompanyDocumentsPage> createState() => _CompanyDocumentsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => CompanyCubit(
        repository: context.repository.companyRepository,
      ),
      child: this,
    );
  }
}

class _CompanyDocumentsPageState extends State<CompanyDocumentsPage> {
  static const _maxFileBytes = 10 * 1024 * 1024;

  File? registrationDocument;
  File? portfolioDocument;

  Future<void> _pickFile(String documentType) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'jpg', 'jpeg', 'png'],
        allowMultiple: false,
      );

      if (result == null || result.files.single.path == null) return;

      final file = File(result.files.single.path!);
      if (file.lengthSync() > _maxFileBytes) {
        if (mounted) {
          Toaster.showErrorTopShortToast(
            context,
            'Файл не должен превышать 10 МБ',
          );
        }
        return;
      }

      setState(() {
        if (documentType == 'registration') {
          registrationDocument = file;
        } else {
          portfolioDocument = file;
        }
      });
    } catch (e) {
      if (mounted) {
        Toaster.showErrorTopShortToast(context, e.toString());
      }
    }
  }

  bool get canSubmit =>
      registrationDocument != null && portfolioDocument != null;

  void _submit() {
    context.read<CompanyCubit>().uploadDocuments(
          registrationCertificate: registrationDocument!,
          portfolio: portfolioDocument!,
        );
  }

  @override
  Widget build(BuildContext context) {
    final rejectionReason = widget.rejectionReason;

    return LoaderOverlay(
      overlayWidgetBuilder: (_) => const CustomLoadingOverlayWidget(),
      child: BlocListener<CompanyCubit, CompanyState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => context.loaderOverlay.show(),
            documentsUploaded: (_) {
              context.loaderOverlay.hide();
              final onSubmitted = widget.onDocumentsSubmitted;
              if (onSubmitted != null) {
                onSubmitted();
              } else {
                context.router.replaceAll([const PendingApprovalRoute()]);
              }
            },
            error: (message) {
              context.loaderOverlay.hide();
              Toaster.showErrorTopShortToast(context, message);
            },
            orElse: () => context.loaderOverlay.hide(),
          );
        },
        child: Scaffold(
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
                          if (rejectionReason != null &&
                              rejectionReason.isNotEmpty) ...[
                            const SizedBox(height: 16),
                            Container(
                              width: double.infinity,
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                color: const Color(0xFFFFEBEE),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Text(
                                rejectionReason,
                                style: const TextStyle(
                                  color: Color(0xFFC62828),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
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
                              setState(() => registrationDocument = null);
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
                              setState(() => portfolioDocument = null);
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
                        onPressed: canSubmit ? _submit : null,
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
        ),
      ),
    );
  }
}

class DocumentUploadCard extends StatelessWidget {
  const DocumentUploadCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.onRemove,
    this.uploadedFile,
  });

  final String title;
  final String subtitle;
  final File? uploadedFile;
  final VoidCallback onTap;
  final VoidCallback onRemove;

  String _getFileName(File file) => file.path.split('/').last;

  String _getFileSize(File file) {
    final bytes = file.lengthSync();
    if (bytes < 1024) return '$bytes Б';
    if (bytes < 1024 * 1024) {
      return '${(bytes / 1024).toStringAsFixed(1)} КБ';
    }
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
                      color: const Color(0xFF4A9EFF).withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.description_outlined,
                      color: Color(0xFF4A9EFF),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _getFileName(uploadedFile!),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        Text(
                          _getFileSize(uploadedFile!),
                          style: TextStyle(color: Colors.grey.shade600),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: onRemove,
                    icon: const Icon(Icons.close),
                  ),
                ],
              ),
      ),
    );
  }
}
