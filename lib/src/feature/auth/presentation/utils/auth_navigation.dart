import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/bloc/app_bloc.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/models/user_dto.dart';

void navigateAfterAuth(BuildContext context, UserDTO user) {
  final role = context.repository.sessionRepository.currentRole;

  if (!context.repository.authRepository.isApproved) {
    if (role == UserRole.controller) {
      navigateByRegistrationState(context);
      return;
    }
    context.router.replaceAll([const PendingApprovalRoute()]);
    return;
  }

  BlocProvider.of<AppBloc>(context).add(AppEvent.logining(user: user));
  context.router.replaceAll([const LauncherRoute()]);
}

Future<void> navigateByRegistrationState(BuildContext context) async {
  final auth = context.repository.authRepository;
  final role = context.repository.sessionRepository.currentRole;
  final user = auth.user;

  if (user == null) return;

  if (role != UserRole.controller) {
    navigateAfterAuth(context, user);
    return;
  }

  if (auth.isApproved) {
    BlocProvider.of<AppBloc>(context).add(AppEvent.logining(user: user));
    await context.router.replaceAll([const LauncherRoute()]);
    return;
  }

  try {
    final state =
        await context.repository.companyRepository.getRegistrationState();
    if (!context.mounted) return;

    switch (state.step) {
      case 'company_data':
        await context.router.replaceAll([CompanyDataRoute()]);
      case 'documents':
      case 'rejected':
        await context.router.replaceAll([
          CompanyDocumentsRoute(rejectionReason: state.rejectionReason),
        ]);
      case 'pending_review':
        await context.router.replaceAll([const PendingApprovalRoute()]);
      case 'approved':
        if (state.isApproved) {
          navigateAfterAuth(context, user);
        } else {
          await context.router.replaceAll([const PendingApprovalRoute()]);
        }
      default:
        await context.router.replaceAll([CompanyDataRoute()]);
    }
  } catch (_) {
    if (context.mounted) {
      await context.router.replaceAll([CompanyDataRoute()]);
    }
  }
}

void navigateAfterControllerRegistration(BuildContext context, UserDTO user) {
  navigateByRegistrationState(context);
}
