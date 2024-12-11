import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
import './utils.dart';

void main() async{
  await initializeDateFormatting();
  runApp(MaterialApp(
    //메테리얼 앱 위젯 받아오기
    home: HomeScreen(),
  ));
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
int calender_selector = 0;
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('MaxCalender'), //앱 바 설명
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              // 검색 아이콘
              onPressed: () {
                setState(() {
                    calender_selector = 0;
                  });},
              icon: Icon(Icons.search),
            ),
            IconButton(
              // 사람 아이콘
              onPressed: () {
                  setState(() {
                    calender_selector = 1;
                  });
              },
              icon: Icon(Icons.person),
            )
          ],
        ),
        body: Column(
        children: [
          TableCalendar(
        locale: 'ko_KR',
        firstDay: kFirstDay,
        lastDay: kLastDay,
        focusedDay: _focusedDay,
        calendarFormat: _calendarFormat,
        selectedDayPredicate: (day) {
          // Use `selectedDayPredicate` to determine which day is currently selected.
          // If this returns true, then `day` will be marked as selected.

          // Using `isSameDay` is recommended to disregard
          // the time-part of compared DateTime objects.
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          if (!isSameDay(_selectedDay, selectedDay)) {
            // Call `setState()` when updating the selected day
            setState(() {
              _selectedDay = selectedDay;
              _focusedDay = focusedDay;
            });
          }
        },
        onFormatChanged: (format) {
          if (_calendarFormat != format) {
            // Call `setState()` when updating calendar format
            setState(() {
              _calendarFormat = format;
            });
          }
        },
        onPageChanged: (focusedDay) {
          // No need to call `setState()` here
          _focusedDay = focusedDay;
        },
      ),],
      ),
        drawer: Drawer(
          //위에 햄버거 바 제작
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/flutter_logo.png'), //계정 사진
                ),
                accountName: Text('조은재'), // 이름
                accountEmail: Text('해병대 자진입대자@naver.com'), // 이메일
                onDetailsPressed: () {},
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 0, 0, 0), //위에 바탕 색
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
              ListTile(
                // 아래로 메뉴 제작
                leading: Icon(Icons.air),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                focusColor: const Color.fromARGB(255, 0, 0, 0),
                title: Text('달 일정'),
                onTap: () {
                  setState(() {
                    calender_selector = 0;
                  });
                },
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.bed),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                focusColor: const Color.fromARGB(255, 0, 0, 0),
                title: Text('주 일정'),
                onTap: () {
                  setState(() {
                    calender_selector = 1;
                  });
                },
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.mark_as_unread_sharp),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                focusColor: const Color.fromARGB(255, 0, 0, 0),
                title: Text('편지함'),
                onTap: () {},
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.restore_from_trash),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                focusColor: const Color.fromARGB(255, 0, 0, 0),
                title: Text('휴지통'),
                onTap: () {},
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                iconColor: const Color.fromARGB(255, 0, 0, 0),
                focusColor: const Color.fromARGB(255, 0, 0, 0),
                title: Text('설정'),
                onTap: () {},
                trailing: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ));
  }
}

