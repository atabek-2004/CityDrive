// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ApplicationSubmittedPage]
class ApplicationSubmittedRoute extends PageRouteInfo<void> {
  const ApplicationSubmittedRoute({List<PageRouteInfo>? children})
    : super(ApplicationSubmittedRoute.name, initialChildren: children);

  static const String name = 'ApplicationSubmittedRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ApplicationSubmittedPage();
    },
  );
}

/// generated route for
/// [AuthPage]
class AuthRoute extends PageRouteInfo<void> {
  const AuthRoute({List<PageRouteInfo>? children})
    : super(AuthRoute.name, initialChildren: children);

  static const String name = 'AuthRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthPage();
    },
  );
}

/// generated route for
/// [AuthSecondPage]
class AuthSecondRoute extends PageRouteInfo<void> {
  const AuthSecondRoute({List<PageRouteInfo>? children})
    : super(AuthSecondRoute.name, initialChildren: children);

  static const String name = 'AuthSecondRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AuthSecondPage();
    },
  );
}

/// generated route for
/// [BaseSecondPage]
class BaseSecondRoute extends PageRouteInfo<void> {
  const BaseSecondRoute({List<PageRouteInfo>? children})
    : super(BaseSecondRoute.name, initialChildren: children);

  static const String name = 'BaseSecondRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const BaseSecondPage();
    },
  );
}

/// generated route for
/// [CameraPreviewPage]
class CameraPreviewRoute extends PageRouteInfo<CameraPreviewRouteArgs> {
  CameraPreviewRoute({
    Key? key,
    required String imagePath,
    double? latitude,
    double? longitude,
    List<PageRouteInfo>? children,
  }) : super(
         CameraPreviewRoute.name,
         args: CameraPreviewRouteArgs(
           key: key,
           imagePath: imagePath,
           latitude: latitude,
           longitude: longitude,
         ),
         initialChildren: children,
       );

  static const String name = 'CameraPreviewRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CameraPreviewRouteArgs>();
      return CameraPreviewPage(
        key: args.key,
        imagePath: args.imagePath,
        latitude: args.latitude,
        longitude: args.longitude,
      );
    },
  );
}

class CameraPreviewRouteArgs {
  const CameraPreviewRouteArgs({
    this.key,
    required this.imagePath,
    this.latitude,
    this.longitude,
  });

  final Key? key;

  final String imagePath;

  final double? latitude;

  final double? longitude;

  @override
  String toString() {
    return 'CameraPreviewRouteArgs{key: $key, imagePath: $imagePath, latitude: $latitude, longitude: $longitude}';
  }
}

/// generated route for
/// [ChangePasswordPage]
class ChangePasswordRoute extends PageRouteInfo<void> {
  const ChangePasswordRoute({List<PageRouteInfo>? children})
    : super(ChangePasswordRoute.name, initialChildren: children);

  static const String name = 'ChangePasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePasswordPage();
    },
  );
}

/// generated route for
/// [ChangePhonePage]
class ChangePhoneRoute extends PageRouteInfo<void> {
  const ChangePhoneRoute({List<PageRouteInfo>? children})
    : super(ChangePhoneRoute.name, initialChildren: children);

  static const String name = 'ChangePhoneRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangePhonePage();
    },
  );
}

/// generated route for
/// [CommentsPage]
class CommentsRoute extends PageRouteInfo<CommentsRouteArgs> {
  CommentsRoute({
    Key? key,
    required RoadProblemDTO problem,
    List<PageRouteInfo>? children,
  }) : super(
         CommentsRoute.name,
         args: CommentsRouteArgs(key: key, problem: problem),
         initialChildren: children,
       );

  static const String name = 'CommentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CommentsRouteArgs>();
      return CommentsPage(key: args.key, problem: args.problem);
    },
  );
}

class CommentsRouteArgs {
  const CommentsRouteArgs({this.key, required this.problem});

  final Key? key;

  final RoadProblemDTO problem;

  @override
  String toString() {
    return 'CommentsRouteArgs{key: $key, problem: $problem}';
  }
}

/// generated route for
/// [CompanyDataPage]
class CompanyDataRoute extends PageRouteInfo<CompanyDataRouteArgs> {
  CompanyDataRoute({
    Key? key,
    VoidCallback? onCompanySaved,
    List<PageRouteInfo>? children,
  }) : super(
         CompanyDataRoute.name,
         args: CompanyDataRouteArgs(key: key, onCompanySaved: onCompanySaved),
         initialChildren: children,
       );

