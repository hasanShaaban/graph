import 'package:flutter/material.dart';

import 'package:graph/core/utils/app_text_style.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/core/widgets/expandable_text.dart';
import 'package:graph/core/widgets/posts/presentation/job_post/job_post_header.dart';
import 'package:graph/generated/l10n.dart';

class JobPost extends StatelessWidget {
  const JobPost({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var lang = S.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        JobPostHeader(width: width, height: height, lang: lang),
        SizedBox(height: 10),
        ExpandableText('we’re looking for experienced Laravel developers to join our growing and innovative team.🔧 Responsibilities:Develop and maintain high-quality web applications using Laravel.Write clean, efficient, and well-documented code.Collaborate with designers and other developers to deliver top-notch products.Optimize application performance and security.🧠 Requirements:Minimum 2 years of hands-on experience with Laravel framework.Solid knowledge of PHP, MySQL, and RESTful APIs.Familiarity with version control tools like Git.Strong teamwork and problem-solving skills.Bonus: Experience with Vue.js or React is a plus.🎯 What We Offer:A professional and supportive work environment.Competitive salary based on experience.Flexible working hours and remote work options.Continuous learning and professional growth opportunities.📩 Think you’re a good fit? Send us your CV at:📧 jobs@futurecodes.comOr contact us via WhatsApp: +966-xxx-xxx-xxxJoin us and be part of building meaningful software solutions! 💻🚀'),
        Text('#flutter #programming', style: AppTextStyle.cairoRegular16.copyWith(color: Constants2.secondaryColor(context)),),
        SizedBox(height: 10),
        Divider(color: Constants2.dividerColor(context), height: 1, thickness: 1,),
             SizedBox(height: 20),

      ],
    );
  }
}