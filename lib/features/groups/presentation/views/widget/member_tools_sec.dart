import 'package:flutter/material.dart';

class MemberToolsSec extends StatelessWidget {
  const MemberToolsSec({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Tools: '),
       // Expanded(child: GridView.builder(gridDelegate: gridDelegate, itemBuilder: itemBuilder))
      ],
    );
  }
}