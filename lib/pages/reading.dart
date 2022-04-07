import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../theme.dart';

class ReadingScreen extends StatefulWidget {
  const ReadingScreen({Key? key, required this.juz}) : super(key: key);
  final String juz;

  @override
  State<ReadingScreen> createState() => _ReadingScreenState();
}

class _ReadingScreenState extends State<ReadingScreen> {
  List<String> halamanBaca = [];
  int _currIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    for (var i = 21; i >= 1; i--) {
      halamanBaca.add('assets/juz${widget.juz}/${i}.png');
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    int index = 21;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        body: SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Stack(
              alignment: AlignmentDirectional.topCenter,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset('assets/header.png'),
                ),
                Positioned(
                  top: 30,
                  child: Column(
                    children: [
                      Text('Jangan Lupa Ta\'awudz',
                          style: titleApp.copyWith(
                              fontSize: 20, fontWeight: semiBold)),
                      SizedBox(height: 16),
                      Directionality(
                        textDirection: TextDirection.rtl,
                        child: Text('أعوذ بالله من الشيطان الرجيم',
                            style: titleApp.copyWith(
                                fontWeight: semiBold, fontSize: 24)),
                      ),
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 110,
                  ),
                  child: CarouselSlider(
                    items: halamanBaca.map((e) {
                      return Container(
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        child: Image.asset(
                          e,
                          fit: BoxFit.fitWidth,
                          width: 315,
                        ),
                      );
                    }).toList(),
                    options: CarouselOptions(
                      viewportFraction: 0.9,
                      height: 600,
                      reverse: true,
                      initialPage: 0,
                      onPageChanged: ((index, reason) {
                        setState(() {
                          _currIndex = index;
                          print('currIndex = $_currIndex');
                        });
                      }),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: halamanBaca.map((e) {
                      index--;
                      return Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 2,
                        ),
                        width: _currIndex == index ? 16 : 4,
                        height: 4,
                        decoration: BoxDecoration(
                          color: _currIndex == index
                              ? progressBar_blur
                              : textColor_black,
                          borderRadius: BorderRadius.circular(10),
                        ),
                      );
                    }).toList(),
                  ),
                )
                // SingleChildScrollView(
                //   scrollDirection: Axis.horizontal,
                //   reverse: false,
                //   child: Row(
                //     children: halamanBaca.map((e) {
                //       return Container(
                //         margin: EdgeInsets.symmetric(
                //           horizontal: 15,
                //         ),
                //         width: 315,
                //         height: 600,
                //         child: Image.asset(
                //           e,
                //           fit: BoxFit.fitWidth,
                //         ),
                //       );
                //     }).toList(),
                //   ),
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
