// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [AddCardPage]
class AddCardRoute extends PageRouteInfo<void> {
  const AddCardRoute({List<PageRouteInfo>? children})
    : super(AddCardRoute.name, initialChildren: children);

  static const String name = 'AddCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddCardPage();
    },
  );
}

/// generated route for
/// [AddChildPage]
class AddChildRoute extends PageRouteInfo<AddChildRouteArgs> {
  AddChildRoute({
    Key? key,
    bool isProfileAddChildPage = false,
    List<PageRouteInfo>? children,
  }) : super(
         AddChildRoute.name,
         args: AddChildRouteArgs(
           key: key,
           isProfileAddChildPage: isProfileAddChildPage,
         ),
         initialChildren: children,
       );

  static const String name = 'AddChildRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddChildRouteArgs>(
        orElse: () => const AddChildRouteArgs(),
      );
      return WrappedRoute(
        child: AddChildPage(
          key: args.key,
          isProfileAddChildPage: args.isProfileAddChildPage,
        ),
      );
    },
  );
}

class AddChildRouteArgs {
  const AddChildRouteArgs({this.key, this.isProfileAddChildPage = false});

  final Key? key;

  final bool isProfileAddChildPage;

  @override
  String toString() {
    return 'AddChildRouteArgs{key: $key, isProfileAddChildPage: $isProfileAddChildPage}';
  }
}

/// generated route for
/// [AddChildSearchPage]
class AddChildSearchRoute extends PageRouteInfo<void> {
  const AddChildSearchRoute({List<PageRouteInfo>? children})
    : super(AddChildSearchRoute.name, initialChildren: children);

  static const String name = 'AddChildSearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const AddChildSearchPage();
    },
  );
}

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
/// [ChangeCardPage]
class ChangeCardRoute extends PageRouteInfo<void> {
  const ChangeCardRoute({List<PageRouteInfo>? children})
    : super(ChangeCardRoute.name, initialChildren: children);

  static const String name = 'ChangeCardRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ChangeCardPage();
    },
  );
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
/// [ClassPage]
class ClassRoute extends PageRouteInfo<ClassRouteArgs> {
  ClassRoute({
    Key? key,
    bool showSchedule = false,
    List<PageRouteInfo>? children,
  }) : super(
         ClassRoute.name,
         args: ClassRouteArgs(key: key, showSchedule: showSchedule),
         initialChildren: children,
       );

  static const String name = 'ClassRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ClassRouteArgs>(
        orElse: () => const ClassRouteArgs(),
      );
      return ClassPage(key: args.key, showSchedule: args.showSchedule);
    },
  );
}

class ClassRouteArgs {
  const ClassRouteArgs({this.key, this.showSchedule = false});

  final Key? key;

  final bool showSchedule;

  @override
  String toString() {
    return 'ClassRouteArgs{key: $key, showSchedule: $showSchedule}';
  }
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
class CompanyDataRoute extends PageRouteInfo<void> {
  const CompanyDataRoute({List<PageRouteInfo>? children})
    : super(CompanyDataRoute.name, initialChildren: children);

  static const String name = 'CompanyDataRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyDataPage();
    },
  );
}

/// generated route for
/// [CompanyDocumentsPage]
class CompanyDocumentsRoute extends PageRouteInfo<void> {
  const CompanyDocumentsRoute({List<PageRouteInfo>? children})
    : super(CompanyDocumentsRoute.name, initialChildren: children);

  static const String name = 'CompanyDocumentsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CompanyDocumentsPage();
    },
  );
}

/// generated route for
/// [ConfirmEntryPage]
class ConfirmEntryRoute extends PageRouteInfo<void> {
  const ConfirmEntryRoute({List<PageRouteInfo>? children})
    : super(ConfirmEntryRoute.name, initialChildren: children);

  static const String name = 'ConfirmEntryRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ConfirmEntryPage();
    },
  );
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
/// [FreezeSubscriptionPage]
class FreezeSubscriptionRoute extends PageRouteInfo<void> {
  const FreezeSubscriptionRoute({List<PageRouteInfo>? children})
    : super(FreezeSubscriptionRoute.name, initialChildren: children);

  static const String name = 'FreezeSubscriptionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const FreezeSubscriptionPage();
    },
  );
}

/// generated route for
/// [HallDetailsPage]
class HallDetailsRoute extends PageRouteInfo<HallDetailsRouteArgs> {
  HallDetailsRoute({
    Key? key,
    required int ceterId,
    List<PageRouteInfo>? children,
  }) : super(
         HallDetailsRoute.name,
         args: HallDetailsRouteArgs(key: key, ceterId: ceterId),
         initialChildren: children,
       );

