import 'dart:ui';
import 'package:flutter/material.dart';
import '../../features/home/presentation/controller/home_controller.dart';
import 'text_widget.dart';

Future showDialogWidget(
  BuildContext context,
  HomeController homeController,
  int index,
  String subtitle,
  String title,
  bool isDark,
) {
  return showDialog(
    context: context,
    // ignore: deprecated_member_use
    barrierColor: Colors.black.withOpacity(0.4), 
    builder: (context) => Dialog(
      backgroundColor: Colors.transparent, 
      insetPadding: EdgeInsets.all(20),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              // ignore: deprecated_member_use
              color: Colors.black.withOpacity(0.5), 
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                // ignore: deprecated_member_use
                color: Colors.white.withOpacity(0.1),
              ),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                SizedBox(height: 15),
                textWidget(
                  isDark: true,
                  txt: subtitle,
                  fontSize: 15,
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: textWidget(
                          isDark: true, txt: "Cancel", fontSize: 14),
                    ),
                    
                    TextButton(
                      onPressed: () {
                        homeController.deleteProject(index);
                        Navigator.pop(context);
                      },
                      child: textWidget(
                        isDark: true,
                        txt: "Delete",
                        fontSize: 14,
                        weight: "b",
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
