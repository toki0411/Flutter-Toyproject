import 'dart:ffi';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'editPage.dart';
import 'models/FireModel.dart';
import 'models/FireService.dart';
_DetailPageState? pageState;
class DetailPage extends StatefulWidget {
  final FireModel fireModel;
  DetailPage({Key? key, required this.fireModel}) : super(key: key);
  @override

  _DetailPageState createState() {
    pageState = _DetailPageState();
    return pageState!;
  }
}
class _DetailPageState extends State<DetailPage> {
  var name;
  var CreaterProfileImage;
  bool key = false;
  User? _user;
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  @override
  void initState() {
    _prepareService();
    getProfile();
  }
  void _prepareService() async {
    _user = await _firebaseAuth.currentUser!;
    if(_user?.uid==widget.fireModel.create){
      key = true;
    }
  }
  void getProfile() async{
    Query<Map<String, dynamic>>collectionReference= FirebaseFirestore.instance.collection("profile").where("uid", isEqualTo: '${widget.fireModel.create}');
    QuerySnapshot<Map<String, dynamic>> querySnapshot= await collectionReference.get();

    for(var doc in querySnapshot.docs){
      var data = doc.data();
      name = data['name'];
      CreaterProfileImage = data['image'];
    }
  }
  @override
  Widget build(BuildContext context) {
    final FireModel fireModel = widget.fireModel;
    ///키보드 올라올시 floating action button 아래위치
    final bool keyboardIsOpen = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
      appBar: (key==true)? AppBar(
        backgroundColor: const Color(0xffffffff),
        centerTitle: true,
        elevation: 0.0,
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
                      '모집완료',
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
                      '수정하기',
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
                    value: 2,
                    child: Text(
                      '삭제하기',
                      style: TextStyle(
                        fontFamily: 'Source Han Sans KR',
                        fontSize: 16,
                        color: const Color(0xffda565b),
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                ];
              },
              onSelected: (value) {
                if (value == 0) {  //모집완료
                  print("My account menu is selected.");
                } else if (value == 1) {  //수정
                  Navigator.of(context).push(MaterialPageRoute(builder: (_){
                    return EditPage(fireModel:fireModel);
                  }));
                } else if (value == 2) { //삭제
                      FireService().delFireModel(fireModel.reference!);
                      Navigator.of(context).pop(true);
                }
              }),
        ],
      ) : AppBar(
          backgroundColor: const Color(0xffffffff),
          centerTitle: true,
          elevation: 0.0,),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 375.0, middle: 0.5),
              Pin(start: 0.0, end: 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: SizedBox(
                  width: 375,
                  height: 1070,
                  child: Column(
                    children: [
                      ///사진 들어가는 부분 이미지
                      SizedBox(
                        width: 375,
                        height: 355,
                        child: Image(
                          fit: BoxFit.cover,
                          image: NetworkImage("${fireModel.image}"),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      ///상단 프로필 부분
                      SizedBox(
                        height: 120,
                        width: 355,
                        child: Column(
                          children: [
                            Row(
                              children: [
                                Expanded(
                                  child: Container(
                                    child: Row(
                                      children: [
                                        CircleAvatar(
                                          backgroundImage: NetworkImage('${CreaterProfileImage}'),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          '${name}',
                                          style: TextStyle(
                                            fontFamily: 'Source Han Sans KR',
                                            fontSize: 14,
                                            color: const Color(0xff535353),
                                            letterSpacing: -0.35000000000000003,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          softWrap: false,
                                        )
                                      ],
                                    ),
                                  ),
                                  flex: 3,
                                ),
                                Expanded(
                                  ///참여자 명단 부분
                                  child: Container(
                                    child: Text('참여자부분'),
                                  ),
                                  flex: 1,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                /// 타이틀 제목 부분
                                Container(
                                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    "${fireModel.title}",
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 16,
                                      color: const Color(0xff191919),
                                      letterSpacing: -0.4,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                ),
                                Container(
                                  ///날짜 및 인원부분
                                  child: Row(
                                    children: [
                                      ///날짜 부분
                                      Expanded(
                                        child: Text(
                                          "${fireModel.place}"+" · "+"${fireModel.date}",
                                          style: TextStyle(
                                            fontFamily: 'Source Han Sans KR',
                                            fontSize: 12,
                                            color: const Color(0xff767676),
                                            letterSpacing: -0.30000000000000004,
                                            fontWeight: FontWeight.w500,
                                          ),
                                          softWrap: false,
                                        ),
                                        flex: 6,
                                      ),

                                      ///사람 이미지 부분
                                      Expanded(
                                        child: Row(
                                          children: [
                                            SvgPicture.string(
                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6.020836353302002 5.817233562469482 C 5.192971706390381 5.817233562469482 4.515627384185791 5.54576301574707 3.988803863525391 5.002820491790771 C 3.461981058120728 4.459878921508789 3.198569297790527 3.761811017990112 3.198569297790527 2.908616781234741 C 3.198569297790527 2.05542254447937 3.461981058120728 1.357354402542114 3.988803863525391 0.8144126534461975 C 4.515627384185791 0.2714709043502808 5.192971706390381 0 6.020836353302002 0 C 6.848701477050781 0 7.526045322418213 0.2714709043502808 8.052868843078613 0.8144126534461975 C 8.579691886901855 1.357354402542114 8.843103408813477 2.05542254447937 8.843103408813477 2.908616781234741 C 8.843103408813477 3.761811017990112 8.579691886901855 4.459878921508789 8.052868843078613 5.002820491790771 C 7.526045322418213 5.54576301574707 6.848701477050781 5.817233562469482 6.020836353302002 5.817233562469482 M 0 12.04167366027832 L 0 10.21894073486328 C 0 9.727579116821289 0.1192878186702728 9.307573318481445 0.3574871718883514 8.958539962768555 C 0.5956864953041077 8.609505653381348 0.9031254649162292 8.344627380371094 1.279427647590637 8.163516998291016 C 2.119710683822632 7.77570104598999 2.925750255584717 7.484840393066406 3.697169542312622 7.290932655334473 C 4.468589305877686 7.097025871276855 5.243019580841064 7.000071048736572 6.020836353302002 7.000071048736572 C 6.798653125762939 7.000071048736572 7.570073127746582 7.100127696990967 8.33509635925293 7.300628662109375 C 9.100117683410645 7.501128673553467 9.903145790100098 7.788500785827637 10.74342918395996 8.163516998291016 C 11.13215065002441 8.344627380371094 11.44598579406738 8.609505653381348 11.68418502807617 8.958539962768555 C 11.92238521575928 9.307573318481445 12.041672706604 9.727579116821289 12.041672706604 10.21894073486328 L 12.041672706604 12.04167366027832 L 0 12.04167366027832 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                              allowDrawingOutsideViewBox: true,
                                              fit: BoxFit.fill,
                                            ),

                                            ///인원 부분
                                            Text(
                                              '${fireModel.people}'+"/"+'${fireModel.totalPeople}',
                                              style: TextStyle(
                                                fontFamily:
                                                'Source Han Sans KR',
                                                fontSize: 12,
                                                color: const Color(0xff767676),
                                                letterSpacing:
                                                -0.30000000000000004,
                                                fontWeight: FontWeight.w500,
                                              ),
                                              softWrap: false,
                                            )
                                          ],
                                        ),
                                        flex: 1,
                                      )
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),

                      ///상세페이지 내용 부분
                      Container(
                        height: 300,
                        width: 375,
                        padding: EdgeInsets.fromLTRB(12, 0, 12, 0),
                        child: Text(
                          "${fireModel.contents}",
                          style: TextStyle(
                            fontFamily: 'Source Han Sans KR',
                            fontSize: 14,
                            color: const Color(0xff191919),
                            letterSpacing: -0.35000000000000003,
                          ),
                          softWrap: false,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),

      ///하단 플로팅 하트(좋아요) 참여하기 버튼
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ///키보드 올라갈시 숨김
          Visibility(
            visible: !keyboardIsOpen,
            /// 좋아요 하트 버튼
            child: FloatingActionButton(
              child: Icon(
                Icons.favorite_border,
                color: Colors.black,
              ),
              onPressed: () {
                // Add your onPressed code here!
              },
              elevation: 0.0,
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(
            width: 270,
            height: 45,
            child: FittedBox(
              ///키보드 올라갈시 숨김
              child: Visibility(
                visible: !keyboardIsOpen,
                /// 참여하기 버튼
                child: FloatingActionButton.extended(
                  backgroundColor: Color(0xff1677ff),
                  elevation: 0.0,
                  onPressed: () {},
                  label: Padding(
                    padding: EdgeInsets.fromLTRB(95, 0, 95, 0),
                    child: Text(
                      '참여하기',
                      style: TextStyle(
                        fontFamily: 'Source Han Sans KR',
                        fontSize: 16,
                        color: const Color(0xffffffff),
                        letterSpacing: -0.4,
                        fontWeight: FontWeight.w500,
                      ),
                      softWrap: false,
                    ),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15.0))),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

const String _svg_s6nr5 =
    '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6.020836353302002 5.817233562469482 C 5.192971706390381 5.817233562469482 4.515627384185791 5.54576301574707 3.988803863525391 5.002820491790771 C 3.461981058120728 4.459878921508789 3.198569297790527 3.761811017990112 3.198569297790527 2.908616781234741 C 3.198569297790527 2.05542254447937 3.461981058120728 1.357354402542114 3.988803863525391 0.8144126534461975 C 4.515627384185791 0.2714709043502808 5.192971706390381 0 6.020836353302002 0 C 6.848701477050781 0 7.526045322418213 0.2714709043502808 8.052868843078613 0.8144126534461975 C 8.579691886901855 1.357354402542114 8.843103408813477 2.05542254447937 8.843103408813477 2.908616781234741 C 8.843103408813477 3.761811017990112 8.579691886901855 4.459878921508789 8.052868843078613 5.002820491790771 C 7.526045322418213 5.54576301574707 6.848701477050781 5.817233562469482 6.020836353302002 5.817233562469482 M 0 12.04167366027832 L 0 10.21894073486328 C 0 9.727579116821289 0.1192878186702728 9.307573318481445 0.3574871718883514 8.958539962768555 C 0.5956864953041077 8.609505653381348 0.9031254649162292 8.344627380371094 1.279427647590637 8.163516998291016 C 2.119710683822632 7.77570104598999 2.925750255584717 7.484840393066406 3.697169542312622 7.290932655334473 C 4.468589305877686 7.097025871276855 5.243019580841064 7.000071048736572 6.020836353302002 7.000071048736572 C 6.798653125762939 7.000071048736572 7.570073127746582 7.100127696990967 8.33509635925293 7.300628662109375 C 9.100117683410645 7.501128673553467 9.903145790100098 7.788500785827637 10.74342918395996 8.163516998291016 C 11.13215065002441 8.344627380371094 11.44598579406738 8.609505653381348 11.68418502807617 8.958539962768555 C 11.92238521575928 9.307573318481445 12.041672706604 9.727579116821289 12.041672706604 10.21894073486328 L 12.041672706604 12.04167366027832 L 0 12.04167366027832 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ggrbav =
    '<svg viewBox="24.0 68.0 21.0 14.0" ><path transform="translate(-462.37, 230.27)" d="M 507.3660278320312 -156.4385070800781 L 490.8345031738281 -156.4385070800781 L 495.010986328125 -160.6269989013672 L 493.3659973144531 -162.2720031738281 L 486.3660278320312 -155.2720031738281 L 493.3659973144531 -148.2720031738281 L 495.010986328125 -149.9169921875 L 490.8345031738281 -154.1054992675781 L 507.3660278320312 -154.1054992675781 L 507.3660278320312 -156.4385070800781 Z" fill="#191919" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_teq774 =
    '<svg viewBox="348.0 65.0 3.0 20.0" ><path transform="translate(326.4, 57.0)" d="M 23.09926795959473 28 C 22.68259620666504 28 22.32901954650879 27.8543758392334 22.03728485107422 27.56250190734863 C 21.74555397033691 27.2706241607666 21.60000038146973 26.9168758392334 21.60000038146973 26.5 C 21.60000038146973 26.08312606811523 21.74555397033691 25.72937774658203 22.03728485107422 25.43750190734863 C 22.32901954650879 25.1456241607666 22.68259620666504 25.00000190734863 23.09926795959473 25.00000190734863 C 23.51593971252441 25.00000190734863 23.86951637268066 25.1456241607666 24.1612491607666 25.43750190734863 C 24.45298194885254 25.72937774658203 24.59853363037109 26.08312606811523 24.59853363037109 26.5 C 24.59853363037109 26.9168758392334 24.45298194885254 27.2706241607666 24.1612491607666 27.56250190734863 C 23.86951637268066 27.8543758392334 23.51593971252441 28 23.09926795959473 28 Z M 23.09926795959473 19.5 C 22.68259620666504 19.5 22.32901954650879 19.35437774658203 22.03728485107422 19.0625 C 21.74555397033691 18.7706241607666 21.60000038146973 18.4168758392334 21.60000038146973 18.00000190734863 C 21.60000038146973 17.5831241607666 21.74555397033691 17.2293758392334 22.03728485107422 16.9375 C 22.32901954650879 16.64562606811523 22.68259620666504 16.5 23.09926795959473 16.5 C 23.51593971252441 16.5 23.86951637268066 16.64562606811523 24.1612491607666 16.9375 C 24.45298194885254 17.2293758392334 24.59853363037109 17.5831241607666 24.59853363037109 18.00000190734863 C 24.59853363037109 18.4168758392334 24.45298194885254 18.7706241607666 24.1612491607666 19.0625 C 23.86951637268066 19.35437774658203 23.51593971252441 19.5 23.09926795959473 19.5 Z M 23.09926795959473 11 C 22.68259620666504 11 22.32901954650879 10.85437488555908 22.03728485107422 10.5625 C 21.74555397033691 10.27062702178955 21.60000038146973 9.916874885559082 21.60000038146973 9.5 C 21.60000038146973 9.083125114440918 21.74555397033691 8.729374885559082 22.03728485107422 8.4375 C 22.32901954650879 8.145626068115234 22.68259620666504 8 23.09926795959473 8 C 23.51593971252441 8 23.86951637268066 8.145626068115234 24.1612491607666 8.4375 C 24.45298194885254 8.729374885559082 24.59853363037109 9.083125114440918 24.59853363037109 9.5 C 24.59853363037109 9.916874885559082 24.45298194885254 10.27062702178955 24.1612491607666 10.5625 C 23.86951637268066 10.85437488555908 23.51593971252441 11 23.09926795959473 11 Z" fill="#191919" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_cumdqe =
    '<svg viewBox="0.0 0.5 22.0 20.0" ><path transform="translate(0.0, 0.49)" d="M 11 20 L 9.872501373291016 18.99044990539551 C 7.929349899291992 17.22619438171387 6.324999332427979 15.70259189605713 5.059999942779541 14.42019176483154 C 3.795000076293945 13.13779067993164 2.786849975585938 11.99181461334229 2.035000085830688 10.98226451873779 C 1.28315007686615 9.972714424133301 0.7562499642372131 9.058663368225098 0.45374995470047 8.240109443664551 C 0.1512500047683716 7.421555042266846 0 6.593724727630615 0 5.757162570953369 C 0 4.120054244995117 0.5543999671936035 2.751432180404663 1.663750171661377 1.650750279426575 C 2.773099899291992 0.5500681400299072 4.143149852752686 -1.213235094610354e-07 5.775000095367432 -1.213235094610354e-07 C 6.819999217987061 -1.213235094610354e-07 7.786900043487549 0.2455660402774811 8.676249504089355 0.7366983890533447 C 9.56559944152832 1.227830767631531 10.33999919891357 1.937244057655334 11 2.864938497543335 C 11.76999855041504 1.882673978805542 12.58564949035645 1.159617900848389 13.44749927520752 0.6957707405090332 C 14.30935001373291 0.2319234907627106 15.23500061035156 -1.213235094610354e-07 16.22500038146973 -1.213235094610354e-07 C 17.85684967041016 -1.213235094610354e-07 19.22690200805664 0.5500681400299072 20.33624839782715 1.650750279426575 C 21.44560050964355 2.751432180404663 22 4.120054244995117 22 5.757162570953369 C 22 6.593724727630615 21.84875106811523 7.421555042266846 21.54625129699707 8.240109443664551 C 21.24375152587891 9.058663368225098 20.71685028076172 9.972714424133301 19.96500015258789 10.98226451873779 C 19.21314811706543 11.99181461334229 18.20499801635742 13.13779067993164 16.94000053405762 14.42019176483154 C 15.67500019073486 15.70259189605713 14.07065010070801 17.22619438171387 12.12750053405762 18.99044990539551 L 11 20 Z M 11 17.8444766998291 C 12.85185050964355 16.15279769897461 14.37809944152832 14.70231914520264 15.57875061035156 13.49249649047852 C 16.77939987182617 12.28267383575439 17.73309898376465 11.22346591949463 18.43875122070312 10.31377983093262 C 19.14439964294434 9.404092788696289 19.63940048217773 8.594816207885742 19.92374992370605 7.885402202606201 C 20.20809936523438 7.175988674163818 20.35000038146973 6.46657657623291 20.35000038146973 5.757162570953369 C 20.35000038146973 4.556617259979248 19.96500015258789 3.56998610496521 19.19499969482422 2.796725511550903 C 18.42500114440918 2.023465156555176 17.43500137329102 1.637107849121094 16.22500038146973 1.637107849121094 C 15.28999996185303 1.637107849121094 14.41934967041016 1.923601508140564 13.61250019073486 2.496588945388794 C 12.80565071105957 3.069576740264893 12.15499973297119 3.874488115310669 11.66000080108643 4.911323547363281 L 10.3125 4.911323547363281 C 9.835649490356445 3.892496585845947 9.19434928894043 3.092496156692505 8.387499809265137 2.510231971740723 C 7.580649375915527 1.927967190742493 6.710000038146973 1.637107849121094 5.775000095367432 1.637107849121094 C 4.565000057220459 1.637107849121094 3.575000047683716 2.023465156555176 2.804999828338623 2.796725511550903 C 2.035000085830688 3.56998610496521 1.649999976158142 4.556617259979248 1.649999976158142 5.757162570953369 C 1.649999976158142 6.46657657623291 1.791899800300598 7.180355072021484 2.076250076293945 7.899044990539551 C 2.360599756240845 8.617734909057617 2.855599880218506 9.436288833618164 3.561249971389771 10.35470676422119 C 4.266900062561035 11.27312469482422 5.225000381469727 12.33287906646729 6.434999942779541 13.53342437744141 C 7.644999980926514 14.73396968841553 9.166850090026855 16.17080497741699 11 17.8444766998291" fill="#535353" stroke="none" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';