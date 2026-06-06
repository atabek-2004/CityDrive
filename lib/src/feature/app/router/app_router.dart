import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:city_drive/src/feature/app/presentation/pages/base_second.dart';
import 'package:city_drive/src/feature/app/presentation/pages/role_selection_page.dart';
import 'package:city_drive/src/feature/app/presentation/pages/launcher.dart';
import 'package:city_drive/src/feature/app/presentation/pages/splash_screen.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';
import 'package:city_drive/src/feature/auth/presentation/auth.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/application_submitted_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/auth_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/auth_second_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/company_data_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/company_documents_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/pending_approval_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/sign_up_page.dart';
import 'package:city_drive/src/feature/main/presentation/main_feed.dart';
import 'package:city_drive/src/feature/main/presentation/pages/my_responses_page.dart';
import 'package:city_drive/src/feature/main/presentation/pages/notification_page.dart';
import 'package:city_drive/src/feature/main/presentation/pages/notifications_page.dart';
import 'package:city_drive/src/feature/main/presentation/pages/problem_detail_page.dart';
import 'package:city_drive/src/feature/main/presentation/pages/report_detail_page.dart';
import 'package:city_drive/src/feature/main/presentation/pages/controller_accept_application_page.dart';
import 'package:city_drive/src/feature/main/presentation/pages/mark_application_success_page.dart';
import 'package:city_drive/src/feature/main/presentation/pages/submit_application_page.dart';
import 'package:city_drive/src/feature/profile/presentation/profile.dart'
    hide ProfilePage;
import 'package:city_drive/src/feature/search/model/road_problem_dto.dart';
import 'package:city_drive/src/feature/search/presentation/pages/camera_preview_page.dart';
import 'package:city_drive/src/feature/search/presentation/pages/comments_page.dart';
import 'package:city_drive/src/feature/search/presentation/pages/map_page.dart';
import 'package:city_drive/src/feature/search/presentation/pages/report_success_page.dart';
import 'package:city_drive/src/feature/search/presentation/pages/road_problem_detail_page.dart';
import 'package:city_drive/src/feature/search/presentation/pages/work_report_page.dart';

import '../../profile/presentation/profile.dart' show ProfilePage;

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: CustomSplashRoute.page,
          initial: true,
        ),
        AutoRoute(
          page: LauncherRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: MainRouteFirst.page,
            ),
            AutoRoute(page: MapRoute.page),
            AutoRoute(page: MyResponsesRoute.page),
            AutoRoute(page: ProfileRoute.page),
          ],
        ),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: AuthRoute.page),
        AutoRoute(page: PasswordRecoveryRoute.page),
        AutoRoute(page: EnterSmsCodeRoute.page),
        AutoRoute(page: SignUpFirstRoute.page),
        AutoRoute(page: BaseSecondRoute.page),
        AutoRoute(page: NewPasswordRoute.page),
        AutoRoute(page: RoleSelectionRoute.page),
        AutoRoute(page: AuthSecondRoute.page),
        AutoRoute(page: SignUpSecondRoute.page),
        AutoRoute(page: CompanyDataRoute.page),
        AutoRoute(page: CompanyDocumentsRoute.page),
        AutoRoute(page: ApplicationSubmittedRoute.page),
        AutoRoute(page: PendingApprovalRoute.page),
        AutoRoute(page: NotificationRoute.page),
        AutoRoute(page: NotificationsRoute.page),
        AutoRoute(page: ProblemDetailRoute.page),
        AutoRoute(page: SubmitApplicationRoute.page),
        AutoRoute(page: ControllerAcceptApplicationRoute.page),
        AutoRoute(page: MarkApplicationSuccessRoute.page),
        AutoRoute(page: WorkReportRoute.page),
        AutoRoute(page: ReportSuccessRoute.page),
        AutoRoute(page: ReportDetailRoute.page),
        AutoRoute(page: RoadProblemDetailRoute.page),
        AutoRoute(page: CameraPreviewRoute.page),
        AutoRoute(page: CommentsRoute.page),
        AutoRoute(page: EditProfileRoute.page),
        AutoRoute(page: DocumentsRoute.page),
        AutoRoute(page: ChangePasswordRoute.page),
        AutoRoute(page: ChangePhoneRoute.page),
      ];
}
