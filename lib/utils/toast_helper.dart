import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class ToastHelper {
  static void showSuccess(
      {required BuildContext context,
      required String title,
      required String description}) {
    toastification.show(
      context: context,
      style: ToastificationStyle.flat,
      type: ToastificationType.success,
      title: Text(title),
      description: Text(description),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static void showWarning(
      {required BuildContext context,
      required String title,
      required String description}) {
    toastification.show(
      context: context,
      style: ToastificationStyle.flat,
      type: ToastificationType.warning,
      title: Text(title),
      description: Text(description),
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static void showInfo(
      {required BuildContext context,
      required String title,
      String? description}) {
    toastification.show(
      context: context,
      style: ToastificationStyle.flat,
      type: ToastificationType.info,
      title: Text(title),
      description: description != null ? Text(description) : null,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }

  static void showError(
      {required BuildContext context,
      required String title,
      String? description}) {
    toastification.show(
      context: context,
      style: ToastificationStyle.flat,
      type: ToastificationType.error,
      title: Text(title),
      description: description != null ? Text(description) : null,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
