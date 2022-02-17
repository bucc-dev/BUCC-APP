import 'package:bucc_app/themes/theme.dart';
import 'package:bucc_app/view/custom_widgets/custom_text_widget.dart';
import 'package:flutter/material.dart';

class CustomEvent extends StatelessWidget {
  final String? theDay;
  final int? numberOfEventsForDay;
  final List<String>? eventsForTheDay;
  const CustomEvent(
      {Key? key, this.numberOfEventsForDay, this.eventsForTheDay, this.theDay})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size _screenSize = MediaQuery.of(context).size;
    return SizedBox(
      height: _screenSize.height * 0.2,
      //color: Colors.yellow,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          //!THE DAY
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomTextWidget(
              textType: "",
              text: theDay ?? "",
              customTextStyle: Theme.of(context)
                  .textTheme
                  .headline1!
                  .copyWith(fontSize: 13.0),
            ),
          ),

          //!THE LINE
          const Divider(
            thickness: 1.5,
            color: Color(0xFFCACACA),
          ),

          //!THE EVENT
          Container(
            alignment: Alignment.center,
            height: _screenSize.height * 0.08,
            padding: const EdgeInsets.all(8.0),
            //color: Colors.yellow,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                //!RED BAR
                Container(
                  width: _screenSize.width * 0.01,
                  decoration: const BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))),
                ),

                //!SPACER
                SizedBox(
                  width: _screenSize.height * 0.03,
                ),

                //! EVENT BOX
                SizedBox(
                  width: _screenSize.width * 0.8,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      //!EVENT TITLE AND SUBTITLE,
                      Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            //!TITLE
                            CustomTextWidget(
                              textType: "",
                              text: "Glow Night",
                              customTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: Colors.black,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),

                            //!SUBTITLE
                            CustomTextWidget(
                              textType: "",
                              text: "University Stadium",
                              customTextStyle: Theme.of(context)
                                  .textTheme
                                  .bodyText1!
                                  .copyWith(
                                    color: const Color(0xFF5F5F5F),
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                            )
                          ]),

                      //!EVENT DATE
                      CustomTextWidget(
                        textType: "",
                        text: "5:30pm - 8:30pm",
                        customTextStyle:
                            Theme.of(context).textTheme.bodyText1!.copyWith(
                                  color: const Color(0xFF878787),
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.w500,
                                ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
