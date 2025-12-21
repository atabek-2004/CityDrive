import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/constant/constants.dart';
import 'package:ikidz/src/core/constant/generated/assets.gen.dart';
import 'package:ikidz/src/core/presentation/widgets/buttons/custom_button.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart' as gmaps;
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/image_util.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';
import 'package:ikidz/src/feature/main/bloc/center_detail_cubit.dart';

@RoutePage()
class HallDetailsPage extends StatefulWidget implements AutoRouteWrapper {
  final int ceterId;
  const HallDetailsPage({
    super.key,
    required this.ceterId,
  });

  @override
  State<HallDetailsPage> createState() => _HallDetailsPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (context) => CenterDetailCubit(
        repository: context.repository.mainRepository,
      ),
      child: this,
    );
  }
}

class _HallDetailsPageState extends State<HallDetailsPage> {
  int currentIndex = 0;
  // List<String> images = [
  //   Assets.images.png.hallDetailBack.path,
  //   Assets.images.png.advertiseInfoFrame.path
  // ];

  gmaps.GoogleMapController? _mapController;

  gmaps.LatLng _selectedLocation = const gmaps.LatLng(43.238949, 76.889709);

  Set<gmaps.Marker> _markers = {};

  // final List<String> directions = [
  //   'Верховая езда',
  //   'Плавание',
  //   'Рисование',
  //   'Музыка',
  //   'Танцы',
  // ];

