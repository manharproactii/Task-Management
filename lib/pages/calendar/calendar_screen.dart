import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../../config/theme.dart';
import '../../../routes/navigation.dart';
import '../home/home_screen.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({Key? key}) : super(key: key);

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  List<String> list = [
    "Approved(4)",
    "Completed(0)",
    "In Progress(5)",
    "To Do(2)",
  ];

  List<String> imageList = [
    "assets/icons/yellow_icon.png",
    "assets/icons/green_icon.png",
    "assets/icons/purpal_icon.png",
    "assets/icons/orange_icon.png",
  ];

  List<String> imageListExpended = [
    "assets/icons/yellow_icon_expended.png",
    "assets/icons/green_icon_expended.png",
    "assets/icons/purpal_icon_expended.png",
    "assets/icons/orange_icon_expended.png",
  ];

  List<String> taskList = [
    "UI/UX Design",
    "Website Design & Develpoment",
    "Vartaman Pravah Android App",
    "Vartaman Pravah Android App",
    "Vartaman Pravah Android App"
  ];

  List<String> dateList = [
    "Wed, 20 Jul",
    "Mon, 18 Jul",
    "Fri, 15 Jul",
    "Fri, 15 Jul",
    "Fri, 15 Jul"
  ];

  bool isSwitched = false;

  bool expand = false;
  int? tapped;

  Map<DateTime, List<Event>> selectedEvents = {};

  List<DateTime> dateLists = [
    DateTime.parse("2023-05-10 00:00:00.000Z"),
    DateTime.parse("2023-05-10 00:00:00.000Z"),
    DateTime.parse("2023-05-15 00:00:00.000Z"),
    DateTime.parse("2023-06-01 00:00:00.000Z")
  ];

  List<String> colorList = [
    "Approved",
    "Completed",
    "In Progress",
    "To Do",
  ];

  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  CalendarFormat format = CalendarFormat.month;
  DateTime selectedDay = DateTime.parse("2023-05-17 00:00:00.000Z");
  DateTime focusedDay = DateTime.now();

  final TextEditingController _eventController = TextEditingController();

  @override
  void initState() {
    selectedEvents = {};

    dateLists.forEach((element) {
      int i = dateLists.indexOf(element);

      selectedDay = element;

      if (selectedEvents[selectedDay] != null) {
        selectedEvents[selectedDay]!.add(
          Event(colorList[i]),
        );
      } else {
        selectedEvents[selectedDay] = [Event(colorList[i])];
      }
    });

    selectedDay = DateTime.now();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: ListView(
          children: [
            TableCalendar(
              calendarBuilders: CalendarBuilders(
                markerBuilder: (BuildContext context, date, events) {
                  // print("events ====? ${date.toString()}");
                  // print("events ====? ${events}");
                  if (events.isEmpty) return SizedBox();

                  return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: events.length,
                      itemBuilder: (context, index) {
                        // print("events ====? ${events[index]}");
                        // if(events[index] == "Approved"){
                        //
                        //   return Container(
                        //     margin: const EdgeInsets.only(top: 30),
                        //     padding: const EdgeInsets.all(1),
                        //     child: Container(
                        //       // height: 7,
                        //       width: 6,
                        //       decoration: const BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: AppColors.yellowColor,
                        //     ),
                        //   ));
                        // }else if(events[index] == "Completed"){
                        //
                        //   return Container(
                        //       margin: const EdgeInsets.only(top: 30),
                        //       padding: const EdgeInsets.all(1),
                        //       child: Container(
                        //         // height: 7,
                        //         width: 6,
                        //         decoration: const BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: AppColors.greenColor1,
                        //         ),
                        //       ));
                        // }else if(events[index] == "In Progress"){
                        //
                        //   return Container(
                        //       margin: const EdgeInsets.only(top: 30),
                        //       padding: const EdgeInsets.all(1),
                        //       child: Container(
                        //         // height: 7,
                        //         width: 6,
                        //         decoration: const BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: AppColors.purpleColor,
                        //         ),
                        //       ));
                        // }
                        //
                        // else{
                        //
                        //   return Container(
                        //       margin: const EdgeInsets.only(top: 30),
                        //       padding: const EdgeInsets.all(1),
                        //       child: Container(
                        //         // height: 7,
                        //         width: 6,
                        //         decoration: const BoxDecoration(
                        //           shape: BoxShape.circle,
                        //           color: AppColors.orangeColor1,
                        //         ),
                        //       ));
                        // }

                        return Container(
                            margin: const EdgeInsets.only(top: 30),
                            padding: const EdgeInsets.all(1),
                            child: Container(
                              // height: 7,
                              width: 6,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.blackColor,
                              ),
                            ));
                      });
                },
              ),
              focusedDay: selectedDay,
              firstDay: DateTime(1990),
              lastDay: DateTime(2050),
              calendarFormat: format,
              onFormatChanged: (CalendarFormat _format) {
                setState(() {
                  // format = _format;
                });
              },
              startingDayOfWeek: StartingDayOfWeek.sunday,
              daysOfWeekVisible: true,

              //Day Changed
              onDaySelected: (DateTime selectDay, DateTime focusDay) {
                setState(() {
                  selectedDay = selectDay;
                  focusedDay = focusDay;
                });
                print(focusedDay);
              },
              // selectedDayPredicate: (DateTime date) {
              //   return isSameDay(selectedDay, date);
              // },

              eventLoader: _getEventsfromDay,

              //To style the Calendar
              calendarStyle: CalendarStyle(
                isTodayHighlighted: true,
                selectedDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                markersMaxCount: 4,
                markerSize: 6,
                markerDecoration: BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(color: Colors.white),
                todayDecoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                defaultDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                weekendDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
              headerStyle: HeaderStyle(
                formatButtonVisible: true,
                titleCentered: true,
                formatButtonShowsNext: false,
                formatButtonDecoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(5.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
            Column(
              children: dateList.map((e) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 16.0, left: 16, right: 16, bottom: 0),
                      child: Text(e,
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: AppColors.blackColor))),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    Column(
                      children: list.map((e) {
                        int index = list.indexOf(e);
                        return GestureDetector(
                          onTap: () {
                            debugPrint('List item $index tapped $expand');
                            setState(() {
                              /// XOR operand returns when either or both conditions are true
                              /// `tapped == null` on initial app start, [tapped] is null
                              /// `index == tapped` initiate action only on tapped item
                              /// `!expand` should check previous expand action
                              expand = ((tapped == null) ||
                                      ((index == tapped) || !expand))
                                  ? !expand
                                  : expand;

                              /// This tracks which index was tapped
                              tapped = index;
                              debugPrint('current expand state: $expand');
                            });
                          },

                          /// We set ExpandableListView to be a Widget
                          /// for Home StatefulWidget to be able to manage
                          /// ExpandableListView expand/retract actions
                          child: expandableListView(
                            index,
                            list[index],
                            index == tapped ? expand : false,
                          ),
                          // child: ExpandableListView(
                          //   title: "Title $index",
                          //   isExpanded: expand,
                          // ),
                        );
                      }).toList(),
                    ),
                    // Expanded(
                    //   child: ListView.builder(
                    //     // physics: NeverScrollableScrollPhysics(),
                    //     itemBuilder: (BuildContext context, int index) {
                    //       return
                    //
                    //         GestureDetector(
                    //         onTap: () {
                    //           debugPrint('List item $index tapped $expand');
                    //           setState(() {
                    //             /// XOR operand returns when either or both conditions are true
                    //             /// `tapped == null` on initial app start, [tapped] is null
                    //             /// `index == tapped` initiate action only on tapped item
                    //             /// `!expand` should check previous expand action
                    //             expand =
                    //             ((tapped == null) || ((index == tapped) || !expand))
                    //                 ? !expand
                    //                 : expand;
                    //
                    //             /// This tracks which index was tapped
                    //             tapped = index;
                    //             debugPrint('current expand state: $expand');
                    //           });
                    //         },
                    //
                    //         /// We set ExpandableListView to be a Widget
                    //         /// for Home StatefulWidget to be able to manage
                    //         /// ExpandableListView expand/retract actions
                    //         child: expandableListView(
                    //           index,
                    //           list[index],
                    //           index == tapped ? expand : false,
                    //         ),
                    //         // child: ExpandableListView(
                    //         //   title: "Title $index",
                    //         //   isExpanded: expand,
                    //         // ),
                    //       );
                    //     },
                    //     itemCount: list.length,
                    //   ),
                    // ),
                    // SizedBox(height: 10,),
                  ],
                );
              }).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.add,
          size: 30,
        ),
        backgroundColor: AppColors.editTextFocusLabelColor,
        onPressed: () {
          Get.toNamed(Routes.addTask, arguments: [
            {"isFlag": false}
          ]);
        },
      ),
    );
  }

  Widget expandableListView(int index, String title, bool isExpanded) {
    debugPrint('List item build $index $isExpanded');
    return Container(
      // margin: EdgeInsets.symmetric(vertical: 0.0),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            // padding: EdgeInsets.symmetric(horizontal: 5.0),
            child: Padding(
              padding: index == 0
                  ? const EdgeInsets.only(left: 16.0, bottom: 8, top: 8)
                  : const EdgeInsets.only(left: 16.0, bottom: 8, top: 8),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isExpanded
                      ? Image.asset(
                          imageListExpended[index],
                          fit: BoxFit.contain,
                          height: 16,
                          width: 16,
                        )
                      : Image.asset(
                          imageList[index],
                          fit: BoxFit.contain,
                          height: 16,
                          width: 16,
                        ),
                  SizedBox(
                    width: 14,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.black),
                  )
                ],
              ),
            ),
          ),
          InkWell(
            onTap: () {
              // print("sacsasasad");

              Get.toNamed(
                Routes.viewTask,
              );
            },
            child: Container(
              color: Colors.white,
              child: ExpandableContainer(
                  length: taskList.length,
                  expanded: isExpanded,
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (BuildContext context, int index) {
                      return Container(
                        height: 50,
                        child: Column(
                          children: [
                            Container(
                              height: 49,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 16.0, right: 16.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      children: [
                                        Image.asset(
                                          'assets/icons/check_box.png',
                                          fit: BoxFit.contain,
                                          height: 16,
                                          width: 16,
                                        ),
                                        SizedBox(
                                          width: 14,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text("${taskList[index]}",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        color: AppColors
                                                            .blackColor))),
                                            Text(
                                                "(Human Resources & administration Dept.)",
                                                style: GoogleFonts.poppins(
                                                    textStyle: const TextStyle(
                                                        fontSize: 10,
                                                        fontWeight:
                                                            FontWeight.w300,
                                                        color: AppColors
                                                            .blackColor))),
                                          ],
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                        ),
                                      ],
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(3),
                                        color: AppColors.orangeColor1
                                            .withOpacity(0.5),
                                      ),
                                      height: 20,
                                      width: 95,
                                      child: Center(
                                        child: Text("To Do",
                                            style: GoogleFonts.poppins(
                                                textStyle: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w500,
                                                    color: AppColors
                                                        .orangeColor1))),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              color: AppColors.lineColor,
                              width: MediaQuery.of(context).size.width,
                              height: 1,
                            ),
                          ],
                        ),
                      );
                    },
                    itemCount: taskList.length,
                  )),
            ),
          )
        ],
      ),
    );
  }
}

class ExpandableContainer extends StatelessWidget {
  final bool expanded;
  final int length;
  final double collapsedHeight;
  final double expandedHeight;
  final Widget child;

  ExpandableContainer({
    required this.child,
    this.collapsedHeight = 0.0,
    this.expandedHeight = 50.0,
    this.expanded = true,
    required this.length,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Container(
      // duration: Duration(milliseconds: 500),
      // curve: Curves.easeInOut,
      width: screenWidth,
      height: expanded ? expandedHeight * length : collapsedHeight,
      child: Container(
        child: child,
        // decoration:
        // BoxDecoration(border: Border.all(width: 1.0, color: Colors.blue)),
      ),
    );
  }
}
