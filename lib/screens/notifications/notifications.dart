import 'package:bucc_app/screens/notifications/widget/all_notification.dart';
import 'package:bucc_app/screens/notifications/widget/class_notifications.dart';
import 'package:bucc_app/screens/notifications/widget/executive_notification.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  //! CURRENT PAGE IN VIEW
  static final ValueNotifier<int> currentPage = ValueNotifier(0);

  //! SCREENS
  static const List<Widget> _screens = [
    //! FIRST SCREEN
    AllNotifications(),

    //! EXECUTIVE NOTIFICATIONS
    ExecutiveNotifications(),

    //! CLASS NOTIFICATIONS
    ClassNotifications()
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) => SafeArea(
      child: ValueListenableBuilder(
          valueListenable: currentPage,
          builder: (context, value, child) =>
              _screens.elementAt(currentPage.value)));
}
