import 'package:auto_route/auto_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_material_button.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/schedule/presentation/widgets/cancel_class_dialog.dart';
import 'package:ikidz/src/feature/schedule/presentation/widgets/parent_give_docx_conteyner.dart';
import 'package:ikidz/src/feature/schedule/presentation/widgets/recorded_conteyner.dart';

class Direction {
  final String text;
  final String svg;

  Direction({required this.text, required this.svg});
}

@RoutePage()
class ScheduleClassPage extends StatefulWidget {
  const ScheduleClassPage({super.key});

  @override
  State<ScheduleClassPage> createState() => _ScheduleClassPageState();
}

class _ScheduleClassPageState extends State<ScheduleClassPage> {
  Set<gmaps.Marker> _markers = {};
  List<String> clothes = [
    'Удобные брюки без швов внутри',
    'Футболка или лонгслив из дышащей ткани',
    'Шлем для верховой езды',
  ];

  List<String> images = [
    Assets.images.png.hallDetailBack.path,
    Assets.images.png.advertiseInfoFrame.path
  ];

  final List<Direction> directions = [
    Direction(text: 'Спорт', svg: Assets.icons.sport.path),
    Direction(text: '50 минут', svg: Assets.icons.time.path),
    Direction(text: '7+ лет', svg: Assets.icons.person.path),
  ];

  gmaps.GoogleMapController? _mapController;
  int currentIndex = 0;
  gmaps.LatLng _selectedLocation = const gmaps.LatLng(43.238949, 76.889709);
  final time = '13:00';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: TextButton.icon(
          onPressed: () {
            context.router.maybePop();
          },
          label: SvgPicture.asset(
            Assets.icons.backArrow.path,
            color: AppColors.black,
            height: 25,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 240,
              clipBehavior: Clip.antiAlias,
              decoration: const BoxDecoration(),
              child: Image.asset(
                fit: BoxFit.cover,
                Assets.images.png.clas.path,
              ),
            ),

            // detail informations
            const Gap(16),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Верховая езда',
                    style: AppTextStyles.title18W700
                        .copyWith(color: AppColors.tabActive),
                  ),
                  const Gap(4),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: directions.map((title) {
                      return Container(
                        padding: const EdgeInsets.only(
                            left: 12, right: 12, top: 8, bottom: 8),
                        decoration: BoxDecoration(
                          color: AppColors.backgroundButtonF5F5F5,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              title.text,
                              style: AppTextStyles.body14W500.copyWith(
                                color: AppColors.text595959,
                              ),
                            ),
                            const Gap(10),
                            SvgPicture.asset(title.svg),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                  const Gap(16),
                  RecordedConteyner(time: time),
                  const Gap(16),
                  Text(
                    'Локация',
                    style: AppTextStyles.title18W700
                        .copyWith(color: AppColors.tabActive),
                  ),
                  const Gap(6),
                  Container(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Stack(
                              children: [
                                gmaps.GoogleMap(
                                  gestureRecognizers: Set()
                                    ..add(Factory<EagerGestureRecognizer>(
                                        () => EagerGestureRecognizer())),
                                  onMapCreated: (controller) {
                                    _mapController = controller;
                                  },
                                  initialCameraPosition: gmaps.CameraPosition(
                                    target: _selectedLocation,
                                    zoom: 12.0,
                                  ),
                                  markers: _markers,
                                  onTap: (gmaps.LatLng position) {
                                    setState(() {
                                      _selectedLocation = position;
                                    });
                                  },
                                  myLocationEnabled: true,
                                  myLocationButtonEnabled: false,
                                ),
                              ],
                            ),
                          ),
                        ),
                        const Gap(12),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.images.png.child.path,
                                      width: 40,
                                      height: 40,
                                    ),
                                    const Gap(10),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Happy Choice',
                                          style:
                                              AppTextStyles.body14w400.copyWith(
                                            color: AppColors.black141414,
                                          ),
                                        ),
                                        const Gap(4),
                                        Row(
                                          children: [
                                            SvgPicture.asset(
                                              Assets.icons.location.path,
                                              color: const Color(0xFF1890FF),
                                            ),
                                            const Gap(5),
                                            Text(
                                              'Проспект Сейфуллина 45',
                                              style: AppTextStyles.body12W500
                                                  .copyWith(
                                                color: AppColors.text595959,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SvgPicture.asset(Assets.icons.arrowIos.path),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Gap(16),
                  Text(
                    'О занятии',
                    style: AppTextStyles.title18W700
                        .copyWith(color: AppColors.tabActive),
                  ),
                  const Gap(4),
                  Text(
                    'Занятия верховой ездой помогают укрепить здоровье, развить координацию и уверенность в себе. Под руководством опытных инструкторов дети учатся бережному отношению к животным и получают море положительных эмоций.',
                    style: AppTextStyles.fs14w400
                        .copyWith(color: AppColors.text595959),
                  ),
                  const Gap(16),
                  Text(
                    'Что взять с собой',
                    style: AppTextStyles.title18W700
                        .copyWith(color: AppColors.tabActive),
                  ),
                  const Gap(10),
                  ListView.separated(
                    separatorBuilder: (BuildContext context, int index) =>
                        const Gap(10),
                    padding: EdgeInsets.zero,
                    itemCount: clothes.length,
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      final clothe = clothes[index];
                      return Row(
                        children: [
                          SvgPicture.asset(
                            Assets.icons.doneBlue.path,
                            width: 34,
                            height: 34,
                          ),
                          const Gap(8),
                          Text(clothe),
                        ],
                      );
                    },
                  ),
                  const Gap(13),
                  const ParentGiveDocxConteyner(),
                ],
              ),
            ),
            const Gap(15),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 45, top: 12, right: 16, left: 16),
        child: Container(
          width: double.infinity,
          height: 52,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(color: AppColors.redF5222D),
          ),
          child: CustomMaterialButton(
            onTap: () {
              if (time != '12:00') {
                CancelClassDialog.show(
                  context,
                  title: 'Отмена невозможна',
                  subtitle: 'Запись нельзя отменить до занятия меньше часа.',
                );
              } else {
                CancelClassDialog.show(
                  context,
                  title: 'Вы успешно отменили',
                );
              }
            },
            child: Center(
              child: Text(
                'Отменить занятие',
                style: AppTextStyles.title18W600
                    .copyWith(color: AppColors.redF5222D),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
