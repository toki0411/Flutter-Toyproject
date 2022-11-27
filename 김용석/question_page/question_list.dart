import 'package:flutter/material.dart';

class QuestionList extends StatefulWidget {
  const QuestionList({Key? key}) : super(key: key);

  @override
  State<QuestionList> createState() => _QuestionListState();
}

class _QuestionListState extends State<QuestionList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: -3,

        /// 뒤로가기 버튼 ///
        leading: Icon(
          Icons.arrow_back_sharp,
          color: Colors.black,
        ),
        centerTitle: true,
        title: Text(
          '1:1 문의',
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
      backgroundColor: const Color(0xffffffff),
      body: Center(
        child: Container(
          height: 600,
          width: 375,
          color: Colors.red,
          child: SingleChildScrollView(
            primary: false,
            child: Column(
              children: [
                Container(
                  height: 700,
                  color: Colors.green,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: 375,
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Center(
                                child: Text("Q"),
                              ),
                            ),

                            /// 질분 제목 및 내용 부분 ///
                            Container(
                              color: Colors.grey,
                              width: 350,
                              padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("왜 성별과 나이를 바꿀 수 없나요?"),
                                  Text("성별을 잘못 선택했는데 바꿀 수 없어서 답답하네요.. 좀 바꿔주세요")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                        width: 375,
                        color: Colors.blue,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CircleAvatar(
                              child: Center(
                                child: Text("A"),
                              ),
                            ),

                            /// 답변 내용 제목 및 내용 부분 ///
                            Container(
                              color: Colors.grey,
                              width: 350,
                              padding: EdgeInsets.fromLTRB(40, 0, 10, 0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("답변완료"),
                                  Text("감사합니다 해결 중입니다.")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      Container()
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),

      /// 하단 문의하기 버튼 ///
      bottomNavigationBar: Material(
        color: const Color(0xffff8906),
        child: InkWell(
          onTap: () {},
          child: const SizedBox(
            height: kToolbarHeight,
            width: double.infinity,
            child: Center(
              child: Text(
                '문의하기',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
