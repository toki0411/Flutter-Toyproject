import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ChattingListPage extends StatefulWidget {
  const ChattingListPage({Key? key}) : super(key: key);

  @override
  State<ChattingListPage> createState() => _ChattingListPageState();
}

class _ChattingListPageState extends State<ChattingListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      ///상단 AppBar 부분 ///
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: const Color(0xffffffff),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// 채팅방이름 ///
            Container(
              child: Text(
                '부산국제록페스티벌',
                style: TextStyle(
                  fontFamily: 'Source Han Sans KR',
                  fontSize: 18,
                  color: const Color(0xff191919),
                  fontWeight: FontWeight.w500,
                ),
                textHeightBehavior: TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            /// 채팅방 인원 수 부분 ///
            Container(
              child: Text(
                '4',
                style: TextStyle(
                  fontFamily: 'Source Han Sans KR',
                  fontSize: 20,
                  color: const Color(0xff999999),
                  letterSpacing: -0.5,
                ),
                softWrap: false,
              ),
            )
          ],
        ),
        centerTitle: true,
        leading: Icon(
            Icons.arrow_back_sharp,
            color: Colors.black,
        ),
        actions: [
          PopupMenuButton(
            // add icon, by default "3 dot" icon
            // icon: Icon(Icons.book)
              position: PopupMenuPosition.under,
              elevation: 2.0,
              icon: Icon(
                Icons.more_vert,
                color: Colors.black,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15.0))),
              itemBuilder: (context) {
                return [
                  PopupMenuItem<int>(
                    value: 0,
                    child: Text(
                      '나가기',
                      style: TextStyle(
                        fontFamily: 'Source Han Sans KR',
                        fontSize: 16,
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                  PopupMenuItem<int>(
                    value: 1,
                    child: Text(
                      '신고하기',
                      style: TextStyle(
                        fontFamily: 'Source Han Sans KR',
                        fontSize: 16,
                        color: const Color(0xffda565b),
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w700,
                      ),
                      softWrap: false,
                    )
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                } else if (value == 1) {
                  print("Settings menu is selected.");
                }
              }),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
          child: Center(
            child: Container(
              width:375,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SingleChildScrollView(
                    primary: false,
                    child: Container(
                      height: 500,
                      padding: EdgeInsets.all(10),
                      color: Colors.grey,
                    ),
                  ),
                  Container(
                    height: 100,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Icon(Icons.menu, color: Colors.black),
                              style: ElevatedButton.styleFrom(
                                shape: CircleBorder(),
                                padding: EdgeInsets.all(20),
                              ),
                            )
                            ),
                          flex: 1,
                          ),
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Color(0xfff7f7f7),),
                              borderRadius: BorderRadius.all(Radius.circular(10))
                            ),
                            child: TextField(),
                          ),
                          flex: 5,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
      ),
    );
  }
}
