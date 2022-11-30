import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/RegisterModel.dart';
import 'models/RegisterService.dart';

class EventPage2 extends StatefulWidget {
  final String user;
  const EventPage2({Key? key, required this.user}) : super(key: key);
  @override
  State<EventPage2> createState() => _EventPage2State();
}

class _EventPage2State extends State<EventPage2> {
  var name;
  var CreaterProfileImage;
  void getProfile(dynamic uid) async{
    Query<Map<String, dynamic>>collectionReference= FirebaseFirestore.instance.collection("profile").where("uid", isEqualTo: '${uid}');
    QuerySnapshot<Map<String, dynamic>> querySnapshot= await collectionReference.get();

    for(var doc in querySnapshot.docs){
      var data = doc.data();
      name = data['name'];
      CreaterProfileImage = data['image'];
    }
  }

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
          '참여요청',
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
                      future: RegisterService().getRegisterModelCreateByMe(widget.user),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          List<RegisterModel> datas = snapshot.data!;
                          return ListView.builder(
                              itemCount: datas.length,
                              itemBuilder: (BuildContext context, int index) {
                                RegisterModel data = datas[index];

                                /// 알림 영역 부분 ///
                                return SizedBox(
                                    width: double.infinity,
                                    height: 212,
                                    child: Container(
                                      padding: EdgeInsets.fromLTRB(
                                          30, 20, 30, 20),
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment
                                            .start,
                                        mainAxisAlignment: MainAxisAlignment
                                            .spaceEvenly,
                                        children: [
                                          Row(
                                            children: [
                                              /// 프로필사진부분 ///
                                              CircleAvatar(backgroundImage: NetworkImage('${data.fromprofileimage}'),),
                                              SizedBox(
                                                width: 20,
                                              ),
                                              /// 이름 부분 ///
                                              Text(
                                                '${data.fromname}',
                                                style: TextStyle(
                                                  fontFamily: 'Source Han Sans KR',
                                                  fontSize: 14,
                                                  color: const Color(
                                                      0xff535353),
                                                  letterSpacing: -0.35000000000000003,
                                                  fontWeight: FontWeight.w500,
                                                ),
                                                softWrap: false,
                                              )
                                            ],
                                          ),

                                          /// 요청 도착문 //
                                          Text(
                                            '${data.title}',
                                            style: TextStyle(
                                              fontFamily: 'Source Han Sans KR',
                                              fontSize: 16,
                                              color: const Color(0xff191919),
                                              letterSpacing: -0.4,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            softWrap: false,
                                          ),
                                          Text(
                                            '${data.contents}',
                                            style: TextStyle(
                                              fontFamily: 'Source Han Sans KR',
                                              fontSize: 16,
                                              color: const Color(0xff191919),
                                              letterSpacing: -0.4,
                                            ),
                                            softWrap: false,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment
                                                .spaceBetween,
                                            children: [
                                              SizedBox(
                                                height: 42,
                                                width: 158,
                                                child: OutlinedButton(
                                                    onPressed: (){
                                                      RegisterModel updateModel = RegisterModel(
                                                          curstate: 2,
                                                          reference: data.reference!,
                                                          contents: data.contents,
                                                          from : data.from,
                                                          to : data.to,
                                                          title: data.title,
                                                          fromprofileimage: data.fromprofileimage,
                                                          fromname:data.fromname,
                                                      );
                                                      RegisterService().updateRegisterModel(reference: data.reference!, json: updateModel.toJson());
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                        side: BorderSide(
                                                            color: const Color(
                                                                0xff1677ff),
                                                            width: 1.0
                                                        ),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    10)))),
                                                    child: Text(
                                                      '거절하기',
                                                      style: TextStyle(
                                                        fontFamily: 'Source Han Sans KR',
                                                        fontSize: 16,
                                                        color: const Color(
                                                            0xff1677ff),
                                                        letterSpacing: -0.4,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                      ),
                                                      softWrap: false,
                                                    )),
                                              ),
                                              SizedBox(
                                                height: 42,
                                                width: 158,
                                                child: OutlinedButton(
                                                    onPressed: () {
                                                      RegisterModel updateModel = RegisterModel(
                                                          curstate: 1,
                                                          reference: data.reference!,
                                                        contents: data.contents,
                                                        from : data.from,
                                                        to : data.to,
                                                        title: data.title,
                                                        fromprofileimage: data.fromprofileimage,
                                                        fromname:data.fromname,
                                                      );
                                                      RegisterService().updateRegisterModel(reference: data.reference!, json: updateModel.toJson());
                                                    },
                                                    style: OutlinedButton
                                                        .styleFrom(
                                                        backgroundColor: Color(
                                                            0xff1677ff),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius
                                                                .all(
                                                                Radius.circular(
                                                                    10)))),
                                                    child: Text(
                                                      '수락하기',
                                                      style: TextStyle(
                                                        fontFamily: 'Source Han Sans KR',
                                                        fontSize: 16,
                                                        color: const Color(
                                                            0xffffffff),
                                                        letterSpacing: -0.4,
                                                        fontWeight: FontWeight
                                                            .w500,
                                                      ),
                                                      softWrap: false,
                                                    )),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    )
                                );
                              }
                          );
                        }else {
                          return const Center(child: CircularProgressIndicator());
                        }
                      })
    )
    ],
              ),
            ),
          )
            );


  }
}