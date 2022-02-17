///!THIS IS THE CUSTOM APP BAR
///!HOUSES THE LINK TO THE PAGE - StudentProfile()
///!A SEARCH DELEGATE HAS BEEN IMPLEMENTED, TO AID THE SEARCH BAR INSIDE THE TITLE BAR WIDGET
///!THE APP BAR RETURNS VARYING FORMS DEPENDING ON THE TITLE OF THE PAGE PASSED.

import 'package:bucc_app/view/custom_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class TitleBarWidget extends StatefulWidget {
  final String pageTitle;

  const TitleBarWidget({
    Key? key,
    required this.pageTitle,
  }) : super(key: key);

  @override
  _TitleBarWidgetState createState() => _TitleBarWidgetState();
}

class _TitleBarWidgetState extends State<TitleBarWidget> {
  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return widget.pageTitle == "home"
        //!THIS IS APP BAR FOR HOME PAGE
        ? SafeArea(
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
                    width: MediaQuery.of(context).size.width / 20,
                  ),

                  //!SEARCH BAR
                  Expanded(
                    flex: 4,
                    child: TextField(
                      onTap: () {
                        showSearch(
                          context: context,
                          delegate: Search(),
                        );
                      },
                      decoration: InputDecoration(
                        filled: true,
                        contentPadding: const EdgeInsets.all(8.0),
                        prefixIcon: const Icon(
                          Icons.search_outlined,
                          size: 25.0,
                          color: Color(0xFFBDBDBD),
                        ),
                        hintText: "Search Companion",
                        hintStyle: const TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFBDBDBD)),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9.0),
                          borderSide:
                              const BorderSide(color: Color(0xFFBDBDBD)),
                        ),
                      ),
                    ),
                  ),

                  //!ADD ICON
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.add,
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        : widget.pageTitle == "student_profile"
            //!FOR STUDENT PROFILE PAGE
            ? SafeArea(
                child: SizedBox(
                  height: _screenSize.height * 0.10,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //!ARROW BACK
                      IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.arrow_back)),

                      //!TITLE
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            SizedBox(
                              width: _screenSize.width * 0.1,
                            ),
                            //!CUSTOM TEXT WIDGET
                            const CustomTextWidget(
                              textType: "title",
                              text: "Student profile",
                            ),

                            //!DROP DOWN ICON
                            IconButton(
                              onPressed: () {
                                //!TODO: WHAT SHOULD HAPPEN ON DROP DOWN
                              },
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                            ),
                          ],
                        ),
                      ),

                      //!COG / SETTINGS BUTTON
                      IconButton(
                        onPressed: () {
                          //!TODO: WHAT SHOULD HAPPEN ON DROP DOWN
                        },
                        icon: const Icon(Icons.settings),
                      ),
                    ],
                  ),
                ),
              )
            :
            //!FOR NOTIFICATIONS PAGE
            SafeArea(
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

                            //!DROP DOWN ICON
                            IconButton(
                              onPressed: () {
                                //!TODO: WHAT SHOULD HAPPEN ON DROP DOWN
                              },
                              icon: const Icon(Icons.arrow_drop_down_outlined),
                            ),
                          ],
                        ),
                      ),

                      //!COG / SETTINGS BUTTON
                      Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            //!TODO: WHAT SHOULD HAPPEN ON DROP DOWN
                          },
                          icon: const Icon(Icons.edit_outlined),
                        ),
                      ),
                    ],
                  ),
                ),
              );
  }
}

class Search extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      IconButton(
        icon: Icon(
          Icons.cancel_outlined,
          color: Colors.blue.shade900,
        ),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(
        Icons.arrow_back_outlined,
        color: Colors.blue.shade900,
      ),
      onPressed: () {
        Navigator.of(context).pop();
        FocusScope.of(context).unfocus();
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(top: 10.0, left: 30.0, right: 30.0, bottom: 5.0),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView.builder(
        itemCount: 1,
        itemBuilder: (BuildContext context, int position) {
          return Card(
            child: ListTile(
              contentPadding: const EdgeInsets.all(15.0),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const <Widget>[
                  //!TITLE
                  Text(
                    "Sample Searched Text",
                  ),
                  SizedBox(
                    width: 30.0,
                  ),
                  Text("Sample Searched Description"),
                ],
              ),
              onTap: () {
                //!TODO: WHAT SHOULD HAPPEN ON CLICK OF SEARCH DELEGATE CONTENT
              },
            ),
          );
        });
  }
}