  @override
  void initState() {
    BlocProvider.of<CenterDetailCubit>(context).centerDetail(
      id: widget.ceterId,
    );
    super.initState();
  }

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
      body: BlocBuilder<CenterDetailCubit, CenterDetailState>(
        builder: (context, state) {
          return state.maybeWhen(
            orElse: () => const CustomLoadingOverlayWidget(),
            loaded: (center) {
              print(center);
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      alignment: Alignment.bottomCenter,
                      clipBehavior: Clip.none,
                      children: [
                        Container(
                          height: 240,
                          clipBehavior: Clip.antiAlias,
                          decoration: const BoxDecoration(),
                          child: CarouselSlider(
                            options: CarouselOptions(
                              height: 240,
                              autoPlay: false,
                              viewportFraction: 1,
                              onPageChanged: (index, reason) {
                                setState(() {
                                  currentIndex = index;
                                });
                              },
                            ),
                            items: center.banners?.map((imagePath) {
                              return SizedBox(
                                width: double.infinity,
                                height: 164,
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(16),
                                      topRight: Radius.circular(16)),
                                  child: CachedNetworkImage(
                                      imageUrl:
                                          imagePath.image ?? NO_IMAGE_AVAILABLE,
                                      fit: BoxFit.cover,
                                      width: double.infinity,
                                      height: double.infinity,
                                      progressIndicatorBuilder:
                                          ImageUtil.cachedLoadingBuilder),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        if ((center.banners?.isNotEmpty ?? false))
                          Positioned(
                            bottom: 10,
                            child: DotsIndicator(
                              dotsCount: center.banners!.length,
                              position: currentIndex.toDouble(),
                              decorator: const DotsDecorator(
                                size: Size(6, 6),
                                activeSize: Size(8, 8),
                                activeColor: AppColors.black000100,
                                color: Colors.grey,
                                spacing: EdgeInsets.all(4),
                              ),
                            ),
                          ),
                        Positioned(
                          right: 16,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: FractionalTranslation(
                              translation: const Offset(0, 0.5),
                              child: center.logo != null
                                  ? ClipOval(
                                      child: Image.network(
                                        center.logo!,
                                        height: 100,
                                        width: 100,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : const SizedBox.shrink(),
                            ),
                          ),
                        ),
                      ],
                    ),
                    // detail informations
                    const Gap(16),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            center.name ?? '',
                            style: AppTextStyles.title18W700
                                .copyWith(color: AppColors.tabActive),
                          ),
                          const Gap(4),
                          Text(
                            'Современные танцы',
                            style: AppTextStyles.fs14w400
                                .copyWith(color: AppColors.text595959),
                          ),
                          const Gap(16),
                          Text(
                            'О зале',
                            style: AppTextStyles.title18W700
                                .copyWith(color: AppColors.tabActive),
                          ),
                          const Gap(4),
                          Text(
                            center.description ?? '',
                            style: AppTextStyles.fs14w400
                                .copyWith(color: AppColors.text595959),
                          ),
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
                                            ..add(Factory<
                                                    EagerGestureRecognizer>(
                                                () =>
                                                    EagerGestureRecognizer())),
                                          onMapCreated: (controller) {
                                            _mapController = controller;

                                            final lat = double.tryParse(center
                                                    .latitude
                                                    .toString()) ??
                                                43.238949;
                                            final lng = double.tryParse(center
                                                    .longitude
                                                    .toString()) ??
                                                76.889709;

                                            _mapController?.animateCamera(
                                              gmaps.CameraUpdate.newLatLngZoom(
                                                gmaps.LatLng(lat, lng),
                                                15.0,
                                              ),
                                            );

                                            setState(() {
                                              _markers = {
                                                gmaps.Marker(
                                                  icon: gmaps.BitmapDescriptor
                                                      .defaultMarkerWithHue(
                                                          gmaps.BitmapDescriptor
                                                              .hueAzure),
                                                  markerId:
                                                      const gmaps.MarkerId(
                                                          'center_marker'),
                                                  position:
                                                      gmaps.LatLng(lat, lng),
                                                  infoWindow: gmaps.InfoWindow(
                                                    title:
                                                        center.name ?? 'Центр',
                                                    snippet:
                                                        center.address ?? '',
                                                  ),
                                                ),
                                              };
                                            });
                                          },
                                          initialCameraPosition:
                                              gmaps.CameraPosition(
                                            target: gmaps.LatLng(
                                              double.tryParse(center.latitude
                                                      .toString()) ??
                                                  43.238949,
                                              double.tryParse(center.longitude
                                                      .toString()) ??
                                                  76.889709,
                                            ),
                                            zoom: 14.0,
                                          ),
                                          onTap: (gmaps.LatLng position) {
                                            setState(() {
                                              _selectedLocation = position;
                                            });
                                          },
                                          markers: _markers,
                                          myLocationEnabled: false,
                                          myLocationButtonEnabled: false,
                                          zoomControlsEnabled: false,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                const Gap(12),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
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
                                              style: AppTextStyles.body14w400
                                                  .copyWith(
                                                color: AppColors.black141414,
                                              ),
                                            ),
                                            const Gap(4),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                  Assets.icons.location.path,
                                                  color:
                                                      const Color(0xFF1890FF),
                                                ),
                                                const Gap(5),
                                                Text(
                                                  'Проспект Сейфуллина 45',
                                                  style: AppTextStyles
                                                      .body12W500
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
                                    SvgPicture.asset(
                                        Assets.icons.arrowIos.path),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const Gap(16),
                          Text(
                            'Направления',
                            style: AppTextStyles.title18W700
                                .copyWith(color: AppColors.tabActive),
                          ),
                          const Gap(4),
                          Wrap(
                            spacing: 8,
                            runSpacing: 8,
                            children: center.activities?.map((title) {
                              return Container(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 8, bottom: 8),
                                decoration: BoxDecoration(
                                  color: AppColors.backgroundButtonF5F5F5,
                                  borderRadius: BorderRadius.circular(14),
                                ),
                                child: Text(
                                  title.name ?? '',
                                  style: AppTextStyles.body14W500.copyWith(
                                    color: AppColors.text595959,
                                  ),
                                ),
                              );
                            }).toList() ?? [],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: Padding(
        padding:
            const EdgeInsets.only(bottom: 40, left: 16, right: 16, top: 10),
        child: CustomButton(
          onPressed: () {
            context.router.push(HallScheduleRoute(centerId: 3, dayOfWeek: 1));
          },
          style: null,
          child: const Text(
            'Расписание',
            style: AppTextStyles.title18MediumW600,
          ),
        ),
      ),
    );
  }
}