  static const String name = 'HallDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HallDetailsRouteArgs>();
      return WrappedRoute(
        child: HallDetailsPage(key: args.key, ceterId: args.ceterId),
      );
    },
  );
}

class HallDetailsRouteArgs {
  const HallDetailsRouteArgs({this.key, required this.ceterId});

  final Key? key;

  final int ceterId;

  @override
  String toString() {
    return 'HallDetailsRouteArgs{key: $key, ceterId: $ceterId}';
  }
}

/// generated route for
/// [HallSchedulePage]
class HallScheduleRoute extends PageRouteInfo<HallScheduleRouteArgs> {
  HallScheduleRoute({
    Key? key,
    required int centerId,
    required int dayOfWeek,
    List<PageRouteInfo>? children,
  }) : super(
         HallScheduleRoute.name,
         args: HallScheduleRouteArgs(
           key: key,
           centerId: centerId,
           dayOfWeek: dayOfWeek,
         ),
         initialChildren: children,
       );

  static const String name = 'HallScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HallScheduleRouteArgs>();
      return WrappedRoute(
        child: HallSchedulePage(
          key: args.key,
          centerId: args.centerId,
          dayOfWeek: args.dayOfWeek,
        ),
      );
    },
  );
}

class HallScheduleRouteArgs {
  const HallScheduleRouteArgs({
    this.key,
    required this.centerId,
    required this.dayOfWeek,
  });

  final Key? key;

  final int centerId;

  final int dayOfWeek;

  @override
  String toString() {
    return 'HallScheduleRouteArgs{key: $key, centerId: $centerId, dayOfWeek: $dayOfWeek}';
  }
}

/// generated route for
/// [IkidzSubscriptionsPage]
class IkidzSubscriptionsRoute extends PageRouteInfo<void> {
  const IkidzSubscriptionsRoute({List<PageRouteInfo>? children})
    : super(IkidzSubscriptionsRoute.name, initialChildren: children);

  static const String name = 'IkidzSubscriptionsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const IkidzSubscriptionsPage();
    },
  );
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
/// [ListingPage]
class ListingRoute extends PageRouteInfo<ListingRouteArgs> {
  ListingRoute({
    Key? key,
    required String titleSection,
    required String titleCategory,
    ActivityDTO? activity,
    List<PageRouteInfo>? children,
  }) : super(
         ListingRoute.name,
         args: ListingRouteArgs(
           key: key,
           titleSection: titleSection,
           titleCategory: titleCategory,
           activity: activity,
         ),
         initialChildren: children,
       );

  static const String name = 'ListingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ListingRouteArgs>();
      return WrappedRoute(
        child: ListingPage(
          key: args.key,
          titleSection: args.titleSection,
          titleCategory: args.titleCategory,
          activity: args.activity,
        ),
      );
    },
  );
}

class ListingRouteArgs {
  const ListingRouteArgs({
    this.key,
    required this.titleSection,
    required this.titleCategory,
    this.activity,
  });

  final Key? key;

  final String titleSection;

  final String titleCategory;

  final ActivityDTO? activity;

  @override
  String toString() {
    return 'ListingRouteArgs{key: $key, titleSection: $titleSection, titleCategory: $titleCategory, activity: $activity}';
  }
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
/// [MyChildrenPage]
class MyChildrenRoute extends PageRouteInfo<void> {
  const MyChildrenRoute({List<PageRouteInfo>? children})
    : super(MyChildrenRoute.name, initialChildren: children);

  static const String name = 'MyChildrenRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const MyChildrenPage();
    },
  );
}

/// generated route for
/// [MyChildrenProfilePage]
class MyChildrenProfileRoute extends PageRouteInfo<void> {
  const MyChildrenProfileRoute({List<PageRouteInfo>? children})
    : super(MyChildrenProfileRoute.name, initialChildren: children);

  static const String name = 'MyChildrenProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const MyChildrenProfilePage());
    },
  );
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
/// [NewCenetersPage]
class NewCenetersRoute extends PageRouteInfo<void> {
  const NewCenetersRoute({List<PageRouteInfo>? children})
    : super(NewCenetersRoute.name, initialChildren: children);

  static const String name = 'NewCenetersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const NewCenetersPage());
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
/// [OnboardingSeondPage]
class OnboardingSeondRoute extends PageRouteInfo<void> {
  const OnboardingSeondRoute({List<PageRouteInfo>? children})
    : super(OnboardingSeondRoute.name, initialChildren: children);

  static const String name = 'OnboardingSeondRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const OnboardingSeondPage());
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
/// [PaymentMethodsPage]
class PaymentMethodsRoute extends PageRouteInfo<void> {
  const PaymentMethodsRoute({List<PageRouteInfo>? children})
    : super(PaymentMethodsRoute.name, initialChildren: children);

