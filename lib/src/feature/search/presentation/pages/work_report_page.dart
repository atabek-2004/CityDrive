import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:city_drive/src/core/local_storage/report_status.dart';
import 'package:city_drive/src/core/theme/resources.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/search/bloc/road_problems_provider.dart';
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';

@RoutePage()
class WorkReportPage extends StatefulWidget {
  const WorkReportPage({super.key, required this.problem});

  final RoadProblemDTO problem;

  @override
  State<WorkReportPage> createState() => _WorkReportPageState();
}

class _WorkReportPageState extends State<WorkReportPage> {
  final TextEditingController _descriptionController = TextEditingController();
  final List<File?> _images = [null, null, null];
  final ImagePicker _picker = ImagePicker();
  bool _isSubmitting = false;

  Future<void> _pickImage(int index) async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      setState(() => _images[index] = File(image.path));
    }
  }

  Future<void> _submit() async {
    if (_isSubmitting) return;
    setState(() => _isSubmitting = true);

    final imagePaths = _images
        .whereType<File>()
        .map((f) => f.path)
        .toList();

    final updated = RoadProblemDTO(
      id: widget.problem.id,
      authorUserId: widget.problem.authorUserId,
      assignedControllerId: widget.problem.assignedControllerId,
      title: widget.problem.title,
      description: _descriptionController.text.isEmpty
          ? widget.problem.description
          : _descriptionController.text,
      address: widget.problem.address,
      latitude: widget.problem.latitude,
      longitude: widget.problem.longitude,
      type: widget.problem.type,
      severity: widget.problem.severity,
      status: ReportStatus.fixed,
      reportedDate: widget.problem.reportedDate,
      images: imagePaths.isNotEmpty ? imagePaths : widget.problem.images,
      author: widget.problem.author,
      likes: widget.problem.likes,
      commentsCount: widget.problem.commentsCount,
      comments: widget.problem.comments,
    );

    await context.read<RoadProblemsProvider>().updateProblem(updated);

    if (!mounted) return;
    setState(() => _isSubmitting = false);
    context.router.push(ReportSuccessRoute(problem: widget.problem));
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.localized;
    final p = widget.problem;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => context.router.maybePop(),
        ),
        title: Text(
          l10n.cityDriveWorkReportTitle,
          style: const TextStyle(
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
                      Text(
                        p.title ?? l10n.cityDrivePotholeRepair,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const Gap(4),
                      Text(
                        p.address ?? '—',
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Gap(32),
            Text(
              l10n.cityDriveWorkPhoto,
              style: const TextStyle(
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
            Text(
              l10n.cityDriveWorkDescription,
              style: const TextStyle(
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
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: l10n.cityDriveWorkDescriptionHint,
                  hintStyle: const TextStyle(color: Colors.grey, fontSize: 14),
                ),
              ),
            ),
            const Gap(32),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _isSubmitting ? null : _submit,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.mainColor,
                  padding: const EdgeInsets.symmetric(vertical: 18),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                ),
                child: _isSubmitting
                    ? const SizedBox(
                        height: 22,
                        width: 22,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        l10n.cityDriveSubmitReport,
                        style: const TextStyle(
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
