import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../utils/app_text_style.dart';
import '../utils/constants.dart';
import '../widgets/tech_tool_container.dart';

Future<List<String>> showToolsBottomSheet({
  required BuildContext context,
  required List<String> initialChosenTools,
  required S lang,
  required List<String> tools,
}) async {
  List<String> tempChosenTools = List.from(initialChosenTools);

  return await showModalBottomSheet<List<String>>(
        isScrollControlled: true,
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.3,
            maxChildSize: 0.9,
            expand: false,
            builder: (context, scrollController) {
              return StatefulBuilder(
                builder: (context, setModalState) {
                  return Container(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    decoration: BoxDecoration(
                      color: Constants2.lightPrimaryColor(context),
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(20),
                      ),
                    ),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        Container(
                          height: 24,
                          alignment: Alignment.center,
                          child: Container(
                            width: 40,
                            height: 4,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                              borderRadius: BorderRadius.circular(2),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Text(
                            lang.techTools,
                            style: AppTextStyle.cairoSemiBold20.copyWith(
                              color: Constants2.darkSecondaryColor(context),
                            ),
                          ),
                        ),
                        const SizedBox(height: 16),
                        Expanded(
                          child: GridView.builder(
                            controller: scrollController,
                            physics: BouncingScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  mainAxisSpacing: 30,
                                  childAspectRatio: 1,
                                  crossAxisSpacing: 30,
                                ),
                            itemCount: tools.length,
                            itemBuilder: (context, index) {
                              final tool = tools[index];
                              final isSelected = tempChosenTools.contains(tool);

                              return GestureDetector(
                                onTap: () {
                                  setModalState(() {
                                    if (isSelected) {
                                      tempChosenTools.remove(tool);
                                    } else {
                                      tempChosenTools.add(tool);
                                    }
                                  });
                                },
                                child: TechToolContainer(
                                  width: 60,
                                  height: 60,
                                  color:
                                      isSelected
                                          ? Constants
                                              .deviderColor // define this
                                          : Constants2.lightSecondaryColor(
                                            context,
                                          ),
                                  icon: tool,
                                ),
                              );
                            },
                          ),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context, tempChosenTools);
                          },
                          child: Text(lang.Save),
                        ),
                        SizedBox(height: 16),
                      ],
                    ),
                  );
                },
              );
            },
          );
        },
      ) ??
      initialChosenTools; // In case the user dismisses the sheet
}
