import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AppDialog {
  AppDialog._();

  static bool isOpen = false;

  static void showConfirmation(
    BuildContext context, {
    bool barrierDismissible = true,
    Function? whenComplete,
    String title = "Confirm",
    required String message,
    String cancelText = "Cancel",
    String confirmText = "Confirm",
    Function()? onCancel,
    Function()? onConfirm,
  }) {
    dismiss(context);
    isOpen = true;
    showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            color: Colors.blue,
            fontSize: 16.h,
          ),
        ),
        content: Text(
          message,
          style: TextStyle(
            color: Colors.black,
            fontSize: 12.h,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () {
              if (onCancel != null) {
                onCancel();
              } else {
                context.pop();
              }
            },
            child: Text(
              cancelText,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13.h,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              if (onConfirm != null) {
                onConfirm();
              } else {
                context.pop();
              }
            },
            child: Text(
              confirmText,
              style: TextStyle(
                color: Colors.blue,
                fontSize: 13.h,
              ),
            ),
          ),
        ],
      ),
    ).whenComplete(() {
      isOpen = false;
      if (whenComplete != null) {
        whenComplete();
      }
    });
  }

  static void dismiss(BuildContext context) {
    if (isOpen) {
      context.pop();
    }
  }
}
