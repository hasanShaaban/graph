import 'package:flutter/material.dart';
import 'package:graph/features/profile/domain/entity/profile_entity.dart';
import '../../../../../core/utils/constants.dart';

class BioSec extends StatefulWidget {
  const BioSec({super.key, required this.onBioChanged, required this.profile});
  final Function(String) onBioChanged;
  final ProfileEntity profile;

  @override
  State<BioSec> createState() => _BioSecState();
}

class _BioSecState extends State<BioSec> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.profile.bio);
  }

  @override
  void didUpdateWidget(covariant BioSec oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.profile.bio != widget.profile.bio) {
      _controller.text = widget.profile.bio!;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        TextField(
          controller: _controller,
          style: TextStyle(color: Colors.black),
          onChanged: widget.onBioChanged,
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(15),
            ),
            fillColor: Constants2.lightSecondaryColor(context),
            filled: true,
          ),
        ),
        Positioned(top: -13, left: 50, child: Text('Bio')),
      ],
    );
  }
}
