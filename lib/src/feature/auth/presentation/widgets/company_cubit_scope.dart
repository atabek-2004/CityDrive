import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/auth/bloc/company_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// Provides [CompanyCubit] for company registration screens.
///
/// Used by [AutoRouteWrapper.wrappedRoute] and when pages are embedded in
/// [ControllerRegistrationGate] (router wrapper is not applied there).
class CompanyCubitScope extends StatelessWidget {
  const CompanyCubitScope({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CompanyCubit(
        repository: context.repository.companyRepository,
      ),
      child: child,
    );
  }
}
