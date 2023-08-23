import 'package:flutter/material.dart';

class ReUseAbleRow extends StatelessWidget {
  String title, value;
  ReUseAbleRow({Key? key, required this.title, required this.value}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 5),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(title, style: const TextStyle(color: Colors.white, fontSize: 14),),
              Text(value, style: const TextStyle(color: Colors.white, fontSize: 14),),
            ],
          ),
          Divider(
            thickness: 0.8,
            color: Colors.grey.shade600,
          ),
        ],
      ),
    );
  }
}