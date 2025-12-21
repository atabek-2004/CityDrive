import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';

class ChooseImageBottomSheet extends StatefulWidget {
  final bool avatar;
  final Function(File?) image;

  const ChooseImageBottomSheet({
    super.key,
    required this.image,
    this.avatar = true,
  });

  static Future show(
    BuildContext context, {
    required Function(File?) image,
    bool? avatar,
  }) async =>
      showModalBottomSheet(
        context: context,
        backgroundColor: Colors.white,
        isScrollControlled: true,
        useSafeArea: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(14)),
        ),
        builder: (context) => ChooseImageBottomSheet(
          image: image,
          avatar: avatar ?? true,
          // salary: salary,
          // minSalary: minSalary,
          // maxSalary: maxSalary,
        ),
      );

  @override
  State<ChooseImageBottomSheet> createState() => _ChooseImageBottomSheetState();
}

class _ChooseImageBottomSheetState extends State<ChooseImageBottomSheet> {
  @override
  void initState() {
    super.initState();
  }

  File? _imageCamera;
  File? _imageGalery;
  final ImagePicker _imagePicker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(14),
          color: Colors.white,
        ),
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(8),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 4,
                width: 48,
                decoration: BoxDecoration(
                  color: const Color(0xFFCCCCCC),
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            const Gap(16),
            Padding(
              padding: const EdgeInsets.only(top: 22, bottom: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                   Text(
                    context.localized.photo_selection,
                    style: AppTextStyles.title20MediumW600,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(Assets.icons.closeIcon1.path),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () async {
                try {
                  //   final permissionStatus = await ImageUtil.checkPermissionStatus(context);

                  //   if (permissionStatus) {
                  final imgCamera = await _imagePicker.pickImage(source: ImageSource.camera);
                  if (imgCamera != null) {
                    if (widget.avatar) {
                      final File? croppedFile = await _cropImageAvatar(File(imgCamera.path));
                      if (croppedFile != null) {
                        setState(() {
                          _imageCamera = croppedFile;
                        });
                      }
                    } else {
                      final File? croppedFile = await _cropImage(File(imgCamera.path));
                      if (croppedFile != null) {
                        setState(() {
                          _imageCamera = croppedFile;
                        });
                      }
                    }
                  }
                  // if (_imageCamera != null) {
                  //   File? croppedFile = await _cropImage(File(_imageCamera?.path));
                  //   if (croppedFile != null) {
                  //     setState(() {
                  //       _image = croppedFile;
                  //     });
                  //   }
                  // }
                  // if (_imageCamera != null && context.mounted) {
                  //   final cropImageResult = await showMaterialImageCropper(
                  //     context,
                  //     cropPathFn: (builder, size) => CropShape.ellipse(
                  //       Ellipse2(
                  //         center: Vector2(size.width / 2, size.height / 2),
                  //         radii: Vector2(10, 10),
                  //       ),
                  //     ),
                  //     imageProvider: FileImage(File(_imageCamera?.path ?? '')),
                  //   );
                  // }

                  //   if (!context.mounted) return;
                  //   if (cropImageResult == null) {
                  //     debugPrint('CropImageResult Is Null');
                  //     return;
                  //   }

                  //   final imageByteData = await cropImageResult.uiImage.toByteData(
                  //     format: ImageByteFormat.png,
                  //   );

                  //   if (!context.mounted) return;
                  //   if (imageByteData == null) {
                  //     Toaster.showErrorTopShortToast(context, 'Image Byte Data Is Null');
                  //     return;
                  //   }

                  //   final imageByteUint8List = imageByteData.buffer.asUint8List();

                  //   // Crop-тан кейінгі кескінді файл ретінде сақтаймыз
                  //   final tempDir = await getTemporaryDirectory();
                  //   final tempFile = File('${tempDir.path}/cropped_image.png');
                  //   await tempFile.writeAsBytes(imageByteUint8List);

                  //   _imageCamera = tempFile;

                  // }
                  //   }
                } catch (e) {
                  debugPrint('Failed to pick image: $e');
                  if (!context.mounted) return;
                  Toaster.showErrorTopShortToast(
                    context,
                    'Failed to pick image: $e',
                  );
                } finally {
                  if (context.mounted) {
                    widget.image.call(_imageCamera);
                    context.router.maybePop();
                  }
                }
              },
              child: Container(
                height: 70,
                width: 100,
                decoration: BoxDecoration(
                  color: AppColors.muteGrey,
                  borderRadius: BorderRadius.circular(16),
                ),
                alignment: Alignment.center,
                child: SvgPicture.asset(
                  Assets.icons.cameraBlack.path,
                  height: 20,
                ),
              ),
            ),
            const Gap(22),
            CustomButton(
              onPressed: () async {
                try {
                  //   final permissionStatus = await ImageUtil.checkPermissionStatus(context);

                  //   if (permissionStatus) {
                  // _imageGalery = await _imagePicker.pickImage(source: ImageSource.gallery);
                  final XFile? pickedFile = await _imagePicker.pickImage(source: ImageSource.gallery);

                  if (pickedFile != null) {
                    if (widget.avatar) {
                      final File? croppedFile = await _cropImageAvatar(File(pickedFile.path));
                      if (croppedFile != null) {
                        setState(() {
                          _imageGalery = croppedFile;
                        });
                      }
                    } else {
                      final File? croppedFile = await _cropImage(File(pickedFile.path));
                      if (croppedFile != null) {
                        setState(() {
                          _imageGalery = croppedFile;
                        });
                      }
                    }
                  }
                  // if (_imageGalery != null && context.mounted) {
                  //   log('sfdrge');
                  //   final cropImageResult = await showMaterialImageCropper(
                  //     context,
                  //      cropPathFn: (builder, size) => CropShape.custom(
                  //       croppy.Path()
                  //         ..addRRect(RRect.fromRectAndCorners(
                  //           Rect.fromLTWH(0, 0, size.width, size.height), // Төртбұрыш өлшемдері
                  //           topLeft: Radius.circular(10), // Жоғарғы сол жақ бұрыш радиусы
                  //           topRight: Radius.circular(10), // Жоғарғы оң жақ бұрыш радиусы
                  //           bottomLeft: Radius.circular(10), // Төменгі сол жақ бұрыш радиусы
                  //           bottomRight: Radius.circular(10), // Төменгі оң жақ бұрыш радиусы
                  //         )),
                  //     ),

                  //     imageProvider: FileImage(File(_imageGalery?.path ?? '')),
                  //   );
                  // }

                  //   if (!context.mounted) return;
                  //   if (cropImageResult == null) {
                  //     debugPrint('CropImageResult Is Null');
                  //     return;
                  //   }

                  //   final imageByteData = await cropImageResult.uiImage.toByteData(
                  //     format: ImageByteFormat.png,
                  //   );

                  //   if (!context.mounted) return;
                  //   if (imageByteData == null) {
                  //     Toaster.showErrorTopShortToast(context, 'Image Byte Data Is Null');
                  //     return;
                  //   }

                  //   final imageByteUint8List = imageByteData.buffer.asUint8List();

                  //   // Crop-тан кейінгі кескінді файл ретінде сақтаймыз
                  //   final tempDir = await getTemporaryDirectory();
                  //   final tempFile = File('${tempDir.path}/cropped_image.png');
                  //   await tempFile.writeAsBytes(imageByteUint8List);

                  //   _imageGalery = tempFile;
                  //   setState(() {});
                  // }
                  //   }
                } catch (e) {
                  debugPrint('Failed to pick image: $e');
                  if (!context.mounted) return;
                  Toaster.showErrorTopShortToast(
                    context,
                    'Failed to pick image: $e',
                  );
                } finally {
                  if (context.mounted) {
                    widget.image.call(_imageGalery);
                    context.router.maybePop();
                  }
                }
              },
              style: CustomButtonStyles.primaryButtonStyle(context),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                   Text(
                    context.localized.choose_from_the_gallery,
                    style: AppTextStyles.body16Regular400MainColor,
                  ),
                  const Gap(6),
                  SvgPicture.asset(Assets.icons.addPlus.path),
                ],
              ),
            ),
            const Gap(14),
          ],
        ),
      ),
    );
  }

  Future<File?> _cropImage(File imageFile) async {
    // Суретті қиып алу.
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      // Аспекті қатынасын 5:3 етіп бекіту.
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          // lockAspectRatio: true, // Аспекті қатынасын бекіту.
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: '',
          // aspectRatioLockEnabled: true, // iOS-та аспекті қатынасын бекіту.
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );

    // Егер сурет қиылған болса, жаңа файлды қайтарамыз.
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }

  Future<File?> _cropImageAvatar(File imageFile) async {
    // Суретті қиып алу.
    final CroppedFile? croppedFile = await ImageCropper().cropImage(
      sourcePath: imageFile.path,
      // Аспекті қатынасын 5:3 етіп бекіту.
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: '',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          // lockAspectRatio: true, // Аспекті қатынасын бекіту.
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: '',
          // aspectRatioLockEnabled: true, // iOS-та аспекті қатынасын бекіту.
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
      ],
    );

    // Егер сурет қиылған болса, жаңа файлды қайтарамыз.
    if (croppedFile != null) {
      return File(croppedFile.path);
    }
    return null;
  }
}
