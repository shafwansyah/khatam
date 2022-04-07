import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:khatam/pages/detail.dart';
import 'package:khatam/theme.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  double? progress;
  String? selectedDate;
  void _navigateAndGetResult(BuildContext context, String date) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailDate(
          juz: date,
        ),
      ),
    );
    setState(() {
      progress = result * 5 / 100;
      selectedDate = date;
    });
  }

  Widget DateCard(String date) {
    return GestureDetector(
      onTap: () {
        _navigateAndGetResult(context, date);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        margin: EdgeInsets.only(bottom: 20),
        width: 315,
        height: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              width: 55,
              height: 55,
              child: Image.asset('assets/icon_read.png'),
            ),
            SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  selectedDate == date
                      ? '$date Ramadhan - $progress'
                      : '$date Ramadhan',
                  style: titleCard.copyWith(fontWeight: semiBold),
                ),
                SizedBox(
                  height: 12,
                ),
                selectedDate == date
                    ? LinearPercentIndicator(
                        padding: EdgeInsets.zero,
                        width: 209,
                        lineHeight: 8.0,
                        percent: progress!.toDouble(),
                        progressColor: bg_iconColor,
                      )
                    : SizedBox(),
                SizedBox(
                  height: 12,
                ),
                Text(
                  'Alhamdulillah, hari ini selesai',
                  style: subtitleCard.copyWith(fontWeight: medium),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: bg_color,
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                left: 26,
                right: 26,
                top: 32,
              ),
              width: double.infinity,
              height: 215,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/header.png'),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Khatam Ramadhan',
                      style:
                          titleApp.copyWith(fontSize: 24, fontWeight: semiBold),
                    ),
                  ),
                  SizedBox(
                    height: 64,
                  ),
                  Text('Bismillah',
                      style: titleApp.copyWith(
                          fontWeight: semiBold, fontSize: 20)),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    children: [
                      Text(
                        HijriCalendar.now().toString(),
                        style: titleApp.copyWith(
                            fontWeight: semiBold, fontSize: 20),
                      ),
                      SizedBox(width: 8),
                      Icon(
                        Icons.edit,
                        color: bg_color,
                        size: 22,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
                child: Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: ListView(
                // children: children,
                children: new List.generate(
                    30, (index) => DateCard((index + 1).toString())),
              ),
            )),
          ],
        ),
      ),
    );
  }
}
