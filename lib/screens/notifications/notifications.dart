import 'package:bucc_app/screens/notifications/widget/all_notification.dart';
import 'package:bucc_app/screens/notifications/widget/class_notifications.dart';
import 'package:bucc_app/screens/notifications/widget/executive_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});
  static final PageController notificationPageController = PageController();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen> {
  @override
  Widget build(BuildContext context) => SafeArea(
          child: PageView(
              controller: NotificationsScreen.notificationPageController,
              pageSnapping: false,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.vertical,
              children: const [
            //! FIRST SCREEN
            AllNotifications(),

            //! EXECUTIVE NOTIFICATIONS
            ExecutiveNotifications(),

            //! CLASS NOTIFICATIONS
            ClassNotifications()
          ]));
}
