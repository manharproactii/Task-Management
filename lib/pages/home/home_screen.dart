
import 'dart:collection';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:task_management/config/theme.dart';

import 'home_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final homeController = Get.find<HomeController>();
  final Map<DateTime, List> _holidays = {
    DateTime(2023, 3, 1): ["228"],
  };

  CalendarFormat _calendarFormat = CalendarFormat.month;

  late Map<DateTime, List> _events ;
  late final ValueNotifier<List<Event>> _selectedEvents;

  // final events = LinkedHashMap(
  //   equals: isSameDay,
  //   hashCode: getHashCode,
  // )..addAll(eventSource);

  List<Event> _getEventsForDay(DateTime day) {
    // Implementation example
    return kEvents[day] ?? [];
  }

  @override
  void initState() {
    final _selectedDay = DateTime.now();
    _selectedEvents = ValueNotifier(_getEventsForDay(_selectedDay));

    // Events
    _events = {
      _selectedDay.add(Duration(days: 1)): [
        'Sleep all day',
      ],
      _selectedDay.add(Duration(days: 2)): [
        'Play PS4 Game',
        'Exercising',
        'Coding',
        'Sleeping',
        'Watch a movie',
        'Take a walk',
        'Surf on the internet'
      ],
    };
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [

        Container(color: AppColors.appBarBottomLineColor,width: MediaQuery.of(context).size.width,height: 1,),

        // Container(
        //   // height: 300,
        //   child: Padding(
        //     padding: const EdgeInsets.all(5.0),
        //     child: Card(
        //       elevation: 10,
        //       child: TableCalendar(
        //         onFormatChanged: (format) {
        //           if (_calendarFormat != format) {
        //             // Call `setState()` when updating calendar format
        //             setState(() {
        //               _calendarFormat = format;
        //             });
        //           }
        //         },
        //         eventLoader: _getEventsForDay,
        //         firstDay: DateTime.utc(2010, 10, 16),
        //         lastDay: DateTime.utc(2030, 3, 14),
        //         focusedDay: DateTime.now(),
        //           calendarFormat: _calendarFormat,
        //         locale: 'en_US',
        //         calendarBuilders: CalendarBuilders(
        //           dowBuilder: (context, day) {
        //             if (day.weekday == DateTime.sunday) {
        //               final text = DateFormat.E().format(day);
        //
        //               return Center(
        //                 child: Text(
        //                   text,
        //                   style: TextStyle(color: Colors.red),
        //                 ),
        //               );
        //             }
        //           },
        //         ),
        //           // eventLoader: (day) {
        //           //   return _getEventsForDay(day);
        //           // }
        //       ),
        //     ),
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0,bottom: 24,left: 16,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Department",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                          AppColors.blackColor))),
              Text(
                  "view all",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                          AppColors.blackColor))),
            ],),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16.0,right: 16),
          child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount:
            homeController.departmentList.length,
            gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(
              // crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                // childAspectRatio: 0.7,
                mainAxisExtent: 70,
                crossAxisCount:2
                // (orientation == Orientation.portrait)
                //     ? 2
                //     : 2
            ),
            itemBuilder: (BuildContext context, int index) {
              return InkWell(
                onTap: () async {

                },
                child: Container(
                  decoration: BoxDecoration(
                    color:   homeController.colorList[index],
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 14.0,right: 16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // const SizedBox(
                        //   height: 2,
                        // ),
                        Text(
                            "${homeController.departmentList[index]}",
                            maxLines: 1,
                            //  style: GoogleFonts.ptSans(),
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color:
                                    AppColors.whiteColor))),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                Padding(
                                  padding: const EdgeInsets.all(2.0),
                                  child: Image.asset('assets/icons/users.png',fit: BoxFit.contain,height: 22,width: 22,color: AppColors.whiteColor,),
                                ),
                                SizedBox(width: 3,),
                                Text(
                                    "10",
                                    style: GoogleFonts.poppins(
                                        textStyle: const TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color:
                                            AppColors.whiteColor))),
                              ],),
                              // color: Colors.greenAccent,
                              height: 22,
                            ),

                            SizedBox(width: 8,),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(2.0),
                                    child: Image.asset('assets/icons/task.png',fit: BoxFit.contain,height: 22,width: 22,color: AppColors.whiteColor,),
                                  ),
                                  SizedBox(width: 3,),
                                  Text(
                                      "15",
                                      style: GoogleFonts.poppins(
                                          textStyle: const TextStyle(
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400,
                                              color:
                                              AppColors.whiteColor))),
                                ],),
                              // color: Colors.greenAccent,
                              height: 22,
                            ),

                          ],)
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 24.0,bottom: 24,left: 16,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "High Priority Task",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                          AppColors.blackColor))),
              Text(
                  "view all",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                          AppColors.blackColor))),
            ],),
        ),
        Container(color: AppColors.lineColor,width: MediaQuery.of(context).size.width,height: 1,),
        Column(children:
          homeController.taskList.map((e) {
            int index = homeController.taskList.indexOf(e);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 6.0,bottom: 6,left: 16,right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(

                        children: [
                          Text(
                              "${homeController.taskList[index]}",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w400,
                                      color:
                                      AppColors.blackColor))),
                          Text(
                              "(Human Resources & administration Dept.)",
                              style: GoogleFonts.poppins(
                                  textStyle: const TextStyle(
                                      fontSize: 10,
                                      fontWeight: FontWeight.w300,
                                      color:
                                      AppColors.blackColor))),
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),

                      Container(

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: AppColors.orangeColor1.withOpacity(0.5),
                        ),
                        height: 20,width: 95,child: Center(
                          child: Text(
                            "To Do",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize:12,
                                    fontWeight: FontWeight.w500,
                                    color:
                                    AppColors.orangeColor1))),
                        ),)
                    ],
                  ),
                ),
                Container(color: AppColors.lineColor,width: MediaQuery.of(context).size.width,height: 1,),
              ],
            );
          }).toList()
          ,),
        Padding(
          padding: const EdgeInsets.only(top: 24.0,bottom: 24,left: 16,right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  "Completed Task",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color:
                          AppColors.blackColor))),
              Text(
                  "view all",
                  style: GoogleFonts.poppins(
                      textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color:
                          AppColors.blackColor))),
            ],),
        ),
        Container(color: AppColors.lineColor,width: MediaQuery.of(context).size.width,height: 1,),
        Column(children:
        homeController.taskList.map((e) {
          int index = homeController.taskList.indexOf(e);
          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6.0,bottom: 6,left: 16,right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(

                      children: [
                        Text(
                            "${homeController.taskList[index]}",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color:
                                    AppColors.blackColor))),
                        Text(
                            "(Human Resources & administration Dept.)",
                            style: GoogleFonts.poppins(
                                textStyle: const TextStyle(
                                    fontSize: 10,
                                    fontWeight: FontWeight.w300,
                                    color:
                                    AppColors.blackColor))),
                      ],
                      crossAxisAlignment: CrossAxisAlignment.start,
                    ),

                    Container(

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(3),
                        color: AppColors.greenColor1.withOpacity(0.5),
                      ),
                      height: 20,width: 95,child: Center(
                      child: Text(
                          "Completed",
                          style: GoogleFonts.poppins(
                              textStyle: const TextStyle(
                                  fontSize:12,
                                  fontWeight: FontWeight.w500,
                                  color:
                                  AppColors.greenColor1))),
                    ),)
                  ],
                ),
              ),
              Container(color: AppColors.lineColor,width: MediaQuery.of(context).size.width,height: 1,),
            ],
          );
        }).toList()
          ,),







      ],),

    );
  }
  // List<Event> _getEventsForDay(DateTime day) {
  //   return events[day] ?? [];
  // }
}

class Event {
  final String title;

  const Event(this.title);

  @override
  String toString() => title;
}

final kEvents = LinkedHashMap<DateTime, List<Event>>(
  // equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = Map.fromIterable(List.generate(10, (index) => index),
    key: (item) => DateTime.utc(kFirstDay.year, kLastDay.month, item * 1),
    value: (item) => List.generate(
        item % 4 + 1, (index) => Event('Event $item | ${index + 1}')))
  ..addAll({
    kToday: [
      Event('Today\'s Event 1'),
      Event('Today\'s Event 2'),
    ],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
        (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);