  static const String name = 'CompanyDataRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompanyDataRouteArgs>(
        orElse: () => const CompanyDataRouteArgs(),
      );
      return WrappedRoute(
        child: CompanyDataPage(
          key: args.key,
          onCompanySaved: args.onCompanySaved,
        ),
      );
    },
  );
}

class CompanyDataRouteArgs {
  const CompanyDataRouteArgs({this.key, this.onCompanySaved});

  final Key? key;

  final VoidCallback? onCompanySaved;

  @override
  String toString() {
    return 'CompanyDataRouteArgs{key: $key, onCompanySaved: $onCompanySaved}';
  }
}

/// generated route for
/// [CompanyDocumentsPage]
class CompanyDocumentsRoute extends PageRouteInfo<CompanyDocumentsRouteArgs> {
  CompanyDocumentsRoute({
    Key? key,
    String? rejectionReason,
    VoidCallback? onDocumentsSubmitted,
    List<PageRouteInfo>? children,
  }) : super(
         CompanyDocumentsRoute.name,
         args: CompanyDocumentsRouteArgs(
           key: key,
           rejectionReason: rejectionReason,
           onDocumentsSubmitted: onDocumentsSubmitted,
         ),
         initialChildren: children,
       );

  static const String name = 'CompanyDocumentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CompanyDocumentsRouteArgs>(
        orElse: () => const CompanyDocumentsRouteArgs(),
      );
      return WrappedRoute(
        child: CompanyDocumentsPage(
          key: args.key,
          rejectionReason: args.rejectionReason,
          onDocumentsSubmitted: args.onDocumentsSubmitted,
        ),
      );
    },
  );
}

class CompanyDocumentsRouteArgs {
  const CompanyDocumentsRouteArgs({
    this.key,
    this.rejectionReason,
    this.onDocumentsSubmitted,
  });

  final Key? key;

  final String? rejectionReason;

  final VoidCallback? onDocumentsSubmitted;

  @override
  String toString() {
    return 'CompanyDocumentsRouteArgs{key: $key, rejectionReason: $rejectionReason, onDocumentsSubmitted: $onDocumentsSubmitted}';
  }
}

/// generated route for
/// [ControllerAcceptApplicationPage]
class ControllerAcceptApplicationRoute
    extends PageRouteInfo<ControllerAcceptApplicationRouteArgs> {
  ControllerAcceptApplicationRoute({
    Key? key,
    required RoadProblemDTO problem,
    List<PageRouteInfo>? children,
  }) : super(
         ControllerAcceptApplicationRoute.name,
         args: ControllerAcceptApplicationRouteArgs(key: key, problem: problem),
         initialChildren: children,
       );

  static const String name = 'ControllerAcceptApplicationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ControllerAcceptApplicationRouteArgs>();
      return ControllerAcceptApplicationPage(
        key: args.key,
        problem: args.problem,
      );
    },
  );
}

class ControllerAcceptApplicationRouteArgs {
  const ControllerAcceptApplicationRouteArgs({this.key, required this.problem});

  final Key? key;

  final RoadProblemDTO problem;

  @override
  String toString() {
    return 'ControllerAcceptApplicationRouteArgs{key: $key, problem: $problem}';
  }
}

/// generated route for
/// [CustomSplashScreen]
class CustomSplashRoute extends PageRouteInfo<void> {
  const CustomSplashRoute({List<PageRouteInfo>? children})
    : super(CustomSplashRoute.name, initialChildren: children);

  static const String name = 'CustomSplashRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomSplashScreen();
    },
  );
}

/// generated route for
/// [DocumentsPage]
class DocumentsRoute extends PageRouteInfo<void> {
  const DocumentsRoute({List<PageRouteInfo>? children})
    : super(DocumentsRoute.name, initialChildren: children);

  static const String name = 'DocumentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const DocumentsPage());
    },
  );
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<EditProfileRouteArgs> {
  EditProfileRoute({
    Key? key,
    required UserDTO userDTO,
    List<PageRouteInfo>? children,
  }) : super(
         EditProfileRoute.name,
         args: EditProfileRouteArgs(key: key, userDTO: userDTO),
         initialChildren: children,
       );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EditProfileRouteArgs>();
      return WrappedRoute(
        child: EditProfilePage(key: args.key, userDTO: args.userDTO),
      );
    },
  );
}

class EditProfileRouteArgs {
  const EditProfileRouteArgs({this.key, required this.userDTO});

