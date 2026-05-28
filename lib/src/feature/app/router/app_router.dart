import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ikidz/src/feature/app/presentation/pages/base_second.dart';
import 'package:ikidz/src/feature/app/presentation/pages/role_selection_page.dart';
import 'package:ikidz/src/feature/app/presentation/pages/launcher.dart';
import 'package:ikidz/src/feature/app/presentation/pages/splash_screen.dart';
import 'package:ikidz/src/feature/app/presentation/pages/temp_page.dart';
import 'package:ikidz/src/feature/auth/models/user_dto.dart';
import 'package:ikidz/src/feature/auth/presentation/auth.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/application_submitted_page.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/auth_page.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/auth_second_page.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/company_data_page.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/company_documents_page.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/onboarding_second_page.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/sign_up_page.dart';
import 'package:ikidz/src/feature/chat/model/chat_dto.dart';
import 'package:ikidz/src/feature/chat/presentation/pages/detail_image_page.dart';
import 'package:ikidz/src/feature/main/presentation/main_feed.dart';
import 'package:ikidz/src/feature/main/presentation/pages/add_card_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/add_child_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/change_card_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/hall_details_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/hall_schedule_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/my_children_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/my_responses_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/new_ceneters_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/notification_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/notifications_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/payment_methods_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/payment_was_successful_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/problem_detail_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/report_detail_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/submit_application_page.dart';
import 'package:ikidz/src/feature/main/presentation/pages/subscription_page.dart';
import 'package:ikidz/src/feature/profile/presentation/pages/freeze_subscription_page.dart';
import 'package:ikidz/src/feature/profile/presentation/pages/ikidz_subscriptions_page.dart';
import 'package:ikidz/src/feature/profile/presentation/pages/my_children_profile_page.dart';
import 'package:ikidz/src/feature/profile/presentation/profile.dart'
    hide ProfilePage;
import 'package:ikidz/src/feature/qr/presentation/pages/qr_page.dart';
import 'package:ikidz/src/feature/schedule/presentation/pages/schedule_class_page.dart';
import 'package:ikidz/src/feature/schedule/presentation/pages/schedule_page.dart';
import 'package:ikidz/src/feature/search/model/road_problem_dto.dart';
import 'package:ikidz/src/feature/search/model/schedule_dto.dart';
import 'package:ikidz/src/feature/search/presentation/pages/camera_preview_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/comments_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/confirm_entry_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/listing_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/map_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/report_success_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/road_problem_detail_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/upcoming_classes_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/class_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/add_child_search_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/search_active_page.dart';
import 'package:ikidz/src/feature/search/presentation/pages/map_page.dart';
import 'package:ikidz/src/feature/profile/presentation/profile.dart'
    hide ProfilePage;
import 'package:ikidz/src/feature/search/presentation/pages/work_report_page.dart';

import '../../profile/presentation/profile.dart' show ProfilePage;

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        /// Splash
        AutoRoute(
          page: CustomSplashRoute.page,
          initial: true,
        ),

        /// Root
        AutoRoute(
          page: LauncherRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: MainRouteFirst.page,
            ),
            AutoRoute(page: MapRoute.page),
            AutoRoute(page: MyResponsesRoute.page),
            AutoRoute(page: ScheduleRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),

        /// Auth
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: OnboardingSeondRoute.page),
        AutoRoute(page: PasswordRecoveryRoute.page),
        AutoRoute(page: EnterSmsCodeRoute.page),
        AutoRoute(page: SignUpFirstRoute.page),
        AutoRoute(page: BaseSecondRoute.page),
        // AutoRoute(page: SignUpSecondRoute.page),
        AutoRoute(page: NewPasswordRoute.page),

        AutoRoute(page: RoleSelectionRoute.page),

        AutoRoute(page: AuthSecondRoute.page),

        AutoRoute(page: SignUpSecondRoute.page),
        AutoRoute(page: CompanyDataRoute.page),
        AutoRoute(page: CompanyDocumentsRoute.page),

        AutoRoute(page: ApplicationSubmittedRoute.page),

        /// Main

        AutoRoute(page: SubscriptionRoute.page),
        AutoRoute(page: PaymentMethodsRoute.page),
        AutoRoute(page: PaymentWasSuccessfulRoute.page),
        AutoRoute(page: AddChildRoute.page),
        AutoRoute(page: MyChildrenRoute.page),
        AutoRoute(page: NewCenetersRoute.page),
        AutoRoute(page: HallDetailsRoute.page),
        AutoRoute(page: HallScheduleRoute.page),
        AutoRoute(page: NotificationRoute.page),
        AutoRoute(page: NotificationsRoute.page),
        AutoRoute(page: AddCardRoute.page),
        AutoRoute(page: ChangeCardRoute.page),
        AutoRoute(page: ProblemDetailRoute.page),
        AutoRoute(page: SubmitApplicationRoute.page),
        AutoRoute(page: WorkReportRoute.page),
        AutoRoute(page: ReportSuccessRoute.page),

        AutoRoute(page: ReportDetailRoute.page),

        /// Search
        AutoRoute(page: SearchActiveRoute.page),
        AutoRoute(page: ClassRoute.page),
        AutoRoute(page: AddChildSearchRoute.page),
        AutoRoute(page: ConfirmEntryRoute.page),
        AutoRoute(page: UpcomingClassesRoute.page),
        AutoRoute(page: MapRoute.page),
        AutoRoute(page: ListingRoute.page),
        AutoRoute(page: RoadProblemDetailRoute.page),
        AutoRoute(page: CameraPreviewRoute.page),
        AutoRoute(page: CommentsRoute.page),

        // Schedule
        AutoRoute(page: ScheduleClassRoute.page),

        /// Chat
        // AutoRoute(page: ChatsRoute.page),
        // AutoRoute(page: ChatsDetailRoute.page),
        // AutoRoute(page: DetailImageRoute.page),

        // /// Profile
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: DocumentsRoute.page),
        AutoRoute(page: MyChildrenProfileRoute.page),
        AutoRoute(page: IkidzSubscriptionsRoute.page),
        AutoRoute(page: FreezeSubscriptionRoute.page),

        // AutoRoute(page: MyDataRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: ChangePhoneRoute.page),
        // AutoRoute(page: EditProfileRoute.page),
        // AutoRoute(page: DocumentsRoute.page),
        // AutoRoute(page: ScanDocRoute.page),
        // AutoRoute(page: BonusRoute.page),
        // AutoRoute(page: OrdersDetailRoute.page),
        // AutoRoute(page: AddressRoute.page),
        // AutoRoute(page: StatisticRoute.page),
      ];
}
