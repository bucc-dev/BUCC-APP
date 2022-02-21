import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_app_bar.dart';
import 'package:bucc_app/view/custom_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class StudentProfile extends StatefulWidget {
  const StudentProfile({Key? key}) : super(key: key);

  @override
  State<StudentProfile> createState() => _StudentProfileState();
}

class _StudentProfileState extends State<StudentProfile> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  //!MODAL BOTTOM SHEET
  showBottomSheet(BuildContext context, Size screenSize) =>
      showModalBottomSheet(
          context: context,
          elevation: 10.0,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
            Radius.circular(30.0),
          )),
          builder: (context) => Container(
                height: screenSize.height * 0.6,
                padding: const EdgeInsets.all(21.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      width: screenSize.width * 0.15,
                      height: screenSize.height * 0.01,
                      decoration: const BoxDecoration(
                        color: Color(0xFFCACACA),
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                    )
                  ],
                ),
              ));

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(_screenSize.height * 0.08),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 12.0),
          child: SizedBox(
            child: TitleBarWidget(
              pageTitle: "student_profile",
            ),
          ),
        ),
      ),

      //!HOME
      body: Column(
        children: <Widget>[
          //!HEADER

          SizedBox(
            height: _screenSize.height * 0.2,
            child: Stack(
              children: <Widget>[
                //!BACKGROUND IMAGE
                Container(
                  height: _screenSize.height * 0.15,
                  color: studentProfileHeaderColour,
                ),

                //!IMAGE
                Positioned(
                  top: _screenSize.height * 0.08,
                  left: _screenSize.width * 0.05,
                  child: const CircleAvatar(
                    radius: 50.0,
                    backgroundImage: AssetImage("assets/Images/avatar 3.png"),
                  ),
                ),

                //!ICON
                Positioned(
                  top: _screenSize.height * 0.12,
                  right: _screenSize.width * 0.05,
                  child: OutlinedButton(
                    onPressed: () => showBottomSheet(context, _screenSize),
                    child: const Icon(
                      Icons.edit_outlined,
                      color: lightGrey,
                    ),
                    style: OutlinedButton.styleFrom(
                      shape: const CircleBorder(),
                      elevation: 10.0,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                ),
              ],
            ),
          ),

          //!USER DETAILS
          SizedBox(
            height: _screenSize.height * 0.2,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  //!STUDENT NAME
                  CustomTextWidget(textType: "title", text: "Oluchi Egboh"),

                  //!STUDENT UNIVERSITY
                  CustomTextWidget(
                    textType: "none",
                    text: "Student at Babcock University",
                    customTextStyle: Theme.of(context)
                        .textTheme
                        .bodyText1!
                        .copyWith(color: Colors.black),
                  ),

                  SizedBox(
                    height: _screenSize.height * 0.01,
                  ),

                  //!STUDENT DEPARTMENT
                  CustomTextWidget(
                    textType: "none",
                    text: "Software Engineering . 400 Level",
                    customTextStyle: Theme.of(context)
                        .textTheme
                        .bodyText2!
                        .copyWith(color: Colors.black, fontSize: 14),
                  ),

                  //!LOCATION
                  CustomTextWidget(
                      textType: "none",
                      text: "Ileshan Remo, Ogun State",
                      customTextStyle: Theme.of(context)
                          .textTheme
                          .bodyText1!
                          .copyWith(fontSize: 13)),
                ],
              ),
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          selectedItemColor: const Color(0xFF1D2F5F),
          unselectedItemColor: lightGrey,
          showSelectedLabels: true,
          showUnselectedLabels: true,
          onTap: _onItemTapped,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.notifications_outlined),
              label: 'Notification',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.explore_outlined),
              label: 'Explore',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.book_outlined),
              label: 'Planner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.backpack_outlined),
              label: 'Backpack',
            ),
          ]),
    );
  }
}