  final Key? key;

  final UserDTO userDTO;

  @override
  String toString() {
    return 'EditProfileRouteArgs{key: $key, userDTO: $userDTO}';
  }
}

/// generated route for
/// [EnterSmsCodePage]
class EnterSmsCodeRoute extends PageRouteInfo<EnterSmsCodeRouteArgs> {
  EnterSmsCodeRoute({
    Key? key,
    required EnterSmsCodeType flowType,
    required int smsDelay,
    UserPayload? userPayload,
    required String phone,
    bool isSignUpSecond = false,
    List<PageRouteInfo>? children,
  }) : super(
         EnterSmsCodeRoute.name,
         args: EnterSmsCodeRouteArgs(
           key: key,
           flowType: flowType,
           smsDelay: smsDelay,
           userPayload: userPayload,
           phone: phone,
           isSignUpSecond: isSignUpSecond,
         ),
         initialChildren: children,
       );

  static const String name = 'EnterSmsCodeRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EnterSmsCodeRouteArgs>();
      return WrappedRoute(
        child: EnterSmsCodePage(
          key: args.key,
          flowType: args.flowType,
          smsDelay: args.smsDelay,
          userPayload: args.userPayload,
          phone: args.phone,
          isSignUpSecond: args.isSignUpSecond,
        ),
      );
    },
  );
}

class EnterSmsCodeRouteArgs {
  const EnterSmsCodeRouteArgs({
    this.key,
    required this.flowType,
    required this.smsDelay,
    this.userPayload,
    required this.phone,
    this.isSignUpSecond = false,
  });

  final Key? key;

  final EnterSmsCodeType flowType;

  final int smsDelay;

  final UserPayload? userPayload;

  final String phone;

  final bool isSignUpSecond;

  @override
  String toString() {
    return 'EnterSmsCodeRouteArgs{key: $key, flowType: $flowType, smsDelay: $smsDelay, userPayload: $userPayload, phone: $phone, isSignUpSecond: $isSignUpSecond}';
  }
}

/// generated route for
/// [Launcher]
class LauncherRoute extends PageRouteInfo<void> {
  const LauncherRoute({List<PageRouteInfo>? children})
    : super(LauncherRoute.name, initialChildren: children);

  static const String name = 'LauncherRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const Launcher();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
    : super(LoginRoute.name, initialChildren: children);

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const LoginPage());
    },
  );
}

/// generated route for
/// [MainPageFirst]
class MainRouteFirst extends PageRouteInfo<void> {
  const MainRouteFirst({List<PageRouteInfo>? children})
    : super(MainRouteFirst.name, initialChildren: children);

  static const String name = 'MainRouteFirst';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const MainPageFirst());
    },
  );
}

/// generated route for
/// [MapPage]
class MapRoute extends PageRouteInfo<void> {
  const MapRoute({List<PageRouteInfo>? children})
    : super(MapRoute.name, initialChildren: children);

  static const String name = 'MapRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MapPage();
    },
  );
}

/// generated route for
/// [MarkApplicationSuccessPage]
class MarkApplicationSuccessRoute
    extends PageRouteInfo<MarkApplicationSuccessRouteArgs> {
  MarkApplicationSuccessRoute({
    Key? key,
    required RoadProblemDTO problem,
    MarkApplicationSuccessKind kind = MarkApplicationSuccessKind.submitted,
    List<PageRouteInfo>? children,
  }) : super(
         MarkApplicationSuccessRoute.name,
         args: MarkApplicationSuccessRouteArgs(
           key: key,
           problem: problem,
           kind: kind,
         ),
         initialChildren: children,
       );

  static const String name = 'MarkApplicationSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MarkApplicationSuccessRouteArgs>();
      return MarkApplicationSuccessPage(
        key: args.key,
        problem: args.problem,
        kind: args.kind,
      );
    },
  );
}

class MarkApplicationSuccessRouteArgs {
  const MarkApplicationSuccessRouteArgs({
    this.key,
    required this.problem,
    this.kind = MarkApplicationSuccessKind.submitted,
  });

  final Key? key;

  final RoadProblemDTO problem;

  final MarkApplicationSuccessKind kind;

  @override
  String toString() {
    return 'MarkApplicationSuccessRouteArgs{key: $key, problem: $problem, kind: $kind}';
  }
}

/// generated route for
/// [MyResponsesPage]
class MyResponsesRoute extends PageRouteInfo<void> {
  const MyResponsesRoute({List<PageRouteInfo>? children})
    : super(MyResponsesRoute.name, initialChildren: children);

