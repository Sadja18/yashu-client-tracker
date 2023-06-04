import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DatePicker extends StatefulWidget {
  final Function(String?) dateSelector;

  const DatePicker({super.key, required this.dateSelector});

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime date = DateTime.now();

  DateTime startDate = DateTime.now();

  DateTime firstDate = DateTime(
      DateTime.now().year, DateTime.now().month - 1, DateTime.now().day);

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date,
      firstDate: firstDate,
      lastDate: startDate,
      locale: const Locale('en'),
    );
    if (picked != null && picked != date) {
      widget.dateSelector(DateFormat('yyyy-MM-dd').format(picked).toString());
      setState(() {
        date = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.06,
      width: MediaQuery.of(context).size.height,
      child: ElevatedButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.calendar_month,
              size: 25,
              color: Colors.white,
            ),
            Text(
              DateFormat('MMM dd').format(date),
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        onPressed: () => _selectDate(context),
      ),
    );
  }
}
