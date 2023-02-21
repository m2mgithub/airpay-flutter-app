import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogHelper
{
  static void showErrorDialog({String? message}) {
    Get.snackbar(
      'Error',
      message!,
      icon: Icon(
        Icons.error_outline,
        color: Colors.red
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }

  static void showSuccessDialog({String? message}) {
    Get.snackbar(
      'Success',
      message!,
      icon: Icon(
        Icons.celebration_outlined,
        color: Colors.green
      ),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}