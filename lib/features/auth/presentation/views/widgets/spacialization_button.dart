import 'package:flutter/material.dart';
import '../../../../../core/services/providers/user_info_provider.dart';
import '../../../data/models/signup_data_model.dart';
import 'package:provider/provider.dart';
import '../../../../../generated/l10n.dart';
import '../../../../../core/utils/appAssets.dart';
import 'animated_container_widget.dart';

class SpacializationButton extends StatefulWidget {
  final FormFieldSetter<int> selectSpacialization;
  const SpacializationButton({super.key, required this.selectSpacialization});

  @override
  State<SpacializationButton> createState() => _SpacializationButtonState();
}

class _SpacializationButtonState extends State<SpacializationButton> {
  String? selected;
  int? selectedSpacializationId;

  @override
  void initState() {
    super.initState();
  }

  void _selectSpacialization(String spacialization, int id) {
    setState(() {
      selected = spacialization;
      selectedSpacializationId = id;
    });
     widget.selectSpacialization(id); 
  }

  @override
  Widget build(BuildContext context) {
   
      final lang = S.of(context);
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _selectSpacialization(lang.softwareEng, 1);
             },
          child: AnimatedContainerWidget(
            whatSelect: selected == lang.softwareEng,
            text: lang.softwareEng,
            icon: Assets.iconsCodeWindow,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _selectSpacialization(lang.ai, 2);
             },
          child: AnimatedContainerWidget(
            whatSelect: selected == lang.ai,
            text: lang.ai,
            icon: Assets.iconsMicrochipAi,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
        SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            _selectSpacialization(lang.networks, 3);
             },
          child: AnimatedContainerWidget(
            whatSelect: selected == lang.networks,
            text: lang.networks,
            icon: Assets.iconsDataModel,
            widthSelected: double.infinity,
            widthNotSelected: 300,
          ),
        ),
      ],
    );
  }
}
