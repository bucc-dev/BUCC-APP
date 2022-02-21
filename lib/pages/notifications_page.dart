import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({Key? key}) : super(key: key);

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  bool isNotificationPresent = false;
  //! LIST OF ITEMS IN THE DROP DOWN MENU.

  final List<String> _theBUCCDropdownItems = [
    'Archived Notifications',
    'Recent Notifications',
    'Hidden Notifications',
  ];

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.11),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  //!USER IMAGE
                  Expanded(
                    flex: 1,
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          "/student_profile",
                        );
                      },
                      child: const CircleAvatar(
                        radius: 30.0,
                        backgroundImage:
                            AssetImage("assets/Images/avatar 3.png"),
                      ),
                    ),
                  ),

                  //!WHITE SPACE
                  SizedBox(
                    width: _screenSize.width * 0.15,
                  ),

                  //!TITLE
                  Expanded(
                    flex: 4,
                    child: Row(
                      children: <Widget>[
                        //!CUSTOM TEXT WIDGET
                        const CustomTextWidget(
                          textType: "title",
                          text: "Notifications",
                        ),

                        //!WHITE SPACE
                        SizedBox(
                          width: _screenSize.width * 0.05,
                        ),

                        //!MENU DROP DOWN
                        PopupMenuButton(
                            icon: const Icon(
                              Icons.arrow_drop_down_outlined,
                              size: 32,
                              color: Colors.black,
                            ),
                            offset: Offset(_screenSize.width * 0.05,
                                _screenSize.height * 0.1),
                            itemBuilder: (context) => [
                                  PopupMenuItem(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SizedBox(
                                        width: _screenSize.width * 0.8,
                                        height: _screenSize.height * 0.25,
                                        child: ListView.separated(
                                          itemCount:
                                              _theBUCCDropdownItems.length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return ListTile(
                                              title: Center(
                                                child: CustomTextWidget(
                                                  textType: "",
                                                  text: _theBUCCDropdownItems[
                                                      index],
                                                  customTextStyle:
                                                      Theme.of(context)
                                                          .textTheme
                                                          .headline1!
                                                          .copyWith(
                                                              fontSize: 10.0),
                                                ),
                                              ),
                                            );
                                          },
                                          separatorBuilder:
                                              (BuildContext context,
                                                  int index) {
                                            return Divider(
                                              thickness: 1.0,
                                              color: lightGrey.withOpacity(0.5),
                                            );
                                          },
                                        ),
                                      ))
                                ]),
                      ],
                    ),
                  ),

                  //!EDIT BUTTON
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {
                        //!TODO: WHAT SHOULD HAPPEN ON DROP DOWN
                        setState(() {
                          isNotificationPresent = !isNotificationPresent;
                        });
                      },
                      icon: const Icon(Icons.edit_outlined),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: SafeArea(
          child: isNotificationPresent == false
              ? noNotifications(context: context, screenSize: _screenSize)
              : notificationsPresent(
                  context: context, screenSize: _screenSize)),
    );
  }

  Widget showNotificationDropdown(
      {required BuildContext context, required Size screenSize}) {
    return Align(
        alignment: Alignment.topCenter,
        child: Container(
          width: screenSize.width * 0.8,
          height: screenSize.height * 0.3,
          color: Colors.yellow,
        ));
  }

//!NOTIFICATION SCREENS

  Widget noNotifications(
      {required BuildContext context, required Size screenSize}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Divider(
          color: lightGrey.withOpacity(0.2),
          height: 1.0,
        ),

        //!NO NOTIFICATIONS
        Center(
          child: SizedBox(
            height: screenSize.height * 0.5,
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
                  width: screenSize.width * 0.7,
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
    );
  }

  Widget notificationsPresent(
      {required BuildContext context, required Size screenSize}) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Divider(
            color: lightGrey.withOpacity(0.2),
            height: 1.0,
          ),

          //!NEW NOTIFICATION TITLE
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              textType: "title",
              text: "New",
              customTextStyle: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          //!NEW NOTIFICATION
          Container(
            height: screenSize.height * 0.12,
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/student_profile",
                  );
                },
                child: const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/Images/avatar 2.png"),
                ),
              ),
              //!LIST TILE TITLE
              title: Row(
                children: <Widget>[
                  //!PERSON
                  CustomTextWidget(
                    text: "Irene Emeshili",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                            ),
                  ),

                  //!SPACER
                  const SizedBox(
                    width: 10.0,
                  ),

                  //!ACTION
                  CustomTextWidget(
                    text: "just made a post",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                            ),
                  ),
                ],
              ),

              //!LIST TILE SUBTITLE
              subtitle: CustomTextWidget(
                text: "7s",
                textType: "",
                customTextStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),

          //!TODAY NOTIFICATION TITLE
          Divider(
            color: lightGrey.withOpacity(0.2),
            height: 1.0,
          ),

          //!NEW NOTIFICATION TITLE
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              textType: "title",
              text: "Today",
              customTextStyle: Theme.of(context).textTheme.bodyText1,
            ),
          ),

          //!TODAY NOTIFICATION
          Container(
            height: screenSize.height * 0.12,
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/student_profile",
                  );
                },
                child: const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/Images/avatar 1.png"),
                ),
              ),
              //!LIST TILE TITLE
              title: Row(
                children: <Widget>[
                  //!PERSON
                  CustomTextWidget(
                    text: "Fortune Odega",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                            ),
                  ),

                  //!SPACER
                  const SizedBox(
                    width: 10.0,
                  ),

                  //!ACTION
                  CustomTextWidget(
                    text: "just made a post",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                            ),
                  ),
                ],
              ),

              //!LIST TILE SUBTITLE
              subtitle: CustomTextWidget(
                text: "2h",
                textType: "",
                customTextStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),

          //!TODAY NOTIFICATION
          Container(
            height: screenSize.height * 0.12,
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/student_profile",
                  );
                },
                child: const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/Images/avatar 2.png"),
                ),
              ),
              //!LIST TILE TITLE
              title: Row(
                children: <Widget>[
                  //!PERSON
                  CustomTextWidget(
                    text: "Irene Emeshili",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                            ),
                  ),

                  //!SPACER
                  const SizedBox(
                    width: 10.0,
                  ),

                  //!ACTION
                  CustomTextWidget(
                    text: "just made a post",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                            ),
                  ),
                ],
              ),

              //!LIST TILE SUBTITLE
              subtitle: CustomTextWidget(
                text: "2h",
                textType: "",
                customTextStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),

          //!TODAY NOTIFICATION
          Container(
            height: screenSize.height * 0.12,
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: InkWell(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    "/student_profile",
                  );
                },
                child: const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/Images/avatar 2.png"),
                ),
              ),
              //!LIST TILE TITLE
              title: Row(
                children: <Widget>[
                  //!PERSON
                  CustomTextWidget(
                    text: "Irene Emeshili",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w600,
                              fontSize: 10.0,
                            ),
                  ),

                  //!SPACER
                  const SizedBox(
                    width: 10.0,
                  ),

                  //!ACTION
                  CustomTextWidget(
                    text: "just made a post",
                    textType: "",
                    customTextStyle:
                        Theme.of(context).textTheme.bodyText2!.copyWith(
                              fontWeight: FontWeight.w500,
                              fontSize: 10.0,
                            ),
                  ),
                ],
              ),

              //!LIST TILE SUBTITLE
              subtitle: CustomTextWidget(
                text: "3h",
                textType: "",
                customTextStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
