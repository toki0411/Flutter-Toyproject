import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:jiffy/jiffy.dart';

import 'models/RegisterModel.dart';
import 'models/RegisterService.dart';

class EventPage extends StatefulWidget {
  final String user;

  const EventPage({Key? key, required this.user}) : super(key: key);

  @override
  State<EventPage> createState() => _EventPageState();
}

class _EventPageState extends State<EventPage> {

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
            child: Column(
              children: [
                SizedBox(
                    height: 1000,
                    child: FutureBuilder<List<RegisterModel>>(
                        future: RegisterService().getRegisterModel(widget.user),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<RegisterModel> datas = snapshot.data!;
                            return ListView.builder(
                                itemCount: datas.length,
                                itemBuilder: (BuildContext context, int index) {
                                  RegisterModel data = datas[index];
                                  DateTime? _time = DateTime.tryParse(data.dateAt.toDate().toString());
                                  String _txt = Jiffy(_time).fromNow();
                                  Jiffy.locale('ko');
                                  String _topic=""; String _sentence="";

                                  if(data.from==widget.user && data.curstate==1){
                                    _topic="참여 수락";
                                    _sentence="참여 요청이 수락되었습니다. \n채팅에 참여해주세요!";
                                  }
                                  else if(data.from==widget.user && data.curstate==2){
                                    _topic="참여 반려";
                                    _sentence="참여 요청이 수락되지 않았습니다.";
                                  }
                                  else if(data.to==widget.user && data.curstate==0){
                                    _topic="참여 요청";
                                    _sentence="참여 요청이 도착했습니다.";
                                  }
                                  return SizedBox(
                                      width: double.infinity,
                                      height: 95,
                                      child: InkWell(
                                          child: Stack(children: <Widget>[
                                        Container(
                                            width: double.infinity,
                                            color: const Color(0xfff5fafe),
                                            height: 95,
                                            child: Container(
                                              padding: EdgeInsets.all(20),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      /// 참여요청  ///
                                                      Text(
                                                        _topic,
                                                        style: TextStyle(
                                                          fontFamily:
                                                              'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(
                                                              0xff848484),
                                                          letterSpacing:
                                                              -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),

                                                      /// 방금전 ///
                                                      Text(
                                                        '${_txt}',
                                                          style: TextStyle(
                                                          fontFamily:
                                                              'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(
                                                              0xff707070),
                                                          letterSpacing:
                                                              -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ],
                                                  ),

                                                  /// 요청 도착문 //
                                                  Text.rich(
                                                    TextSpan(
                                                      style: TextStyle(
                                                        fontFamily:
                                                            'Source Han Sans KR',
                                                        fontSize: 14,
                                                        color: const Color(
                                                            0xff191919),
                                                        letterSpacing:
                                                            -0.35000000000000003,
                                                      ),

                                                      /// 부산국제 페스티벌 //
                                                      children: [
                                                        TextSpan(
                                                          text: '${data.title}',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight.w600,
                                                          ),
                                                        ),

                                                        /// 참여요청이 도착하였습니다. ///
                                                        TextSpan(
                                                          text:
                                                              _sentence,
                                                        ),
                                                      ],
                                                    ),
                                                    textHeightBehavior:
                                                        TextHeightBehavior(
                                                            applyHeightToFirstAscent:
                                                                false),
                                                    softWrap: false,
                                                  )
                                                ],
                                              ),
                                            )),
                                      ])));
                                });
                          }else {
                            return const Center(child: CircularProgressIndicator());
                          }
                        }))
              ],
            ),
          ),
        ));
  } //widget
} //class
