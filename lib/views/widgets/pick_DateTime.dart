import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

Future<void> pickDate(
  BuildContext context,
  TextEditingController controller,
) async {
  DateTime? picked = await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2030),
  );
  if (picked != null) {
    controller.text = DateFormat('dd/MM/yyyy').format(picked);
  }
}

Future<void> pickTime(
  BuildContext context,
  TextEditingController controller,
) async {
  TimeOfDay? picked = await showTimePicker(
    context: context,
    initialTime: TimeOfDay.now(),
  );
  if (picked != null) {
    final now = DateTime.now();
    final dt = DateTime(
      now.year,
      now.month,
      now.day,
      picked.hour,
      picked.minute,
    );
    controller.text = DateFormat('hh:mm a').format(dt);
  }
}