  static const String name = 'MyResponsesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyResponsesPage();
    },
  );
}

/// generated route for
/// [NewPasswordPage]
class NewPasswordRoute extends PageRouteInfo<NewPasswordRouteArgs> {
  NewPasswordRoute({
    Key? key,
    required String phone,
    required String code,
    required String resetToken,
    List<PageRouteInfo>? children,
  }) : super(
         NewPasswordRoute.name,
         args: NewPasswordRouteArgs(
           key: key,
           phone: phone,
           code: code,
           resetToken: resetToken,
         ),
         initialChildren: children,
       );

  static const String name = 'NewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<NewPasswordRouteArgs>();
      return WrappedRoute(
        child: NewPasswordPage(
          key: args.key,
          phone: args.phone,
          code: args.code,
          resetToken: args.resetToken,
        ),
      );
    },
  );
}

class NewPasswordRouteArgs {
  const NewPasswordRouteArgs({
    this.key,
    required this.phone,
    required this.code,
    required this.resetToken,
  });

  final Key? key;

  final String phone;

  final String code;

  final String resetToken;

  @override
  String toString() {
    return 'NewPasswordRouteArgs{key: $key, phone: $phone, code: $code, resetToken: $resetToken}';
  }
}

/// generated route for
/// [NotificationPage]
class NotificationRoute extends PageRouteInfo<void> {
  const NotificationRoute({List<PageRouteInfo>? children})
    : super(NotificationRoute.name, initialChildren: children);

  static const String name = 'NotificationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationPage();
    },
  );
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
    : super(NotificationsRoute.name, initialChildren: children);

  static const String name = 'NotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationsPage();
    },
  );
}

/// generated route for
/// [PasswordRecoveryPage]
class PasswordRecoveryRoute extends PageRouteInfo<void> {
  const PasswordRecoveryRoute({List<PageRouteInfo>? children})
    : super(PasswordRecoveryRoute.name, initialChildren: children);

  static const String name = 'PasswordRecoveryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const PasswordRecoveryPage());
    },
  );
}

/// generated route for
/// [PendingApprovalPage]
class PendingApprovalRoute extends PageRouteInfo<void> {
  const PendingApprovalRoute({List<PageRouteInfo>? children})
    : super(PendingApprovalRoute.name, initialChildren: children);

  static const String name = 'PendingApprovalRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PendingApprovalPage();
    },
  );
}

/// generated route for
/// [ProblemDetailPage]
class ProblemDetailRoute extends PageRouteInfo<ProblemDetailRouteArgs> {
  ProblemDetailRoute({
    Key? key,
    bool isSubmit = false,
    RoadProblemDTO? problem,
    List<PageRouteInfo>? children,
  }) : super(
         ProblemDetailRoute.name,
         args: ProblemDetailRouteArgs(
           key: key,
           isSubmit: isSubmit,
           problem: problem,
         ),
         initialChildren: children,
       );

  static const String name = 'ProblemDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProblemDetailRouteArgs>(
        orElse: () => const ProblemDetailRouteArgs(),
      );
      return ProblemDetailPage(
        key: args.key,
        isSubmit: args.isSubmit,
        problem: args.problem,
      );
    },
  );
}

class ProblemDetailRouteArgs {
  const ProblemDetailRouteArgs({this.key, this.isSubmit = false, this.problem});

  final Key? key;

  final bool isSubmit;

  final RoadProblemDTO? problem;

  @override
  String toString() {
    return 'ProblemDetailRouteArgs{key: $key, isSubmit: $isSubmit, problem: $problem}';
  }
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute({List<PageRouteInfo>? children})
    : super(ProfileRoute.name, initialChildren: children);

  static const String name = 'ProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const ProfilePage());
    },
  );
}

/// generated route for
/// [ReportDetailPage]
class ReportDetailRoute extends PageRouteInfo<ReportDetailRouteArgs> {
  ReportDetailRoute({
    Key? key,
    required String reportId,
    required String imageUrl,
    List<PageRouteInfo>? children,
  }) : super(
         ReportDetailRoute.name,
         args: ReportDetailRouteArgs(
           key: key,
           reportId: reportId,
           imageUrl: imageUrl,
         ),
         initialChildren: children,
       );

  static const String name = 'ReportDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportDetailRouteArgs>();
      return ReportDetailPage(
        key: args.key,
        reportId: args.reportId,
        imageUrl: args.imageUrl,
      );
    },
  );
}

