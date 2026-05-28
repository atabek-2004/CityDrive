import 'package:flutter/material.dart';


class ContractorAnnouncementsPage extends StatefulWidget {
  const ContractorAnnouncementsPage({super.key});

  @override
  State<ContractorAnnouncementsPage> createState() =>
      _ContractorAnnouncementsPageState();
}

class _ContractorAnnouncementsPageState
    extends State<ContractorAnnouncementsPage> {
  int selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8F9FA),
      body: SafeArea(
        child: Column(
          children: [
            // Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  const Text(
                    'Объявления',
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Spacer(),
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: const Color(0xFF4A9EFF),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 24,
                    ),
                  ),
                ],
              ),
            ),

            // Stats cards
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  Expanded(
                    child: StatsCard(
                      count: '12',
                      label: 'Новые',
                      color: const Color(0xFFFF3B30),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      count: '3',
                      label: 'Заявки',
                      color: const Color(0xFFAF52DE),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      count: '1',
                      label: 'В работе',
                      color: const Color(0xFFFF9500),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: StatsCard(
                      count: '5',
                      label: 'Готово',
                      color: const Color(0xFF34C759),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                children: [
                  TabButton(
                    title: 'Новые',
                    count: 12,
                    isSelected: selectedTab == 0,
                    onTap: () => setState(() => selectedTab = 0),
                  ),
                  const SizedBox(width: 12),
                  TabButton(
                    title: 'Мои',
                    count: 3,
                    isSelected: selectedTab == 1,
                    onTap: () => setState(() => selectedTab = 1),
                  ),
                  const SizedBox(width: 12),
                  TabButton(
                    title: 'История',
                    isSelected: selectedTab == 2,
                    onTap: () => setState(() => selectedTab = 2),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Announcements list
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 2,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: AnnouncementCard(
                      title: 'Ямочный ремонт',
                      address: 'ул. Абая, 150',
                      budget: index == 0 ? '850000тг' : '5000000тг',
                      deadline: '30 дней',
                      isCritical: true,
                      publishedYesterday: true,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const CustomBottomNav(selectedIndex: 0),
    );
  }
}

class StatsCard extends StatelessWidget {
  final String count;
  final String label;
  final Color color;

  const StatsCard({
    super.key,
    required this.count,
    required this.label,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          Text(
            count,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              color: Colors.grey.shade600,
            ),
          ),
        ],
      ),
    );
  }
}

class TabButton extends StatelessWidget {
  final String title;
  final int? count;
  final bool isSelected;
  final VoidCallback onTap;

  const TabButton({
    super.key,
    required this.title,
    this.count,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.grey.shade700 : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          count != null ? '$title $count' : title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
            color: isSelected ? Colors.white : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}

class AnnouncementCard extends StatelessWidget {
  final String title;
  final String address;
  final String budget;
  final String deadline;
  final bool isCritical;
  final bool publishedYesterday;

  const AnnouncementCard({
    super.key,
    required this.title,
    required this.address,
    required this.budget,
    required this.deadline,
    this.isCritical = false,
    this.publishedYesterday = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              if (isCritical)
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: const Color(0xFFFF3B30),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: const Text(
                    'Критический',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Icon(
                Icons.location_on_outlined,
                size: 20,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Text(
                address,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.account_balance_wallet_outlined,
                size: 20,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Text(
                budget,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Icon(
                Icons.access_time,
                size: 20,
                color: Colors.grey.shade600,
              ),
              const SizedBox(width: 8),
              Text(
                deadline,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
          if (publishedYesterday) ...[
            const SizedBox(height: 12),
            Text(
              'Опубликовано вчера',
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey.shade500,
              ),
            ),
          ],
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {
                // Navigate to details
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF4A9EFF),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 0,
              ),
              child: const Text(
                'Подробнее',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBottomNav extends StatelessWidget {
  final int selectedIndex;

  const CustomBottomNav({
    super.key,
    required this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, -5),
          ),
        ],
      ),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              NavBarItem(
                icon: Icons.home,
                label: 'Главная',
                isSelected: selectedIndex == 0,
                onTap: () {},
              ),
              NavBarItem(
                icon: Icons.description_outlined,
                label: 'Мое действие',
                isSelected: selectedIndex == 1,
                onTap: () {},
              ),
              NavBarItem(
                icon: Icons.person_outline,
                label: 'Профиль',
                isSelected: selectedIndex == 2,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NavBarItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const NavBarItem({
    super.key,
    required this.icon,
    required this.label,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: Colors.transparent,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              icon,
              color: isSelected ? Colors.black : Colors.grey.shade600,
              size: 28,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? Colors.black : Colors.grey.shade600,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
              ),
            ),
            if (isSelected)
              Container(
                margin: const EdgeInsets.only(top: 4),
                width: 40,
                height: 3,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
          ],
        ),
      ),
    );
  }
}