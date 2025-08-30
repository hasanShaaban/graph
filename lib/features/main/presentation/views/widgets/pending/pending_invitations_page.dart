import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/features/main/presentation/manager/pending_invitations_cubit/pending_invitations_cubit.dart';
import 'package:graph/features/main/presentation/views/widgets/pending/invitation_tile.dart';

class PendingInvitationsPage extends StatelessWidget {
  const PendingInvitationsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: BlocBuilder<
        PendingInvitationsCubit,
        PendingInvitationsState
      >(
        builder: (context, state) {
          if (state is PendingInvitationsSuccess) {
            if (state.response.isEmpty) {
              return Text('there is no invitations');
            } else {
              return ListView.builder(
                itemCount: state.response.length,
                itemBuilder: (context, index) {
                  var invitation = state.response[index];
                  return InvitationTile(invitation: invitation);
                },
              );
            }
          } else if (state is PendingInvitationsError) {
            return Text(state.errorMessage);
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}