class ReportDetailRouteArgs {
  const ReportDetailRouteArgs({
    this.key,
    required this.reportId,
    required this.imageUrl,
  });

  final Key? key;

  final String reportId;

  final String imageUrl;

  @override
  String toString() {
    return 'ReportDetailRouteArgs{key: $key, reportId: $reportId, imageUrl: $imageUrl}';
  }
}

/// generated route for
/// [ReportSuccessPage]
class ReportSuccessRoute extends PageRouteInfo<ReportSuccessRouteArgs> {
  ReportSuccessRoute({
    Key? key,
    required RoadProblemDTO problem,
    List<PageRouteInfo>? children,
  }) : super(
         ReportSuccessRoute.name,
         args: ReportSuccessRouteArgs(key: key, problem: problem),
         initialChildren: children,
       );

  static const String name = 'ReportSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReportSuccessRouteArgs>();
      return ReportSuccessPage(key: args.key, problem: args.problem);
    },
  );
}

class ReportSuccessRouteArgs {
  const ReportSuccessRouteArgs({this.key, required this.problem});

  final Key? key;

  final RoadProblemDTO problem;

  @override
  String toString() {
    return 'ReportSuccessRouteArgs{key: $key, problem: $problem}';
  }
}

/// generated route for
/// [RoadProblemDetailPage]
class RoadProblemDetailRoute extends PageRouteInfo<RoadProblemDetailRouteArgs> {
  RoadProblemDetailRoute({
    Key? key,
    required RoadProblemDTO problem,
    List<PageRouteInfo>? children,
  }) : super(
         RoadProblemDetailRoute.name,
         args: RoadProblemDetailRouteArgs(key: key, problem: problem),
         initialChildren: children,
       );

  static const String name = 'RoadProblemDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RoadProblemDetailRouteArgs>();
      return RoadProblemDetailPage(key: args.key, problem: args.problem);
    },
  );
}

class RoadProblemDetailRouteArgs {
  const RoadProblemDetailRouteArgs({this.key, required this.problem});

  final Key? key;

  final RoadProblemDTO problem;

  @override
  String toString() {
    return 'RoadProblemDetailRouteArgs{key: $key, problem: $problem}';
  }
}

/// generated route for
/// [RoleSelectionPage]
class RoleSelectionRoute extends PageRouteInfo<void> {
  const RoleSelectionRoute({List<PageRouteInfo>? children})
    : super(RoleSelectionRoute.name, initialChildren: children);

  static const String name = 'RoleSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RoleSelectionPage();
    },
  );
}

/// generated route for
/// [SignUpFirstPage]
class SignUpFirstRoute extends PageRouteInfo<void> {
  const SignUpFirstRoute({List<PageRouteInfo>? children})
    : super(SignUpFirstRoute.name, initialChildren: children);

  static const String name = 'SignUpFirstRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SignUpFirstPage());
    },
  );
}

/// generated route for
/// [SignUpSecondPage]
class SignUpSecondRoute extends PageRouteInfo<void> {
  const SignUpSecondRoute({List<PageRouteInfo>? children})
    : super(SignUpSecondRoute.name, initialChildren: children);

  static const String name = 'SignUpSecondRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SignUpSecondPage());
    },
  );
}

/// generated route for
/// [SubmitApplicationPage]
class SubmitApplicationRoute extends PageRouteInfo<void> {
  const SubmitApplicationRoute({List<PageRouteInfo>? children})
    : super(SubmitApplicationRoute.name, initialChildren: children);

  static const String name = 'SubmitApplicationRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SubmitApplicationPage();
    },
  );
}

/// generated route for
/// [WorkReportPage]
class WorkReportRoute extends PageRouteInfo<WorkReportRouteArgs> {
  WorkReportRoute({
    Key? key,
    required RoadProblemDTO problem,
    List<PageRouteInfo>? children,
  }) : super(
         WorkReportRoute.name,
         args: WorkReportRouteArgs(key: key, problem: problem),
         initialChildren: children,
       );

  static const String name = 'WorkReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<WorkReportRouteArgs>();
      return WorkReportPage(key: args.key, problem: args.problem);
    },
  );
}

class WorkReportRouteArgs {
  const WorkReportRouteArgs({this.key, required this.problem});

  final Key? key;

  final RoadProblemDTO problem;

  @override
  String toString() {
    return 'WorkReportRouteArgs{key: $key, problem: $problem}';
  }
}
