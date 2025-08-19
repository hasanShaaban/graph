
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/utils/appAssets.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/profile/presentation/manager/profile/profile_cubit.dart';
import 'package:graph/features/profile/presentation/views/profile_view.dart';


class ProfileButton extends StatelessWidget {
  const ProfileButton({super.key});
  
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
            onTap: () async{
              context.read<ProfileCubit>().getProfileData();
              Navigator.pushNamed(context, ProfileView.name);
            },
            child: CircleAvatar(
              radius: 15,
              backgroundColor: Constants2.lightPrimaryColor(context),
              backgroundImage: AssetImage(Assets.imagesProfileImage
                ,
              ),
            ),
          );
  }
}
