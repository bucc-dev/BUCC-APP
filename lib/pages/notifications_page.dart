import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_text_widget.dart';
import 'package:bucc_app/view/events.dart';
import 'package:bucc_app/view/latest_activity.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Divider(
              color: lightGrey.withOpacity(0.2),
              height: 1.0,
            ),

            //!NO NOTIFICATIONS
            Center(
              child: SizedBox(
                height: _screenSize.height * 0.5,
                child: Column(
                  children: <Widget>[
                    const Icon(
                      Icons.notifications_off,
                      color: lightGrey,
                      size: 62,
                    ),

                    //!SPACER
                    const SizedBox(height: 10.0),

                    //!LEADING TEXT
                    CustomTextWidget(
                      textType: "",
                      text: "No New Notifications",
                      customTextStyle: Theme.of(context)
                          .textTheme
                          .headline1!
                          .copyWith(
                              color: lightGrey.withOpacity(0.7),
                              fontSize: 20.0,
                              fontWeight: FontWeight.w500),
                    ),

                    //!SPACER
                    const SizedBox(height: 20.0),

                    //!BASE TEXT
                    SizedBox(
                      width: _screenSize.width * 0.7,
                      child: CustomTextWidget(
                        textType: "",
                        text:
                            "Go select a course rep in order to receive notifications",
                        customTextStyle:
                            Theme.of(context).textTheme.headline1!.copyWith(
                                  color: lightGrey.withOpacity(0.7),
                                  fontSize: 14.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
