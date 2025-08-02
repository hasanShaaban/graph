import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:graph/core/utils/app_text_style.dart';

class ReactsPage extends StatelessWidget {
  const ReactsPage({
    super.key,
    required this.reactsId,
  });

  final Map reactsId;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: BouncingScrollPhysics(),
      padding: EdgeInsets.zero,
      itemCount: reacts['reacts'].length,
      itemBuilder:
          (context, index) => ListTile(
            horizontalTitleGap: 5,
            leading: CircleAvatar(
              radius: 35 / 2,
              backgroundImage: AssetImage(
                reacts['reacts'][index]['image'],
              ),
            ),
            title: Text(
              reacts['reacts'][index]['userName'],
              style: AppTextStyle.cairoSemiBold16,
            ),
            trailing: SvgPicture.asset(
              reactsId[reacts['reacts'][index]['reactID']],
            ),
          ),
    );
  }
}




Map<String, dynamic> reacts = {
  'reacts': [
    {
      'id': 1,
      'userName': 'hasan',
      'image': 'assets/images/profile_image.jpg',
      'reactID': 1,
    },
    {
      'id': 1,
      'userName': 'ali',
      'image': 'assets/images/graph_logo.png',
      'reactID': 2,
    },
    {
      'id': 1,
      'userName': 'mohamad',
      'image': 'assets/images/profile_image.jpg',
      'reactID': 3,
    },
    {
      'id': 1,
      'userName': 'hasan',
      'image': 'assets/images/graph_logo.png',
      'reactID': 2,
    },
    {
      'id': 1,
      'userName': 'yazan',
      'image': 'assets/images/profile_image.jpg',
      'reactID': 1,
    },
    {
      'id': 1,
      'userName': 'jaafar',
      'image': 'assets/images/graph_logo.png',
      'reactID': 1,
    },
    {
      'id': 1,
      'userName': 'fuck',
      'image': 'assets/images/profile_image.jpg',
      'reactID': 3,
    },
    {
      'id': 1,
      'userName': 'you',
      'image': 'assets/images/graph_logo.png',
      'reactID': 3,
    },
    {
      'id': 1,
      'userName': 'hasan',
      'image': 'assets/images/profile_image.jpg',
      'reactID': 3,
    },
    {
      'id': 1,
      'userName': 'hasan',
      'image': 'assets/images/graph_logo.png',
      'reactID': 3,
    },
  ],
};
