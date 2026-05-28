import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:ikidz/src/feature/main/presentation/widgets/my_responses_bs.dart';
import 'package:ikidz/src/feature/app/router/app_router.dart';

@RoutePage()
class MyResponsesPage extends StatefulWidget {
  const MyResponsesPage({super.key});

  @override
  State<MyResponsesPage> createState() => _MyResponsesPageState();
}

class _MyResponsesPageState extends State<MyResponsesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Мои отметки',
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: GestureDetector(
              onTap: () {
                MyResponsesBS.show(context);
              },
              child: Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  color: const Color(0xFF4A9EFF),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Icon(
                  Icons.filter_alt_outlined,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ReportCard(
            reportId: 'report_001', // Добавили ID
            status: 'На рассмотрении',
            statusIcon: Icons.access_time,
            statusColor: Colors.orange,
            date: 'Сегодня',
            title: 'Провал на дороге',
            address: 'ул. Абая, 150',
            imageUrl: 'https://media.istockphoto.com/id/531854696/photo/broken-road-in-the-woods.jpg?s=612x612&w=0&k=20&c=5fKL04SLoJSji7M8LsjJbjlOtFxf91fu6h0c5ZJvvns=', 
          ),
          SizedBox(height: 16),
          ReportCard(
            reportId: 'report_002', // Добавили ID
            status: 'Подтверждена',
            statusIcon: Icons.check_circle_outline,
            statusColor: Color(0xFF34C759),
            date: 'Вчера',
            title: 'Провал на дороге',
            address: 'Толе би / Байт',
            imageUrl: 'https://www.transpoco.com/hubfs/the_pothole_problem_1%2C000%2C000%20reports%20every%20year%20(one%20every%20two%20minutes).png',
            showMapButton: true,
          ),
          SizedBox(height: 16),
          ReportCard(
            reportId: 'report_003', // Добавили ID
            status: 'Отклонена',
            statusIcon: Icons.cancel_outlined,
            statusColor: Colors.red,
            date: '20 дек',
            title: 'Трещина в асфальте',
            address: 'пр. Сатпаева, 90',
            imageUrl: 'https://s7d1.scene7.com/is/image/bridgestone/highway-with-potholes-and-snow-blog-images-2019-03-fcac-web-bsro?scl=1',
          ),
        ],
      ),
    );
  }
}

class ReportCard extends StatelessWidget {
  final String reportId; 
  final String status;
  final IconData statusIcon;
  final Color statusColor;
  final String date;
  final String title;
  final String address;
  final String imageUrl;
  final bool showMapButton;

  const ReportCard({
    super.key,
    required this.reportId,
    required this.status,
    required this.statusIcon,
    required this.statusColor,
    required this.date,
    required this.title,
    required this.address,
    required this.imageUrl,
    this.showMapButton = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        
        context.router.push(ReportDetailRoute(reportId: reportId, imageUrl: imageUrl));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  // Header with status and date
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            statusIcon,
                            color: statusColor,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Text(
                            status,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: statusColor,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        date,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  
                  // Image and details
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Image
                      Container(
                        width: 120,
                        height: 120,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey.shade300,
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            imageUrl,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) {
                              return Container(
                                color: Colors.grey.shade300,
                                child: const Icon(
                                  Icons.image,
                                  color: Colors.grey,
                                  size: 40,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      const SizedBox(width: 16),
                      
                      // Title and address
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Icon(
                                  Icons.location_on_outlined,
                                  color: Colors.grey,
                                  size: 18,
                                ),
                                const SizedBox(width: 4),
                                Expanded(
                                  child: Text(
                                    address,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            
            // Map button
            if (showMapButton)
              Container(
                width: double.infinity,
                margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                child: ElevatedButton(
                  onPressed: () {
                    // Открыть карту
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF4A9EFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    elevation: 0,
                  ),
                  child: const Text(
                    'Посмотреть на карте',
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
      ),
    );
  }
}