  static const String name = 'PaymentMethodsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaymentMethodsPage();
    },
  );
}

/// generated route for
/// [PaymentWasSuccessfulPage]
class PaymentWasSuccessfulRoute extends PageRouteInfo<void> {
  const PaymentWasSuccessfulRoute({List<PageRouteInfo>? children})
    : super(PaymentWasSuccessfulRoute.name, initialChildren: children);

  static const String name = 'PaymentWasSuccessfulRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const PaymentWasSuccessfulPage();
    },
  );
}

/// generated route for
/// [ProblemDetailPage]
class ProblemDetailRoute extends PageRouteInfo<ProblemDetailRouteArgs> {
  ProblemDetailRoute({
    Key? key,
    bool isSubmit = false,
    List<PageRouteInfo>? children,
  }) : super(
         ProblemDetailRoute.name,
         args: ProblemDetailRouteArgs(key: key, isSubmit: isSubmit),
         initialChildren: children,
       );

  static const String name = 'ProblemDetailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProblemDetailRouteArgs>(
        orElse: () => const ProblemDetailRouteArgs(),
      );
      return ProblemDetailPage(key: args.key, isSubmit: args.isSubmit);
    },
  );
}

class ProblemDetailRouteArgs {
  const ProblemDetailRouteArgs({this.key, this.isSubmit = false});

  final Key? key;

  final bool isSubmit;

  @override
  String toString() {
    return 'ProblemDetailRouteArgs{key: $key, isSubmit: $isSubmit}';
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
/// [QrPage]
class QrRoute extends PageRouteInfo<void> {
  const QrRoute({List<PageRouteInfo>? children})
    : super(QrRoute.name, initialChildren: children);

  static const String name = 'QrRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const QrPage();
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
class ReportSuccessRoute extends PageRouteInfo<void> {
  const ReportSuccessRoute({List<PageRouteInfo>? children})
    : super(ReportSuccessRoute.name, initialChildren: children);

  static const String name = 'ReportSuccessRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ReportSuccessPage();
    },
  );
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
/// [ScheduleClassPage]
class ScheduleClassRoute extends PageRouteInfo<void> {
  const ScheduleClassRoute({List<PageRouteInfo>? children})
    : super(ScheduleClassRoute.name, initialChildren: children);

  static const String name = 'ScheduleClassRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ScheduleClassPage();
    },
  );
}

/// generated route for
/// [SchedulePage]
class ScheduleRoute extends PageRouteInfo<void> {
  const ScheduleRoute({List<PageRouteInfo>? children})
    : super(ScheduleRoute.name, initialChildren: children);

  static const String name = 'ScheduleRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SchedulePage();
    },
  );
}

/// generated route for
/// [SearchActivePage]
class SearchActiveRoute extends PageRouteInfo<void> {
  const SearchActiveRoute({List<PageRouteInfo>? children})
    : super(SearchActiveRoute.name, initialChildren: children);

  static const String name = 'SearchActiveRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SearchActivePage());
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
/// [SubscriptionPage]
class SubscriptionRoute extends PageRouteInfo<void> {
  const SubscriptionRoute({List<PageRouteInfo>? children})
    : super(SubscriptionRoute.name, initialChildren: children);

  static const String name = 'SubscriptionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const SubscriptionPage());
    },
  );
}

/// generated route for
/// [TempPage]
class TempRoute extends PageRouteInfo<TempRouteArgs> {
  TempRoute({required String title, Key? key, List<PageRouteInfo>? children})
    : super(
        TempRoute.name,
        args: TempRouteArgs(title: title, key: key),
        initialChildren: children,
      );

  static const String name = 'TempRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<TempRouteArgs>();
      return TempPage(title: args.title, key: args.key);
    },
  );
}

class TempRouteArgs {
  const TempRouteArgs({required this.title, this.key});

  final String title;

  final Key? key;

  @override
  String toString() {
    return 'TempRouteArgs{title: $title, key: $key}';
  }
}

/// generated route for
/// [UpcomingClassesPage]
class UpcomingClassesRoute extends PageRouteInfo<void> {
  const UpcomingClassesRoute({List<PageRouteInfo>? children})
    : super(UpcomingClassesRoute.name, initialChildren: children);

  static const String name = 'UpcomingClassesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return WrappedRoute(child: const UpcomingClassesPage());
    },
  );
}

/// generated route for
/// [WorkReportPage]
class WorkReportRoute extends PageRouteInfo<void> {
  const WorkReportRoute({List<PageRouteInfo>? children})
    : super(WorkReportRoute.name, initialChildren: children);

  static const String name = 'WorkReportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const WorkReportPage();
    },
  );
}
