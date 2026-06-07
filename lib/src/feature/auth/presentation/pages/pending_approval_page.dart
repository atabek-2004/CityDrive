import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:city_drive/src/core/constant/generated/assets.gen.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/bloc/app_bloc.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/presentation/utils/auth_navigation.dart';
import 'package:city_drive/src/feature/app/logic/demo_local_notification_service.dart';

@RoutePage()
class PendingApprovalPage extends StatefulWidget {
  const PendingApprovalPage({super.key});

  @override
  State<PendingApprovalPage> createState() => _PendingApprovalPageState();
}

class _PendingApprovalPageState extends State<PendingApprovalPage>
    with WidgetsBindingObserver {
  static const _pollInterval = Duration(seconds: 5);

  Timer? _pollTimer;
  bool _isChecking = false;
  bool _approvalNotificationShown = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    _pollTimer = Timer.periodic(_pollInterval, (_) => _checkApprovalStatus());
    WidgetsBinding.instance.addPostFrameCallback((_) => _checkApprovalStatus());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _pollTimer?.cancel();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      _checkApprovalStatus();
    }
  }

  Future<void> _checkApprovalStatus() async {
    if (_isChecking || !mounted || _approvalNotificationShown) return;
    _isChecking = true;

    try {
      final status =
          await context.repository.authRepository.fetchApprovalStatus();
      if (!mounted || _approvalNotificationShown) return;

      if (status.isApproved) {
        _approvalNotificationShown = true;
        _pollTimer?.cancel();

        await DemoLocalNotificationService.instance
            .showRegistrationApprovedNotification();

        final user = context.repository.authRepository.user;
        if (user != null && mounted) {
          BlocProvider.of<AppBloc>(context).add(AppEvent.logining(user: user));
          await context.router.replaceAll([const LauncherRoute()]);
        }
        return;
      }

      if (status.companyStatus == 'rejected' &&
          context.repository.sessionRepository.currentRole ==
              UserRole.controller) {
        _pollTimer?.cancel();
        if (mounted) {
          await context.router.replaceAll([
            CompanyDocumentsRoute(rejectionReason: status.rejectionReason),
          ]);
        }
      }
    } catch (_) {
      // Следующая попытка через [_pollInterval].
    } finally {
      _isChecking = false;
    }
  }

  Future<void> _logout() async {
    resetAfterLogout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const Spacer(),
              Image.asset(
                Assets.images.png.timeLeft1.path,
                width: 81,
                height: 81,
              ),
              const SizedBox(height: 32),
              Text(
                _approvalNotificationShown
                    ? 'Регистрация подтверждена'
                    : 'Ожидайте подтверждения администратором',
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                _approvalNotificationShown
                    ? 'Нажмите на push-уведомление «Вы успешно зарегистрировались!», чтобы войти в приложение.'
                    : 'Ваша заявка на регистрацию принята. После проверки администратором вы получите push-уведомление.',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5F5F5),
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Статус заявки',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      _approvalNotificationShown
                          ? 'Подтверждено'
                          : 'На рассмотрении',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black87,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: OutlinedButton(
                  onPressed: _logout,
                  style: OutlinedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Text(
                    'Выйти',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}
