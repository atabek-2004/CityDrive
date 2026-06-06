import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:city_drive/src/core/presentation/widgets/dialog/toaster.dart';
import 'package:city_drive/src/core/presentation/widgets/other/custom_loading_overlay_widget.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/bloc/company_cubit.dart';
import 'package:city_drive/src/feature/auth/models/company_dto.dart';

@RoutePage()
class CompanyDataPage extends StatefulWidget implements AutoRouteWrapper {
  const CompanyDataPage({super.key, this.onCompanySaved});

  /// When embedded in [ControllerRegistrationGate], advances the gate instead
  /// of pushing a duplicate documents route.
  final VoidCallback? onCompanySaved;

  @override
  State<CompanyDataPage> createState() => _CompanyDataPageState();

  @override
  Widget wrappedRoute(BuildContext context) {
    return BlocProvider(
      create: (_) => CompanyCubit(
        repository: context.repository.companyRepository,
      ),
      child: this,
    );
  }
}

class _CompanyDataPageState extends State<CompanyDataPage> {
  final _companyNameController = TextEditingController();
  final _binController = TextEditingController();
  final _addressController = TextEditingController();
  final _yearController = TextEditingController();

  bool get isFormValid {
    final year = int.tryParse(_yearController.text);
    final currentYear = DateTime.now().year;
    return _companyNameController.text.trim().isNotEmpty &&
        _binController.text.length == 12 &&
        _addressController.text.trim().isNotEmpty &&
        year != null &&
        year >= 1900 &&
        year <= currentYear;
  }

  @override
  void initState() {
    super.initState();
    for (final c in [
      _companyNameController,
      _binController,
      _addressController,
      _yearController,
    ]) {
      c.addListener(() => setState(() {}));
    }
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _binController.dispose();
    _addressController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  void _submit() {
    final year = int.parse(_yearController.text);
    context.read<CompanyCubit>().saveCompany(
          CompanyRequest(
            name: _companyNameController.text.trim(),
            bin: _binController.text.trim(),
            legalAddress: _addressController.text.trim(),
            foundedYear: year,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return LoaderOverlay(
      overlayWidgetBuilder: (_) => const CustomLoadingOverlayWidget(),
      child: BlocListener<CompanyCubit, CompanyState>(
        listener: (context, state) {
          state.maybeWhen(
            loading: () => context.loaderOverlay.show(),
            companySaved: (_) {
              context.loaderOverlay.hide();
              final onSaved = widget.onCompanySaved;
              if (onSaved != null) {
                onSaved();
              } else {
                context.router.replace(CompanyDocumentsRoute());
              }
            },
            error: (message) {
              context.loaderOverlay.hide();
              Toaster.showErrorTopShortToast(context, message);
            },
            orElse: () => context.loaderOverlay.hide(),
          );
        },
        child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => context.router.maybePop(),
            ),
          ),
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Заполните данные о компании',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 32),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _fieldLabel('Название компании'),
                          _CompanyTextField(
                            controller: _companyNameController,
                            hintText: 'Введите название компании',
                          ),
                          const SizedBox(height: 24),
                          _fieldLabel('БИН'),
                          _CompanyTextField(
                            controller: _binController,
                            hintText: '180540012345',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(12),
                            ],
                          ),
                          const SizedBox(height: 24),
                          _fieldLabel('Юридический адрес'),
                          _CompanyTextField(
                            controller: _addressController,
                            hintText: 'г. Алматы, ул. Тимирязева, 42',
                          ),
                          const SizedBox(height: 24),
                          _fieldLabel('Год основания'),
                          _CompanyTextField(
                            controller: _yearController,
                            hintText: '2018',
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              LengthLimitingTextInputFormatter(4),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: isFormValid ? _submit : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF4A9EFF),
                        disabledBackgroundColor:
                            const Color(0xFF4A9EFF).withValues(alpha: 0.5),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Далее',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _fieldLabel(String text) => Padding(
        padding: const EdgeInsets.only(bottom: 8),
        child: Text(
          text,
          style: const TextStyle(fontSize: 16, color: Colors.black87),
        ),
      );
}

class _CompanyTextField extends StatelessWidget {
  const _CompanyTextField({
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
  });

  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFFF5F5F5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: TextField(
        controller: controller,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
