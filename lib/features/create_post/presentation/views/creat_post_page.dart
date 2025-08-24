import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/create_post/data/models/new_post_model.dart';
import 'package:graph/features/create_post/data/models/subject_model.dart';
import 'package:graph/features/create_post/presentation/get_all_project_cubit/get_all_project_cubit.dart';
import 'package:graph/features/create_post/presentation/manager/post_new_post_cubit/post_new_post_cubit.dart';
import 'package:graph/features/create_post/presentation/views/widgets/full_images_page.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/utils/appAssets.dart';
import '../../../../core/utils/app_text_style.dart';
import '../../../../core/widgets/custom_drop_down_map.dart';
import '../../../../core/widgets/custom_stateless_appbar.dart';
import '../../../../core/widgets/profile_image.dart';
import 'widgets/creat_post_bottom_buttons.dart';
import 'widgets/post_button.dart';
import 'widgets/project_post_body_sec.dart';
import 'widgets/public_post_body_sec.dart';
import '../../../../generated/l10n.dart';
import '../../../profile/data/models/person_model.dart';

class CreatPostPage extends StatefulWidget {
  const CreatPostPage({super.key});
  static const name = 'createPost';

  @override
  State<CreatPostPage> createState() => _CreatPostPageState();
}

class _CreatPostPageState extends State<CreatPostPage> {
  final list = [
    {'label': 'project', 'icon': Assets.iconsPollH},
    {'label': 'normal', 'icon': Assets.iconsEmployeeMan},
  ];
  final subjectList = [
    {'label': 'Automat', 'icon': Assets.iconsEarthAfrica},
    {'label': 'project1', 'icon': Assets.iconsUsers},
    {'label': 'three js', 'icon': Assets.iconsPollH},
    {'label': 'algebra', 'icon': Assets.iconsCoworking},
    {'label': 'algorithms', 'icon': Assets.iconsEmployeeMan},
  ];
  List<String> selectedTags = [];
  List<SubjectModel> subjects = [];
  int? selectedSubjectId;
  String selectedSubjectName = 'Subject';

  final privacy = [
    {'label': 'public', 'icon': Assets.iconsEarthAfrica},
    {'label': 'followers', 'icon': Assets.iconsUsers},
  ];
  String selectedVal = 'normal';
  String selectedSubject = 'project 1';
  String selectedPrivacy = 'public';

  final Set<Person> selectedMentions = {};

  void addMention(Person p) {
    setState(() => selectedMentions.add(p));
  }

  void removeMention(Person p) {
    setState(() => selectedMentions.removeWhere((e) => e.id == p.id));
  }

  final bool _isPickingImages = false;

  Future<void> pickImages() async {
    final ImagePicker picker = ImagePicker();
    final List<XFile> images = await picker.pickMultiImage(imageQuality: 70);

    if (images != null && images.isNotEmpty) {
      setState(() {
        selectedImages = images.map((xfile) => File(xfile.path)).toList();
      });
    }
  }

