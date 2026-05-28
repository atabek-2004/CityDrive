import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:ikidz/src/core/theme/resources.dart';
import 'package:ikidz/src/feature/main/presentation/pages/problem_detail_page.dart';

class MyWorksPage extends StatefulWidget {
  const MyWorksPage({super.key});

  @override
  State<MyWorksPage> createState() => _MyWorksPageState();
}

class _MyWorksPageState extends State<MyWorksPage> {
  String _selectedMainFilter = 'Заявки';
  String _selectedSubFilter = 'В процессе'; // для фильтра "В работе"

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Основные фильтры
                  Row(
                    children: [
                      _FilterChip(
                        label: 'Заявки',
                        isSelected: _selectedMainFilter == 'Заявки',
                        onTap: () {
                          setState(() {
                            _selectedMainFilter = 'Заявки';
                          });
                        },
                      ),
                      const Gap(8),
                      _FilterChip(
                        label: 'В работе',
                        isSelected: _selectedMainFilter == 'В работе',
                        onTap: () {
                          setState(() {
                            _selectedMainFilter = 'В работе';
                            _selectedSubFilter = 'В процессе';
                          });
                        },
                      ),
                      const Gap(8),
                      _FilterChip(
                        label: 'Отмененные',
                        isSelected: _selectedMainFilter == 'Отмененные',
                        onTap: () {
                          setState(() {
                            _selectedMainFilter = 'Отмененные';
                          });
                        },
                      ),
                    ],
                  ),

                  // Дополнительные фильтры для "В работе"
                  if (_selectedMainFilter == 'В работе') ...[
                    const Gap(12),
                    Row(
                      children: [
                        _FilterChip(
                          label: 'В процессе',
                          isSelected: _selectedSubFilter == 'В процессе',
                          color: const Color(0xFF4CD964),
                          onTap: () {
                            setState(() {
                              _selectedSubFilter = 'В процессе';
                            });
                          },
                        ),
                        const Gap(8),
                        _FilterChip(
                          label: 'Завершенные',
                          isSelected: _selectedSubFilter == 'Завершенные',
                          color: Colors.grey,
                          onTap: () {
                            setState(() {
                              _selectedSubFilter = 'Завершенные';
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),

            // Список работ
            Expanded(
              child: ListView(
                padding: const EdgeInsets.all(16),
                children: [
                  if (_selectedMainFilter == 'Заявки') ...[
                    _WorkCard(
                      title: 'Ремонт провала на дороге',
                      address: 'ул. Абая, 150',
                      cost: '850000тг',
                      days: '30 дней',
                      statusLabel: 'На рассмотрении',
                      statusColor: const Color(0xFF00D9FF),
                      severityLabel: 'Критический',
                      severityColor: const Color(0xFFFF6B6B),
                    ),
                    const Gap(16),
                    _WorkCard(
                      title: 'Заделка ямы на прекрестке',
                      address: 'ул. Толеби/Байтурсынова, 150',
                      cost: '850000тг',
                      days: '30 дней',
                      statusLabel: 'На рассмотрении',
                      statusColor: const Color(0xFF00D9FF),
                      severityLabel: 'Высокий',
                      severityColor: const Color(0xFFFFA726),
                    ),
                  ],
                  if (_selectedMainFilter == 'В работе' &&
                      _selectedSubFilter == 'В процессе') ...[
                    _WorkCard(
                      title: 'Ремонт провала на дороге',
                      address: 'ул. Абая, 150',
                      cost: '850000тг',
                      days: '30 дней',
                      statusLabel: 'В процессе',
                      statusColor: const Color(0xFF4CD964),
                      severityLabel: 'Критический',
                      severityColor: const Color(0xFFFF6B6B),
                    ),
                    const Gap(16),
                    _WorkCard(
                      title: 'Заделка ямы на прекрестке',
                      address: 'ул. Абылайхана, 370',
                      cost: '850000тг',
                      days: '30 дней',
                      statusLabel: 'В работе',
                      statusColor: const Color(0xFF00D9FF),
                      severityLabel: 'Высокий',
                      severityColor: const Color(0xFFFFA726),
                    ),
                  ],
                  if (_selectedMainFilter == 'В работе' &&
                      _selectedSubFilter == 'Завершенные') ...[
                    _WorkCard(
                      title: 'Ремонт провала на дороге',
                      address: 'ул. Абая, 150',
                      cost: '850000тг',
                      days: '30 дней',
                      statusLabel: 'Завершено',
                      statusColor: Colors.green,
                      severityLabel: 'Критический',
                      severityColor: const Color(0xFFFF6B6B),
                    ),
                  ],
                  if (_selectedMainFilter == 'Отмененные') ...[
                    _WorkCard(
                      title: 'Ремонт провала на дороге',
                      address: 'ул. Абая, 150',
                      cost: '850000тг',
                      days: '30 дней',
                      statusLabel: 'Отменено',
                      statusColor: Colors.grey,
                    ),
                  ],
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _FilterChip extends StatelessWidget {
  const _FilterChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.color,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? (color ?? const Color(0xFF4CD964))
              : const Color(0xFFE7E7E7),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey,
            fontSize: 14,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
          ),
        ),
      ),
    );
  }
}

class _WorkCard extends StatelessWidget {
  const _WorkCard({
    required this.title,
    required this.address,
    required this.cost,
    required this.days,
    required this.statusLabel,
    required this.statusColor,
    this.severityLabel,
    this.severityColor,
  });

  final String title;
  final String address;
  final String cost;
  final String days;
  final String statusLabel;
  final Color statusColor;
  final String? severityLabel;
  final Color? severityColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Статусы
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                decoration: BoxDecoration(
                  color: statusColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  statusLabel,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              if (severityLabel != null && severityColor != null) ...[
                const Gap(8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: severityColor,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    severityLabel!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ],
          ),
          const Gap(12),

          // Заголовок
          Text(
            title,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Gap(12),

          // Информация
          Row(
            children: [
              const Icon(Icons.location_on_outlined,
                  size: 16, color: Colors.grey),
              const Gap(4),
              Text(
                address,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              const Icon(Icons.attach_money, size: 16, color: Colors.grey),
              const Gap(4),
              Text(
                cost,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const Gap(8),
          Row(
            children: [
              const Icon(Icons.access_time, size: 16, color: Colors.grey),
              const Gap(4),
              Text(
                days,
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
          const Gap(16),

          // Кнопка
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProblemDetailPage(
                      isSubmit: true,
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.mainColor,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: const Text(
                'Подробнее',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
