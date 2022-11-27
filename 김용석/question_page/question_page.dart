import 'package:flutter/material.dart';

class QuestionPage extends StatefulWidget {
  const QuestionPage({Key? key}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("내용"),
                  /// 제목 작성 부분 ///
                  TextField(
                    decoration: InputDecoration(hintText: "제목을 입력하세요"),
                  ),
                  /// 내용 작성 부분 ///
                  TextField(
                    decoration: InputDecoration(hintText: "내용을 입력하세요"),
                  ),
                  Text("사진"),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.white)
                    ),
                    width: 100,
                    height: 100,
                    /// 사진 버튼 부분 ///
                    child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.camera))
                  )

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
                  '제출하기',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
