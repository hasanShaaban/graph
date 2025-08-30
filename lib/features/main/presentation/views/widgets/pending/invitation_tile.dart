import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/services/api_service.dart';
import 'package:graph/core/services/get_it_service.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/auth/data/repos/auth_local_data_source.dart';
import 'package:graph/features/main/domain/entity/pending_invitation_entity.dart';
import 'package:graph/features/main/presentation/manager/pending_invitations_cubit/pending_invitations_cubit.dart';

class InvitationTile extends StatelessWidget {
  const InvitationTile({super.key, required this.invitation});

  final PendingInvitationEntity invitation;

  @override
  Widget build(BuildContext context) {
    SecureApiService apiService = getIt<SecureApiService>();
    return ListTile(
      tileColor: Constants2.lightSecondaryColor(context),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                invitation.senderUser,
                style: AppTextStyle.cairoSemiBold16.copyWith(
                  color: Constants2.primaryColor(context),
                ),
              ),
              Text(
                ' invite you to his group',
                style: AppTextStyle.cairoSemiBold16.copyWith(
                  color: Constants2.darkPrimaryColor(context),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Text(
                'project: ${invitation.projectName}',
                style: AppTextStyle.cairoRegular14.copyWith(
                  color: Constants2.darkSecondaryColor(context),
                ),
              ),
              SizedBox(width: 20),
              Text(
                'role: ${invitation.skill.skillName}',
                style: AppTextStyle.cairoRegular14.copyWith(
                  color: Constants2.darkSecondaryColor(context),
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
            onPressed: () {
              apiService.post(
                endPoint: 'invitations/${invitation.invitationId}',
                data: {
                  'response': 'accept',
                  'skill_id': 23,
                  'invitation_id': invitation.invitationId,
                },
                
              );
              context.read<PendingInvitationsCubit>().getPendingInvitations();
            },
            child: Text('accept'),
          ),
          SizedBox(width: 20),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Constants2.darkSecondaryColor(context),
            ),
            onPressed: () {
              apiService.post(
                endPoint: 'invitations/${invitation.invitationId}',
                data: {
                  'response': 'reject',
                  'skill_id': 23,
                  'invitation_id': invitation.invitationId,
                },
              );
            },
            child: Text('reject'),
          ),
        ],
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
    );
  }
}
