import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ViewPost extends ConsumerWidget {
  const ViewPost({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        body: SafeArea(
            child: SingleChildScrollView(
                padding: AppScreenUtils.appMainPadding,
                physics: const BouncingScrollPhysics(),
                child: Column())));
  }
}
