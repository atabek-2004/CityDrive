import 'package:flutter/material.dart';
import 'package:city_drive/src/core/local_storage/user_role.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/company_data_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/company_documents_page.dart';
import 'package:city_drive/src/feature/auth/presentation/pages/pending_approval_page.dart';
import 'package:city_drive/src/feature/auth/presentation/utils/auth_navigation.dart';
import 'package:city_drive/src/feature/auth/presentation/widgets/company_cubit_scope.dart';

/// Выбирает экран регистрации контроллера по `GET company/registration-state`.
class ControllerRegistrationGate extends StatefulWidget {
  const ControllerRegistrationGate({super.key});

  @override
  State<ControllerRegistrationGate> createState() =>
      _ControllerRegistrationGateState();
}

class _ControllerRegistrationGateState extends State<ControllerRegistrationGate> {
  _GateStep _step = _GateStep.loading;
  String? _rejectionReason;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _resolveStep());
  }

  Future<void> _resolveStep() async {
    final auth = context.repository.authRepository;
    final role = context.repository.sessionRepository.currentRole;

    if (role != UserRole.controller) {
      if (mounted) setState(() => _step = _GateStep.pendingApproval);
      return;
    }

    if (auth.isApproved) {
      final user = auth.user;
      if (user != null && mounted) navigateAfterAuth(context, user);
      return;
    }

    try {
      final state =
          await context.repository.companyRepository.getRegistrationState();
      if (!mounted) return;

      setState(() {
        _rejectionReason = state.rejectionReason;
        _step = switch (state.step) {
          'company_data' => _GateStep.companyData,
          'documents' => _GateStep.documents,
          'rejected' => _GateStep.documents,
          'pending_review' => _GateStep.pendingApproval,
          'approved' when state.isApproved => _GateStep.approved,
          _ => _GateStep.companyData,
        };
      });

      if (_step == _GateStep.approved && auth.user != null) {
        navigateAfterAuth(context, auth.user!);
      }
    } catch (_) {
      if (mounted) setState(() => _step = _GateStep.companyData);
    }
  }

  @override
  Widget build(BuildContext context) {
    return switch (_step) {
      _GateStep.loading => const CustomLoadingOverlayWidget(),
      _GateStep.companyData => CompanyCubitScope(
          child: CompanyDataPage(
            onCompanySaved: () => setState(() => _step = _GateStep.documents),
          ),
        ),
      _GateStep.documents => CompanyCubitScope(
          child: CompanyDocumentsPage(
            rejectionReason: _rejectionReason,
            onDocumentsSubmitted: () =>
                setState(() => _step = _GateStep.pendingApproval),
          ),
        ),
      _GateStep.pendingApproval => const PendingApprovalPage(),
      _GateStep.approved => const CustomLoadingOverlayWidget(),
    };
  }
}

enum _GateStep {
  loading,
  companyData,
  documents,
  pendingApproval,
  approved,
}
