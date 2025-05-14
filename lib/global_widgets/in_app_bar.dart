import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/colors.dart';

PreferredSizeWidget inAppBar(String title, {List<Widget>? actions}) {
  return AppBar(
    backgroundColor: AppColors.background,
    centerTitle: true,
    leading: IconButton(
      onPressed: () => Get.back(),
      icon: const Icon(Icons.arrow_back_ios_new),
    ),
    title: Text(
      title,
      style: GoogleFonts.roboto(fontWeight: FontWeight.w600),
    ),
    actions: actions,
  );
}
