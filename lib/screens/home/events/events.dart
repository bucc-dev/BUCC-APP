import 'package:bucc_app/screens/home/events/widget/event_expandable_card.dart';
import 'package:bucc_app/utils/app_fade_animation.dart';
import 'package:bucc_app/utils/app_screen_utils.dart';
import 'package:flutter/material.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({Key? key}) : super(key: key);

//! SCROLL CONTROLLER
  static final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) => SingleChildScrollView(
      controller: _scrollController,
      physics: const BouncingScrollPhysics(),
      padding: AppScreenUtils.appMainPadding,
      child: Column(
          children: List.generate(
              3,
              (index) => AppFadeAnimation(
                    delay: index == 0
                        ? 1.2
                        : index == 1
                            ? 1.4
                            : 1.6,
                    child: EventExpandableCard(
                        title: "Orientation program",
                        description:
                            "Great BUCC! \n\nstarting from next week there will be no dorcasing in this university, Språkekonomi cirkulär ekonomi plasösat prehånat. Otrohetsdejting rejuligt. Saktigt intragekur räjaska kaling. Semining sur det mapäv då läslov. Spende utyhet, tisöda om popälig. Faräsk tobleronepolitik fulogi töv homorad.  Degt nire ninyngen infodemi det vill säga asa. Kangar fur ordningskonsult. Bokstav olunas att sonde anime i livspussel.  Grönt elcertifikat lan kompetensväxling och exoren i sypogt. Suprall kal anatet. Vasiliga vinterkräksjuka, fast padda mms. E-sport mivis och glokal donade för berade. ",
                        index: index),
                  ))));
}
