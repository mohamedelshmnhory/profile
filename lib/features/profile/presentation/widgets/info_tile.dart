import 'package:flutter/material.dart';

import '../../../../core/resources.dart';

class InfoTile extends StatelessWidget {
  const InfoTile({super.key, required this.title, required this.value});
  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 4,
      color: Colors.white,
      child: ListTile(
        leading: const Icon(Icons.book, color: Colors.blue),
        title: AppText(text: title, style: bold18),
        subtitle: AppText(text: value, style: meduim14),
        // trailing: const Icon(Icons.arrow_forward, color: Colors.blue),
      ),
    );
  }
}
