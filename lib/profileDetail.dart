import 'package:blackup/postList.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/svg.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';

import 'models/FireModel.dart';
import 'models/FireService.dart';
import 'models/RegisterModel.dart';
import 'models/RegisterService.dart';
import 'models/profileModel.dart';

class ProfileDetail extends StatefulWidget {
  final String user;

  const ProfileDetail({Key? key, required this.user}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  void initState() {
    super.initState();
    _prepareService();
  }

  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  var name, image, gender, age, introduce, uid;
  var facebook, instagram, naverblog, twitter;

  void _prepareService() async {
    _user = await _firebaseAuth.currentUser!;
    Query<Map<String, dynamic>> collectionReference = FirebaseFirestore.instance
        .collection("profile")
        .where("uid", isEqualTo: '${widget.user}');
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await collectionReference.get();
    for (var doc in querySnapshot.docs) {
      var data = doc.data();
      name = data['name'];
      image = data['image'];
      age = data['age'];
      introduce = data['introduce'];
      uid = data['uid'];
      facebook = data['facebook'];
      instagram = data['instagram'];
      naverblog = data['naverblog'];
      twitter = data['twitter'];
      if (data['gender'] == "man") {
        gender = "남자";
      } else if (data['gender'] == "woman") {
        gender = "여자";
      }
    }
    setState(() {});
  }

  void _URL(String url) async {
    if (await canLaunchUrlString(url)) {
      await launchUrlString(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  /// PageView Page 컨트롤 ///
  final PageController _pageController = PageController();

  /// 신고하기 TextField  알림 창 부분 ///
  openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
            title: Text("신고하기"),
            content: TextField(
              decoration: InputDecoration(hintText: "신고사유를 입력해 주세요"),
            ),
            actions: [TextButton(onPressed: () {}, child: Text("제출"))],
          ));

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //final ProfileModel profileModel = widget.profileModel;
    return Scaffold(
      appBar: AppBar(
        shape: Border(bottom: BorderSide(color: const Color(0xff101010))),
        titleSpacing: -3,

        /// 뒤로가기 버튼 ///
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
                      child: TextButton(
                          onPressed: () {
                            openDialog();
                          },
                          child: Text("신고하기"))),
                ];
              },
              onSelected: (value) {
                if (value == 0) {
                  print("My account menu is selected.");
                }
              }),
        ],
        centerTitle: true,
        title: Text(
          '설정',
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
      body: Pinned.fromPins(
        Pin(size: 375.0, middle: 0.5),
        Pin(start: 10.0, end: 10.0),
        child: Container(
          width: 375,
          height: 600,
          color: Colors.orange,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// 프로필 사진 및 인스타,페이스북,트위터등 버튼 부분 ///
              Container(
                  color: Colors.green,
                  width: 375,
                  height: 80,
                  child: Stack(
                    children: [
                      Positioned(
                          child: SizedBox(
                              width: 60,
                              height: 80,

                              /// 프로필 사진 부분 //
                              child: CircleAvatar(
                                backgroundImage: NetworkImage('${image}'),
                              ))),
                      Positioned(
                          left: 180,
                          bottom: -3,
                          child: SizedBox(
                            width: 300,
                            height: 40,
                            child: Row(
                              /// 버튼 부분 ///
                              children: [
                                IconButton(
                                  onPressed: () {
                                    _URL(instagram);
                                  },
                                  icon: Icon(Icons.abc),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _URL(facebook);
                                  },
                                  icon: Icon(Icons.abc),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _URL(twitter);
                                  },
                                  icon: Icon(Icons.abc),
                                ),
                                IconButton(
                                  onPressed: () {
                                    _URL(naverblog);
                                  },
                                  icon: Icon(Icons.abc),
                                )
                              ],
                            ),
                          ))
                    ],
                  )),

              /// 이름 및 나이 부분 ///
              Container(
                width: 375,
                height: 50,
                color: Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('${name}'),
                    Text('${gender}' + " . " + '${age}' + "세")
                  ],
                ),
              ),

              /// 자기 소개 부분 ///
              Container(
                width: 375,
                height: 70,
                color: Colors.grey,
                child: Text('${introduce}'),
              ),

              /// 적상한글, 참여중, 참여완료 버튼 ///
              Container(
                width: 375,
                height: 50,
                color: Colors.purple,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    TextButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(0,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: Text("작성한글"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(1,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: Text("참여중"),
                    ),
                    TextButton(
                      onPressed: () {
                        if (_pageController.hasClients) {
                          _pageController.animateToPage(2,
                              duration: const Duration(milliseconds: 400),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: Text("참여 완료"),
                    )
                  ],
                ),
              ),
              Container(
                  width: 375,
                  height: 370,
                  color: Colors.grey,
                  child: PageView(
                    controller: _pageController,
                    children: [
                      SingleChildScrollView(
                        /// 작성한 글 페이지 부분 ///
                        child: Container(
                          width: 375,
                          height: 500,
                          color: Colors.red,
                          child: Column(
                            children: [
                              Container(
                                  width: 375,
                                  height: 100,
                                  color: Colors.blue,
                                  child: FutureBuilder<List<FireModel>>(
                                      future: FireService()
                                          .getFireModelCreateByMe(widget.user),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          List<FireModel> datas =
                                              snapshot.data!;
                                          return ListView.builder(
                                              itemCount: datas.length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                FireModel data = datas[index];

                                                /// 알림 영역 부분 ///
                                                return SizedBox(
                                                  child: Stack(
                                                    children: [
                                                      /// 이미지 부분 ///
                                                      Positioned(
                                                        child: Container(
                                                          child: ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            child: Image(
                                                              image: NetworkImage(
                                                                  '${data.image}'),
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                      Positioned(
                                                          left: 100,
                                                          child: Container(
                                                            width: 200,
                                                            height: 90,
                                                            color: Colors.grey,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                /// 타이틀 ///
                                                                Text(
                                                                    '${data.title}'),

                                                                /// 날짜 ///
                                                                Text(
                                                                    '${data.date}'),
                                                                Row(
                                                                  children: [
                                                                    /// 여자 ///
                                                                    Text("여자"),

                                                                    /// 남자 ///
                                                                    Text("남자")
                                                                  ],
                                                                ),

                                                                /// 인원 부분 ///
                                                                Text('${data.people}' +
                                                                    "/" +
                                                                    '${data.totalPeople}')
                                                              ],
                                                            ),
                                                          ))
                                                    ],
                                                  ),
                                                );
                                              });
                                        } else {
                                          return const Center(
                                              child:
                                                  CircularProgressIndicator());
                                        }
                                      }))
                            ],
                          ),
                        ),
                      ),

                                  SingleChildScrollView(
                                    /// 작성한 글 페이지 부분 ///

                                    /// 변경된 컨테이너 부분
                                    child: Container(
                                      width: 375,
                                      height: 500,
                                      color: Colors.red,
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 375,
                                              height: 100,
                                              color: Colors.blue,
                                              child: FutureBuilder<
                                                      List<FireModel>>(
                                                  future: FireService()
                                                      .getFireModelParticipating(
                                                          widget.user),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      List<FireModel> datas =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                          itemCount:
                                                              datas.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            FireModel data =
                                                                datas[index];

                                                            /// 알림 영역 부분 ///
                                                            return SizedBox(
                                                              child: Stack(
                                                                children: [
                                                                  /// 이미지 부분 ///
                                                                  Positioned(
                                                                    child: Container(
                                                                      child: ClipRRect(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            10),
                                                                        child: Image(
                                                                          image: NetworkImage(
                                                                              '${data.image}'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                      left: 100,
                                                                      child: Container(
                                                                        width: 200,
                                                                        height: 90,
                                                                        color: Colors.grey,
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                          children: [
                                                                            /// 타이틀 ///
                                                                            Text(
                                                                                '${data.title}'),

                                                                            /// 날짜 ///
                                                                            Text(
                                                                                '${data.date}'),
                                                                            Row(
                                                                              children: [
                                                                                /// 여자 ///
                                                                                Text("여자"),

                                                                                /// 남자 ///
                                                                                Text("남자")
                                                                              ],
                                                                            ),

                                                                            /// 인원 부분 ///
                                                                            Text('${data.people}' +
                                                                                "/" +
                                                                                '${data.totalPeople}')
                                                                          ],
                                                                        ),
                                                                      ))
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    } else {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  }))
                                        ],
                                      ),
                                    ),
                                  ),
                                  SingleChildScrollView(
                                    /// 참야완료 페이지 부분 ///
                                    child: Container(
                                      width: 375,
                                      height: 500,
                                      color: Colors.red,
                                      child: Column(
                                        children: [
                                          Container(
                                              width: 375,
                                              height: 100,
                                              color: Colors.blue,
                                              child: FutureBuilder<
                                                      List<FireModel>>(
                                                  future: FireService()
                                                      .getFireModelParticipated(
                                                          widget.user),
                                                  builder: (context, snapshot) {
                                                    if (snapshot.hasData) {
                                                      List<FireModel> datas =
                                                          snapshot.data!;
                                                      return ListView.builder(
                                                          itemCount:
                                                              datas.length,
                                                          itemBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  int index) {
                                                            FireModel data =
                                                                datas[index];

                                                            /// 알림 영역 부분 ///
                                                            return SizedBox(
                                                              child: Stack(
                                                                children: [
                                                                  /// 이미지 부분 ///
                                                                  Positioned(
                                                                    child: Container(
                                                                      child: ClipRRect(
                                                                        borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                            10),
                                                                        child: Image(
                                                                          image: NetworkImage(
                                                                              '${data.image}'),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                      left: 100,
                                                                      child: Container(
                                                                        width: 200,
                                                                        height: 90,
                                                                        color: Colors.grey,
                                                                        child: Column(
                                                                          crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                          children: [
                                                                            /// 타이틀 ///
                                                                            Text(
                                                                                '${data.title}'),

                                                                            /// 날짜 ///
                                                                            Text(
                                                                                '${data.date}'),
                                                                            Row(
                                                                              children: [
                                                                                /// 여자 ///
                                                                                Text("여자"),

                                                                                /// 남자 ///
                                                                                Text("남자")
                                                                              ],
                                                                            ),

                                                                            /// 인원 부분 ///
                                                                            Text('${data.people}' +
                                                                                "/" +
                                                                                '${data.totalPeople}')
                                                                          ],
                                                                        ),
                                                                      ))
                                                                ],
                                                              ),
                                                            );
                                                          });
                                                    } else {
                                                      return const Center(
                                                          child:
                                                              CircularProgressIndicator());
                                                    }
                                                  }))
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              )
              )
                    ],
                  ))

          ),
        );
  }
}
