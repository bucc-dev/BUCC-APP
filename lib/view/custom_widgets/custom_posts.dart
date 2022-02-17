import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomPost extends StatefulWidget {
  final bool isImagePresent;
  const CustomPost({Key? key, required this.isImagePresent}) : super(key: key);

  @override
  State<CustomPost> createState() => _CustomPostState();
}

class _CustomPostState extends State<CustomPost> {
  int _favouriteCount = 0;
  int _commentCount = 0;
  int _shareCount = 0;

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(7.0),
          topRight: Radius.circular(7.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //!HEADER
          Container(
            padding: const EdgeInsets.all(12.0),
            height: _screenSize.height * 0.1,
            child: Row(
              children: <Widget>[
                //!IMAGE
                const CircleAvatar(
                  radius: 30.0,
                  backgroundImage: AssetImage("assets/Images/avatar 1.png"),
                ),

                SizedBox(
                  width: _screenSize.width * 0.05,
                ),

                //!USER DETAILS
                Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      //!USER NAME
                      CustomTextWidget(
                        textType: "",
                        text: "Blessed Madukoma",
                        customTextStyle: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(
                                fontSize: 14.0,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                      ),

                      //!USER STATUS
                      CustomTextWidget(
                          textType: "",
                          text: "Babcock University Computer Club President",
                          customTextStyle: Theme.of(context)
                              .textTheme
                              .bodyText1!
                              .copyWith(
                                  fontSize: 11.0,
                                  fontWeight: FontWeight.w500,
                                  color: lightGrey)),
                    ]),
              ],
            ),
          ),

          //!TEXT CONTAINER
          SizedBox(
            height: _screenSize.height * 0.1,
            child: Container(
              padding: EdgeInsets.all(16.0),
              width: _screenSize.width * 0.8,
              //!USER DETAILS
              child: CustomTextWidget(
                textType: "body",
                text:
                    "Great Bucc ! \n\nWe're having a BUCC BI - weekly jogging, for females, the first of it's kind",
                customTextStyle: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ),

          //!IMAGE
          if (widget.isImagePresent)
            SizedBox(
              height: _screenSize.height * 0.4,
              width: double.infinity,
              child: const Image(
                image: AssetImage("assets/Images/BUCC WEEKLY JOGGING 1.png"),
                fit: BoxFit.fill,
              ),
            ),

          //!ACTION BUTTONS
          SizedBox(
            height: _screenSize.height * 0.05,
            child: Row(
              children: <Widget>[
                //!LIKES
                IconButton(
                  onPressed: () {
                    setState(() {
                      _favouriteCount++;
                    });
                  },
                  icon: Icon(Icons.favorite_outline),
                ),

                CustomTextWidget(
                    textType: "", text: _favouriteCount.toString()),

                //!COMMENT
                IconButton(
                  onPressed: () {
                    setState(() {
                      _commentCount++;
                    });
                  },
                  icon: Icon(Icons.comment_outlined),
                ),

                CustomTextWidget(textType: "", text: _commentCount.toString()),

                //!SHARE
                IconButton(
                  onPressed: () {
                    setState(() {
                      _shareCount++;
                    });
                  },
                  icon: Icon(Icons.share),
                ),

                CustomTextWidget(textType: "", text: _shareCount.toString()),
              ],
            ),
          )
        ],
      ),
    );
  }
}
