import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';

class CreateNewRecord extends StatefulWidget {
  const CreateNewRecord({super.key});

  @override
  State<CreateNewRecord> createState() => _CreateNewRecordState();
}

class _CreateNewRecordState extends State<CreateNewRecord> {
  int n = 3;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.80,
      width: MediaQuery.of(context).size.width * 0.90,
      alignment: Alignment.center,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text('Date Picker'),
            Text('${1 + 2 / n}'),
          ],
        ),
      ),
    );
  }
}
