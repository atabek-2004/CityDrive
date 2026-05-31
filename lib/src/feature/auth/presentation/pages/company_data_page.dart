import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:city_drive/src/core/utils/extensions/context_extension.dart';
import 'package:city_drive/src/feature/app/router/app_router.dart';
import 'package:city_drive/src/feature/auth/data/local_auth_repository.dart';

@RoutePage()
class CompanyDataPage extends StatefulWidget {
  const CompanyDataPage({super.key});

  @override
  State<CompanyDataPage> createState() => _CompanyDataPageState();
}

class _CompanyDataPageState extends State<CompanyDataPage> {
  final _formKey = GlobalKey<FormState>();
  final _companyNameController = TextEditingController();
  final _binController = TextEditingController();
  final _addressController = TextEditingController();
  final _yearController = TextEditingController();

  bool get isFormValid {
    return _companyNameController.text.isNotEmpty &&
        _binController.text.isNotEmpty &&
        _addressController.text.isNotEmpty &&
        _yearController.text.isNotEmpty;
  }

  @override
  void initState() {
    super.initState();
    _companyNameController.addListener(() => setState(() {}));
    _binController.addListener(() => setState(() {}));
    _addressController.addListener(() => setState(() {}));
    _yearController.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _companyNameController.dispose();
    _binController.dispose();
    _addressController.dispose();
    _yearController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      
                        const Text(
                          'Название компании',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _companyNameController,
                          
                          hintText: 'Введите название компании',
                        ),
                        const SizedBox(height: 24),
                        
    
                        const Text(
                          'Бин',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _binController,
                          hintText: '180540012345',
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(12),
                          ],
                        ),
                        const SizedBox(height: 24),
                        
                        // Юридический адрес
                        const Text(
                          'Юридический адрес',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
                          controller: _addressController,
                          hintText: 'г. Алматы, ул. Тимирязева, 42',
                        ),
                        const SizedBox(height: 24),
                        
                        // Год основания
                        const Text(
                          'Год основания',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.black87,
                          ),
                        ),
                        const SizedBox(height: 8),
                        CustomTextField(
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
              ),
              
              // Далее button
              const SizedBox(height: 16),
              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: isFormValid
                      ? () async {
                          final userId =
                              context.repository.authRepository.user?.id;
                          if (userId != null) {
                            final repo = context.repository.authRepository;
                            if (repo is LocalAuthRepository) {
                              await repo.saveCompany(
                                userId: userId,
                                name: _companyNameController.text.trim(),
                                bin: _binController.text.trim(),
                                address: _addressController.text.trim(),
                                foundedYear: _yearController.text.trim(),
                              );
                            }
                          }
                          if (!context.mounted) return;
                          context.router.push(CompanyDocumentsRoute());
                        }
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A9EFF),
                    disabledBackgroundColor: const Color(0xFF4A9EFF).withOpacity(0.5),
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
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.keyboardType,
    this.inputFormatters,
  });

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
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
        decoration: InputDecoration(
          
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 16,
            color: Colors.grey.shade500,
          ),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 18,
          ),
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Color(0xFF4A9EFF),
              width: 2,
            ),
          ),
        ),
      ),
    );
  }
}