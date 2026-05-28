import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:ikidz/src/core/presentation/widgets/other/custom_loading_widget.dart';
import 'package:ikidz/src/core/utils/extensions/context_extension.dart';
import 'package:ikidz/src/core/utils/layout/url_util.dart' show UrlUtil;
import 'package:ikidz/src/feature/app/bloc/app_bloc.dart';
import 'package:ikidz/src/feature/app/logic/notification_service.dart';
import 'package:ikidz/src/feature/app/presentation/pages/role_selection_page.dart';
import 'package:ikidz/src/feature/app/presentation/pages/base.dart';
import 'package:ikidz/src/feature/app/presentation/pages/force_update_page.dart';
import 'package:ikidz/src/feature/auth/presentation/pages/auth_page.dart';


@RoutePage(name: 'LauncherRoute')
class Launcher extends StatefulWidget {
  const Launcher({super.key});

  @override
  _LauncherState createState() => _LauncherState();
}

class _LauncherState extends State<Launcher> with WidgetsBindingObserver {
  @override
  void initState() {
    FToast().init(context);
    WidgetsBinding.instance.addPostFrameCallback((time) {
      NotificationService().onMessageOpenedApp(context);
    });
    NotificationService().getDeviceToken(
      authDao: context.repository.authDao,
    );

    BlocProvider.of<AppBloc>(context).add(
      AppEvent.checkAuth(
        version: context.dependencies.packageInfo.version,
      ),
    );

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => BlocConsumer<AppBloc, AppState>(
        listener: (context, state) {
          state.whenOrNull(
            inApp: () {
              // BlocProvider.of<AppBloc>(context).add(const AppEvent.sendDeviceToken());
              // BlocProvider.of<ProfileBLoC>(context).add(const ProfileEvent.getProfile());
            },
            banned: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                      'Ваш аккаунт был заблокирован, свяжитесь в администратором'),
                ),
              );
            },
          );
        },
        builder: (context, state) => state.when(
          notAvailableVersion: () => ForceUpdatePage.forceUpdate(
            onTap: () async {
              final url = Platform.isAndroid
                  ? "https://play.google.com/store/apps/details?//id=com.thousand.study_line"
                  : "https://apps.apple.com/kz/app/study-line///id6670752460";
              UrlUtil.launch(context, url: url);
            },
          ),
          error: (message) => ForceUpdatePage.noAvailable(
            onTap: () async {},
          ),
          inApp: () => Base(),
          // notAuthorized: () => BlocProvider(
          //   create: (context) => LoginCubit(
          //     repository: context.repository.authRepository,
          //   ),
          //   child: const AuthPage(),
          // ),
          notAuthorized: () => const RoleSelectionPage(),
          banned: () => const AuthPage(), // BlocProvider(
          //   create: (context) => LoginCubit(
          //     repository: context.repository.authRepository,
          //   ),
          //   child: const AuthPage(),
          // ),
          loading: () => const _Scaffold(
            child: CustomLoadingWidget(),
          ),
        ),
      );
}

class _Scaffold extends StatelessWidget {
  const _Scaffold({
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(child: child),
      );
}
