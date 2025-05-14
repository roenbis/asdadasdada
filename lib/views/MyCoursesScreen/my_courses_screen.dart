import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:qazquery/controllers/course_controller.dart';
import 'package:qazquery/global_widgets/custom_app_bar.dart';
import 'widgets/my_course_grid.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qazquery/utils/assets_manager.dart';

class MyCoursesScreen extends StatelessWidget {
  const MyCoursesScreen({super.key});

  void _showCertificateDialog(BuildContext context, String title) {
    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text('$title - Сертификат'),
        content: const SizedBox(
          height: 200,
          child: Center(
            child: Icon(
              Icons.picture_as_pdf,
              size: 100,
              color: Colors.red,
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Жабу'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final certificates = [
      {'title': 'Сертификат 1', 'date': '24.04.2025'},
      {'title': 'Сертификат 2', 'date': '25.04.2025'},
      {'title': 'Сертификат 3', 'date': '26.04.2025'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Жеке кабинет',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Colors.white,
                  child: SvgPicture.asset(SvgManager.avatar),
                ),
                const SizedBox(width: 12),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Test User',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'test@example.com',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 30),
            const Text(
              "Сертификат",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: certificates.length,
                itemBuilder: (ctx, index) {
                  final cert = certificates[index];
                  return InkWell(
                    onTap: () =>
                        _showCertificateDialog(context, cert['title']!),
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      margin: const EdgeInsets.symmetric(vertical: 8),
                      child: ListTile(
                        leading: const Icon(Icons.workspace_premium_rounded,
                            color: Colors.amber),
                        title: Text(cert['title']!),
                        subtitle: Text('Берілген күні: ${cert['date']}'),
                        trailing: const Icon(Icons.visibility),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
