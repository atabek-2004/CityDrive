import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_widget.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/core/utils/layout/url_util.dart' show UrlUtil;
import 'package:city_drive/src/feature/app/bloc/app_bloc.dart';
import 'package:city_drive/src/feature/app/logic/notification_service.dart';
import 'package:city_drive/src/feature/app/presentation/pages/role_selection_page.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/feature/app/presentation/pages/base.dart';
import 'package:city_drive/src/feature/app/presentation/pages/base_second.dart';
import 'package:city_drive/src/feature/app/presentation/pages/force_update_page.dart';
import 'package:city_drive/src/feature/auth/data/local_auth_repository.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/auth_page.dart';


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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await NotificationService().onMessageOpenedApp(context);
      if (!mounted) return;
      await NotificationService().getDeviceToken(
        authDao: context.repository.authDao,
      );
      final auth = context.repository.authRepository;
      if (auth is LocalAuthRepository) {
        await auth.restoreSessionRole();
      }
    });

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
                  ? "https://play.google.com/store/apps/details?id=com.example.city_drive"
                  : "https://apps.apple.com/app/city-drive/id0000000000";
              UrlUtil.launch(context, url: url);
            },
          ),
          error: (message) => ForceUpdatePage.noAvailable(
            onTap: () async {},
          ),
          inApp: () {
            final role = context.repository.sessionRepository.currentRole;
            if (role == UserRole.controller) {
              return const BaseSecondPage();
            }
            return Base();
          },
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
