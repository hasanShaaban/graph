
import 'package:flutter/material.dart';
import 'package:graph/core/utils/constants.dart';
import 'package:graph/features/main/presentation/views/widgets/pending/pending_invitations_page.dart';
import 'package:graph/generated/l10n.dart';

class PendingPageBody extends StatelessWidget {
  const PendingPageBody({super.key, required this.lang});
  final S lang;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, // number of tabs
      child: Padding(
        padding: const EdgeInsets.only(top: 20, right: 20, left: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // TabBar
            TabBar(
              labelColor: Constants2.primaryColor(context),
              unselectedLabelColor: Colors.grey,
              indicatorColor: Constants2.primaryColor(context),
              tabs: const [
                Tab(text: "Groups Applications"),
                Tab(text: "Groups Invitations"),
                Tab(text: "Job Applications"),
              ],
            ),

            // TabBarView (content for each tab)
            Expanded(
              child: TabBarView(
                children: [
                  // Replace with your actual widgets for each tab
                  Center(child: Text("Groups Applications content")),
                  PendingInvitationsPage(),
                  Center(child: Text("Job Applications content")),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



