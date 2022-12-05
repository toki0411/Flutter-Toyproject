import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// 뒤로가기 버튼 ///
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          '설정',
          style: TextStyle(
            fontFamily: 'Source Han Sans KR',
            fontSize: 20,
            color: const Color(0xff191919),
            letterSpacing: -0.5,
            fontWeight: FontWeight.w500,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        backgroundColor: const Color(0xffffffff),
        elevation: 0,
      ),
      body: Pinned.fromPins(
        Pin(size: 375.0, middle: 0.5),
        Pin(start: 10.0, end: 10.0),
        child: Container(
          width: 375,
          height: 600,
          color: Colors.orange,
          child: Column(
            children: [
              Container(
                width: 375,
                height: 60,
                color: Colors.grey,
                child: Stack(
                  children: [
                    /// 프로필 사진 부분 ///
                    Positioned(
                        child: SizedBox(
                      width: 60,
                      height: 60,
                      child: CircleAvatar(),
                    )),
                    /// 프로필 이름 및 수정 버튼 부분 버튼 영역 늘릴 예정 ///
                    Positioned(
                        left: 70,
                        child: Container(
                          width: 200,
                          height: 55,
                          color: Colors.yellow,
                          child: TextButton(
                            onPressed: () {},
                            child: Text('이유진\n프로필 수정하기'),
                          ),
                        )),
                    Positioned(
                        right: -0,
                        top: 15,
                        child: Icon(Icons.arrow_forward_ios))
                  ],
                ),
              ),
              Container(
                width: 375,
                height: 20,
                color: Colors.white,
              ),
              Container(
                width: 375,
                height: 200,
                color: Colors.green,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// 참여 요청 버튼 부분 ///
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                '참여요청',
                                style: TextStyle(
                                  fontFamily: 'Source Han Sans KR',
                                  fontSize: 16,
                                  color: const Color(0xff000000),
                                ),
                                softWrap: false,
                              )),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    /// 1:1 문의 버튼 부분 ///
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                              onPressed: () {},
                              child: Text(
                                '1:1 문의',
                                style: TextStyle(
                                  fontFamily: 'Source Han Sans KR',
                                  fontSize: 16,
                                  color: const Color(0xff000000),
                                ),
                                softWrap: false,
                              )),
                          Icon(Icons.arrow_forward_ios)
                        ],
                      ),
                    ),
                    /// 로그아웃 버튼 부분 ///
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          '로그아웃',
                          style: TextStyle(
                            fontFamily: 'Source Han Sans KR',
                            fontSize: 16,
                            color: const Color(0xff000000),
                          ),
                          softWrap: false,
                        )),
                    /// 회원 탈퇴 버튼 부분 ///
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          '회원탈퇴',
                          style: TextStyle(
                            fontFamily: 'Source Han Sans KR',
                            fontSize: 16,
                            color: const Color(0xff707070),
                            letterSpacing: -0.30000000000000004,
                            decoration: TextDecoration.underline,
                            height: 6.083333333333333,
                          ),
                          textHeightBehavior: TextHeightBehavior(
                              applyHeightToFirstAscent: false),
                          softWrap: false,
                        )),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
