import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/features/main/domain/entity/noraml_post_entity.dart';

class ShareWithWidget extends StatelessWidget {
  const ShareWithWidget({
    super.key,
    required this.user,
  });

  final List<UserEntity> user;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(context: context, builder: (context) {
          return SimpleDialog(
            
            titlePadding: EdgeInsets.all(10),
            contentPadding: EdgeInsets.all(10),
            title: Text('tag with'),
            children: List.generate(user.length, (index){
              return Padding(
                padding: const EdgeInsets.only(bottom: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundImage: CachedNetworkImageProvider(user[index].profileImageUrl),
                    ),
                    SizedBox(width: 5),
                    Text(user[index].name, style: AppTextStyle.cairoSemiBold14,)
                  ],
                ),
              );
            }),
          );
        },);
      },
      child: Text('and ${user.length - 1} others'),
    );
  }
}
