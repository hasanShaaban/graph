import 'package:flutter/widgets.dart';
import 'package:graph/core/widgets/custom_drop_down_button.dart';
import 'package:graph/core/widgets/posts/presentation/job_post.dart';

class JobPage extends StatelessWidget {
  const JobPage({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          Row(
            children: [
              CustomDropDownButton(height: height, text: 'type', list: types),
              SizedBox(width: 10),
              CustomDropDownButton(
                height: height,
                text: 'location',
                list: list,
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              physics: BouncingScrollPhysics(),
              itemBuilder: (context, index) => JobPost(),
              itemCount: 10,
            ),
          ),
        ],
      ),
    );
  }
}

List<String> types = ['full time', 'part time', 'freelance', 'internship'];

List<String> list = ['on site', 'remotly'];
