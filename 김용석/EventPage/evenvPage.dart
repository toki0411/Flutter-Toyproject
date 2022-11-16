import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EventPage extends StatefulWidget {
  const EventPage({Key? key}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -3,
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
        ),
        centerTitle: false,
        title: Text(
          '알림',
          style: TextStyle(
            fontFamily: 'Source Han Sans KR',
            fontSize: 20,
            color: const Color(0xff191919),
            letterSpacing: -0.5,
            fontWeight: FontWeight.w500,
            height: 4,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
      body: Container(
          padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
          child: SingleChildScrollView(
            primary: false,
            child: Container(
              height: 1000,
              child: Column(
                children: [
                  Container(
                      width: double.infinity,
                      color: const Color(0xfff5fafe),
                      height: 95,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '참여 요청',
                                  style: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 12,
                                    color: const Color(0xff848484),
                                    letterSpacing: -0.30000000000000004,
                                  ),
                                  softWrap: false,
                                ),
                                Text(
                                  '방금 전',
                                  style: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 12,
                                    color: const Color(0xff707070),
                                    letterSpacing: -0.30000000000000004,
                                  ),
                                  softWrap: false,
                                ),
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Source Han Sans KR',
                                  fontSize: 14,
                                  color: const Color(0xff191919),
                                  letterSpacing: -0.35000000000000003,
                                ),
                                children: [
                                  TextSpan(
                                    text: '부산국제록페스티벌 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '참여 요청이 도착했습니다.',
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            )
                          ],
                        ),
                      )),
                  Container(
                      width: double.infinity,
                      height: 95,
                      child: Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '참여 요청',
                                  style: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 12,
                                    color: const Color(0xff848484),
                                    letterSpacing: -0.30000000000000004,
                                  ),
                                  softWrap: false,
                                ),
                                Text(
                                  '방금 전',
                                  style: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 12,
                                    color: const Color(0xff707070),
                                    letterSpacing: -0.30000000000000004,
                                  ),
                                  softWrap: false,
                                ),
                              ],
                            ),
                            Text.rich(
                              TextSpan(
                                style: TextStyle(
                                  fontFamily: 'Source Han Sans KR',
                                  fontSize: 14,
                                  color: const Color(0xff191919),
                                  letterSpacing: -0.35000000000000003,
                                ),
                                children: [
                                  TextSpan(
                                    text: '부산국제록페스티벌 ',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  TextSpan(
                                    text: '참여 요청이 도착했습니다.',
                                  ),
                                ],
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          )),
    );
  }
}
