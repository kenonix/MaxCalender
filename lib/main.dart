import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

int calender_selector = 0;

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('사축 스케쥴'), //앱 바 설명
          centerTitle: true,
          elevation: 0.0,
          actions: [
            IconButton(
              // 검색 아이콘
              onPressed: () {},
              icon: Icon(Icons.search),
            ),
            IconButton(
              // 사람 아이콘
              onPressed: () {},
              icon: Icon(Icons.person),
            )
          ],
        ),
        body: Expanded(
          child: Column(
            children: [
              switch (calender_selector) {
                0 => SfCalendar(view: CalendarView.month),
                1 => SfCalendar(view: CalendarView.week),
                // TODO: Handle this case.
                int() => throw UnimplementedError(),
              },
              SizedBox(
                //TODO: 캘린더 밑 일정표기부분 제작 필요
                height: 200,
                width: 200,
                child: Container(
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
          //위에 햄버거 바 제작
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                currentAccountPicture: CircleAvatar(
                  backgroundImage: AssetImage('assets/image/dog.jpg'), //계정 사진
                ),
                accountName: Text('조은재'), // 이름
                accountEmail: Text('해병대 자진입대자@naver.com'), // 이메일
                onDetailsPressed: () {},
                decoration: BoxDecoration(
                  color: Colors.red, //위에 바탕 색
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0),
                  ),
                ),
              ),
              ListTile(
                // 아래로 메뉴 제작
                leading: Icon(Icons.air),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: Text('달 일정'),
                onTap: () {
                  calender_selector = 0;
                },
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.bed),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: Text('주 일정'),
                onTap: () {
                  calender_selector = 1;
                },
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.mark_as_unread_sharp),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: Text('편지함'),
                onTap: () {},
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.restore_from_trash),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: Text('휴지통'),
                onTap: () {},
                trailing: Icon(Icons.navigate_next),
              ),
              ListTile(
                leading: Icon(Icons.settings),
                iconColor: Colors.purple,
                focusColor: Colors.purple,
                title: Text('설정'),
                onTap: () {},
                trailing: Icon(Icons.navigate_next),
              ),
            ],
          ),
        ));
  }
}

void main() {
  runApp(MaterialApp(
    //메테리얼 앱 위젯 받아오기
    home: HomeScreen(),
  ));
}