  String? description;
  String? title;
  List<File> selectedImages = [];

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<GetAllProjectCubit>().getAllProjects();
    });
  }

  @override
  Widget build(BuildContext context) {
    var lang = S.of(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        body: Column(
          children: [
            CustomStatelessAppbar(lang: lang, title: lang.createPost),
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      BlocConsumer<PostNewPostCubit, PostNewPostState>(
                        listener: (context, state) {
                          if (state is PostNewPostSuccess) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.response['message']),
                              ),
                            );

                            //Navigator.pushNamed(context, ProfileView.name);
                          } else if (state is PostNewPostFailuer) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(state.errorMessage),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        builder: (context, state) {
                          return PostButton(
                            onTap: () {
                              final isProject = selectedVal == 'project';

                              if (isProject) {
                                if (selectedSubjectId == null ||
                                    (title == null ||
                                        title!.trim().isEmpty ||
                                        description == null ||
                                        description!.trim().isEmpty)) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'you must choose project name ,title and description',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                              } else {
                                if (description == null ||
                                    description!.trim().isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                        'you should put description',
                                      ),
                                    ),
                                  );
                                  return;
                                }
                              }

                              print('title = $title');
                              print('description = $description');
                              print('selectedSubjectId = $selectedSubjectId');
                              print('selectedSubject = $selectedSubject');
                              print('selected images = $selectedImages');
                              final newPost = NewPostModel(
                                title: isProject ? title?.trim() : null,
                                description: description!.trim(),
                                projectId: isProject ? selectedSubjectId : null,
                                privacy: selectedPrivacy,
                                mentionIds:
                                    selectedMentions
                                        .map((p) {
                                          final id = int.tryParse(p.id);
                                          if (id == null) {
                                            debugPrint(
                                              "⚠️ Cannot parse Person id: ${p.id}",
                                            );
                                          }
                                          return id;
                                        })
                                        .whereType<int>()
                                        .toList(),
                                image: selectedImages,
                              );

                              print('title = $title');
                              print('description = $description');
                              print('selectedSubjectId = $selectedSubjectId');
                              print('selectedSubject = $selectedSubject');
                              print('selected images = $selectedImages');
                              final cubit = context.read<PostNewPostCubit>();
                              cubit.postNewPost(newPostModel: newPost);
                            },
                          );
                        },
                      ),
                      Row(
                        children: [
                          ProfileImage(
                            width: width,
                            height: height,
                            imageWidth: 55,
                            imageHeight: 55,
                            borderThick: 1,
                          ),
                          SizedBox(width: 17),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Ahmad Ali',
                                style: AppTextStyle.cairoSemiBold18,
                              ),

                              Row(
                                children: [
                                  CustomDropDownMap(
                                    list: list,
                                    text: selectedVal,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedVal = value;
                                      });
                                    },
                                    width: width * 80 / 412,
                                    height: 27,
                                    border: 7,
                                  ),
                                  SizedBox(width: 7),
                                  selectedVal == 'project'
                                      ? BlocConsumer<
                                        GetAllProjectCubit,
                                        GetAllProjectState
                                      >(
                                        listener: (context, state) {
                                          if (state is GetAllProjectFailuer) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Error: ${state.errorMessage}",
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is GetAllProjectLoading) {
                                            return const Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else if (state
                                              is GetAllProjectSuccess) {
                                            final data =
                                                (state.response['data']
                                                    as List?) ??
                                                [];
                                            final projectOptions =
                                                data.map<Map<String, dynamic>>((
                                                  e,
                                                ) {
                                                  return {
                                                    'label':
                                                        (e['name'] ?? '')
                                                            .toString(),
                                                    'id': e['id'] as int,
                                                  };
                                                }).toList();
                                            if (projectOptions.isNotEmpty &&
                                                (selectedSubjectId == null ||
                                                    !projectOptions.any(
                                                      (p) =>
                                                          p['label'] ==
                                                          selectedSubject,
                                                    ))) {
                                              selectedSubject =
                                                  projectOptions[0]['label'];
                                              selectedSubjectId =
                                                  projectOptions[0]['id']
                                                      as int;
                                            }

                                            return CustomDropDownMap(
                                              list: projectOptions,

                                              text: selectedSubject,
                                              onChanged: (value) {
                                                final id =
                                                    projectOptions.firstWhere(
                                                          (m) =>
                                                              m['label'] ==
                                                              value,
                                                        )['id']
                                                        as int;
                                                setState(() {
                                                  selectedSubject = value;
                                                  selectedSubjectId = id;
                                                });
                                                print(
                                                  'selectedSubjectId = $selectedSubjectId',
                                                );
                                              },
                                              width: width * 87 / 412,
                                              height: 27,
                                              border: 7,
                                            );
                                          } else {
                                            return const SizedBox.shrink();
                                          }
                                        },
                                      )
                                      : SizedBox(),
                                  SizedBox(width: 10),
                                  CustomDropDownMap(
                                    list: privacy,
                                    text: selectedPrivacy,
                                    onChanged: (value) {
                                      setState(() {
                                        selectedPrivacy = value;
                                      });
                                    },
                                    width: width * 87 / 412,
                                    height: 27,
                                    border: 7,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Spacer(),

                          SizedBox(width: 10),
                        ],
                      ),
                      SizedBox(height: 20),

                      if (selectedImages.isNotEmpty) ...[
                        // زر حذف كل الصور
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.red,
                                minimumSize: Size(50, 30),
                              ),
                              onPressed: () {
                                setState(() {
                                  selectedImages.clear(); // يحذف كل الصور
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                size: 20,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),

                        GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          itemCount:
                              selectedImages.length > 4
                                  ? 4
                                  : selectedImages.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 4,
                                crossAxisSpacing: 4,
                              ),
                          itemBuilder: (context, index) {
                            final image = selectedImages[index];
                            if (index == 3 && selectedImages.length > 4) {
                              return GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (_) => FullImagesPage(
                                            images: selectedImages,
                                            initialIndex: 3,
                                          ),
                                    ),
                                  );
                                },
                                child: Stack(
                                  children: [
                                    Image.file(image, fit: BoxFit.cover),
                                    Container(
                                      color: Colors.black38,
                                      child: Center(
                                        child: Text(
                                          '+${selectedImages.length - 3}',
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 24,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            } else {
                              return Image.file(image, fit: BoxFit.cover);
                            }
                          },
                        ),
                        const SizedBox(height: 10),
                      ],

                      if (selectedTags.isNotEmpty) ...[
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Text(
                                lang.tags,
                                style: AppTextStyle.cairoRegular14.copyWith(
                                  color: Constants2.darkPrimaryColor(context),
                                ),
                              ),
                              Wrap(
                                spacing: 8,
                                children:
                                    selectedTags.map((tag) {
                                      return Text(
                                        '#$tag',
                                        style: AppTextStyle.cairoSemiBold14
                                            .copyWith(
                                              color: Constants.secondryColor,
                                            ),
                                      );
                                    }).toList(),
                              ),
                            ],
                          ),
                        ),
                      ],

                      selectedVal == 'project'
                          ? ProjectPostBodySec(
                            onChangedTitle: (value) {
                              title = value;
                            },
                            onChangedDescription: (val) {
                              description = val;
                            },
                          )
                          : PublicPostBodySec(
                            onChanged: (value) {
                              description = value;
                            },
                          ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),

        bottomSheet:
        //  _isKeyboardVisible(context)
        //  ?
        Padding(
          padding: const EdgeInsets.all(20),
          child: CreatPostBottomButtons(
            selectedVal: selectedVal,
            selectedPersons: selectedMentions,
            onAddPerson: addMention,
            onRemovePerson: removeMention,
            onPickImages: pickImages,
            selectedTags: selectedTags,
            onTagsChanged: (List<String> tags) {
              setState(() {
                selectedTags = tags;
              });
            },
          ),
        ),
        //  : null,
      ),
    );
  }

  bool _isKeyboardVisible(BuildContext context) {
    return MediaQuery.of(context).viewInsets.bottom > 0;
  }
}
