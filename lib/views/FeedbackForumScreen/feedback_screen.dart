import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qazquery/global_widgets/in_app_bar.dart';

class FeedbackForumScreen extends StatelessWidget {
  FeedbackForumScreen({super.key});

  final TextEditingController messageController = TextEditingController();
  final RxList<Map<String, String>> messages = <Map<String, String>>[].obs;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: inAppBar("Кері байланыс"),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(
              child: Obx(() => messages.isEmpty
                  ? Center(
                      child:
                          Text("Пікірлер әлі жоқ", style: GoogleFonts.roboto()))
                  : ListView.builder(
                      itemCount: messages.length,
                      itemBuilder: (context, index) {
                        final msg = messages[index];
                        return Container(
                          margin: const EdgeInsets.only(bottom: 10),
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                blurRadius: 5,
                                offset: const Offset(0, 2),
                              ),
                            ],
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(msg['author'] ?? 'Аноним',
                                  style: GoogleFonts.roboto(
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 5),
                              Text(msg['text'] ?? '',
                                  style: GoogleFonts.roboto()),
                            ],
                          ),
                        );
                      },
                    )),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: messageController,
                    decoration: InputDecoration(
                      hintText: 'Хабарлама жазыңыз...',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () {
                    if (messageController.text.trim().isNotEmpty) {
                      messages.add({
                        'author':
                            'Студент', // можно заменить на имя пользователя
                        'text': messageController.text.trim(),
                      });
                      messageController.clear();
                    }
                  },
                  child: const Icon(Icons.send),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
