import 'package:bucc_app/screens/home/latest_activity/widget/no_posts.dart';
import 'package:bucc_app/screens/home/latest_activity/widget/post.dart';
import 'package:flutter/material.dart';

class LatestActivityScreen extends StatelessWidget {
  const LatestActivityScreen({Key? key}) : super(key: key);
  static const bool isEmpty = false;

  //! SCROLL CONTROLLER
  static final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) => isEmpty
      ? const NoPosts()
      : SingleChildScrollView(
          controller: _scrollController,
          physics: const BouncingScrollPhysics(),
          child: Column(
              children: List.generate(3, (index) => PostWidget(index: index))));
}
