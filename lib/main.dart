import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class MyApp extends StatelessWidget {
  //캘린더 표시
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            body: SizedBox(
                child: Row(children: [
      Container(
        color: Colors.red,
        height: 70,
        width: 90,
        child: Column(
          children: [ElevatedButton(onPressed: () {}, child: Text("sex"))],
        ),
      ),
      Expanded(
          child: Container(
        child: SfCalendar(
          view: CalendarView.week,
        ),
      )),
    ]))));
  }
}

void main() {
  runApp(MaterialApp(
    //메테리얼 앱 위젯 받아오기
    home: MyApp(),
  ));
}
