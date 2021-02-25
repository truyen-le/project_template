import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:table_calendar/table_calendar.dart';

class DatePickerPage extends StatefulWidget {
  @override
  _DatePickerPageState createState() => _DatePickerPageState();
}

class _DatePickerPageState extends State<DatePickerPage>
    with TickerProviderStateMixin {
  CalendarController _calendarController;

  // AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    _calendarController = CalendarController();
    // _animationController = AnimationController(
    //   vsync: this,
    //   duration: const Duration(milliseconds: 400),
    // );
    //
    // _animationController.forward();
  }

  @override
  void dispose() {
    _calendarController.dispose();
    // _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TableCalendar(
            calendarController: _calendarController,
            // events: _events,
            // holidays: _holidays,
            rowHeight: 100,
            initialCalendarFormat: CalendarFormat.month,
            formatAnimation: FormatAnimation.slide,
            startingDayOfWeek: StartingDayOfWeek.monday,
            availableGestures: AvailableGestures.horizontalSwipe,
            startDay: DateTime.now(),
            availableCalendarFormats: const {
              CalendarFormat.month: '',
              CalendarFormat.week: '',
            },
            calendarStyle: CalendarStyle(
              cellMargin: EdgeInsets.zero,
              contentPadding: EdgeInsets.zero,
              outsideDaysVisible: false,
              weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
              holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
            ),
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              formatButtonVisible: false,
            ),
            builders: CalendarBuilders(
              unavailableDayBuilder: (context, date, _) {
                return Container(
                  width: 50,
                  height: 50,
                  decoration: new BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.rectangle,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle().copyWith(color: Colors.black38),
                    ),
                  ),
                );
              },
              dayBuilder: (context, date, _) {
                return Center(
                  child: Container(
                    // margin: const EdgeInsets.all(4.0),
                    width: 50,
                    height: 50,
                    decoration: new BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.rectangle,
                    ),
                    child: Center(
                      child: Text(
                        '${date.day}',
                        style: TextStyle(),
                      ),
                    ),
                  ),
                );
              },
              selectedDayBuilder: (context, date, _) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  width: 50,
                  height: 50,
                  decoration: new BoxDecoration(
                    color: Colors.blue,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle().copyWith(fontSize: 16.0),
                    ),
                  ),
                );
              },
              todayDayBuilder: (context, date, _) {
                return Container(
                  margin: const EdgeInsets.all(4.0),
                  // padding: const EdgeInsets.only(top: 5.0, left: 6.0),
                  // color: Colors.blue[300],
                  width: 50,
                  height: 50,
                  decoration: new BoxDecoration(
                    // color: Colors.blue[300],
                    border: Border.all(color: Colors.blue[300]),
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      '${date.day}',
                      style: TextStyle(),
                    ),
                  ),
                );
              },
              // markersBuilder: (context, date, events, holidays) {
              //   final children = <Widget>[];
              //
              //   if (events.isNotEmpty) {
              //     children.add(
              //       Positioned(
              //         right: 1,
              //         bottom: 1,
              //         child: _buildEventsMarker(date, events),
              //       ),
              //     );
              //   }
              //
              //   if (holidays.isNotEmpty) {
              //     children.add(
              //       Positioned(
              //         right: -2,
              //         top: -2,
              //         child: _buildHolidaysMarker(),
              //       ),
              //     );
              //   }
              //
              //   return children;
              // },
            ),
            // onDaySelected: (date, events, holidays) {
            //   _onDaySelected(date, events, holidays);
            //   _animationController.forward(from: 0.0);
            // },
            // onVisibleDaysChanged: _onVisibleDaysChanged,
            // onCalendarCreated: _onCalendarCreated,
          )
        ],
      ),
    );
  }
}
