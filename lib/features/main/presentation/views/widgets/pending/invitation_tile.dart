import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/main/domain/entity/pending_invitation_entity.dart';

class InvitationTile extends StatelessWidget {
  const InvitationTile({
    super.key,
    required this.invitation,
  });

  final PendingInvitationEntity invitation;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Constants2.lightSecondaryColor(
        context,
      ),
      title: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                invitation.senderUser,
                style: AppTextStyle.cairoSemiBold16
                    .copyWith(
                      color:
                          Constants2.primaryColor(
                            context,
                          ),
                    ),
              ),
              Text(
                ' invite you to his group',
                style: AppTextStyle.cairoSemiBold16
                    .copyWith(
                      color:
                          Constants2.darkPrimaryColor(
                            context,
                          ),
                    ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'project: ${invitation.projectName}',
                style: AppTextStyle.cairoRegular14
                    .copyWith(
                      color:
                          Constants2.darkSecondaryColor(
                            context,
                          ),
                    ),
              ),
              SizedBox(width: 20),
              Text(
                'role: ${invitation.skill.skillName}',
                style: AppTextStyle.cairoRegular14
                    .copyWith(
                      color:
                          Constants2.darkSecondaryColor(
                            context,
                          ),
                    ),
              ),
            ],
          ),
        ],
      ),
      subtitle: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            onPressed: () {},
            child: Text('accept'),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  Constants2.darkSecondaryColor(
                    context,
                  ),
            ),
            onPressed: () {},
            child: Text('reject'),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }
}
