import 'package:bucc_app/pages/notifications_page.dart';
import 'package:bucc_app/view/home_feed.dart';
import 'package:flutter/material.dart';

class HomeScreenWrapper extends StatelessWidget {
  final int pageIndex;
  const HomeScreenWrapper({Key? key, required this.pageIndex})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return pageIndex == 0
        ? const HomeFeed()
        : pageIndex == 1
            ? const NotificationsPage()
            : const HomeFeed();
  }
}
