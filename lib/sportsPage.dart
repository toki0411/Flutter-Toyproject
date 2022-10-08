import 'package:blackup/anotherPage.dart';
import 'package:blackup/culturePage.dart';
import 'package:blackup/mainPagetest.dart';
import 'package:blackup/postList.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'models/FireModel.dart';
import 'models/FireService.dart';

class SportsPage extends StatefulWidget {
  const SportsPage({Key? key}) : super(key: key);

  @override
  State<SportsPage> createState() => _SportsPageState();
}

class _SportsPageState extends State<SportsPage> {
  final PageController _pageController = PageController();

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  final PageController _sportsCategoriesController = PageController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      ///**상단 AppBar  및 패이지 이동 버튼 **///
        appBar: AppBar(
            backgroundColor: const Color(0xffffffff),
            centerTitle: true,
            title: Text(
              'CREW',
              style:
              TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
            ),
            elevation: 0.0,
            actions: [
              IconButton(icon: Icon(Icons.search), onPressed: null),
              IconButton(icon: Icon(Icons.notifications), onPressed: null),
            ],
            bottom: PreferredSize(
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ///** 전체 페이지 부분 *//
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => MainPagetest()),
                        );
                      },
                      child: const Text(
                        '전체',
                        style: TextStyle(
                          fontFamily: 'Source Han Sans KR',
                          fontSize: 16,
                          color: const Color(0xff767676),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    ///** 문화예술 페이지 부분 *//
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => CulturePage()),
                        );
                      },
                      child: const Text(
                        '문화예술',
                        style: TextStyle(
                          fontFamily: 'Source Han Sans KR',
                          fontSize: 16,
                          color: const Color(0xff767676),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    ///** 스포츠 페이지 부분 *//
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => SportsPage()),
                        );
                      },
                      child: const Text(
                        '스포츠',
                        style: TextStyle(
                          fontFamily: 'Source Han Sans KR',
                          fontSize: 16,
                          color: const Color(0xff767676),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),

                    ///** 기타 페이지 부분 *//
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AnotherPage()),
                        );
                      },
                      child: const Text(
                        '기타',
                        style: TextStyle(
                          fontFamily: 'Source Han Sans KR',
                          fontSize: 16,
                          color: const Color(0xff767676),
                          letterSpacing: -0.4,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              preferredSize: Size.fromHeight(50),
            )),

        ///** 하단 AppBar **/
        bottomNavigationBar: BottomAppBar(
          child: new Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              IconButton(
                icon: SvgPicture.string(
                  '<svg viewBox="40.0 725.0 19.0 20.0" ><path transform="translate(-38.51, 893.1)" d="M 88.239501953125 -168.1020050048828 L 78.50900268554688 -161.54150390625 L 78.50900268554688 -148.1020050048828 L 85.29450225830078 -148.1020050048828 L 85.29450225830078 -156.0825042724609 L 90.72299957275391 -156.0825042724609 L 90.72299957275391 -148.1020050048828 L 97.50900268554688 -148.1020050048828 L 97.50900268554688 -161.8569946289062 L 88.239501953125 -168.1020050048828 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.string(
                  '<svg viewBox="0.0 0.0 20.0 20.0" ><path transform="translate(0.0, 0.0)" d="M 18.77778053283691 20.00000190734863 L 11.47222328186035 12.6944465637207 C 10.91666793823242 13.17611312866211 10.26833534240723 13.55111312866211 9.527778625488281 13.8194465637207 C 8.787222862243652 14.08778095245361 8.000000953674316 14.22222423553467 7.166667938232422 14.22222423553467 C 5.166667938232422 14.22222423553467 3.472222566604614 13.52778053283691 2.083333730697632 12.13889122009277 C 0.6944445371627808 10.75000190734863 0 9.073890686035156 0 7.111112117767334 C 0 5.14833402633667 0.6944445371627808 3.472222566604614 2.083333730697632 2.083333730697632 C 3.472222566604614 0.6944445371627808 5.157222747802734 3.320830543884767e-08 7.138889789581299 3.320830543884767e-08 C 9.101667404174805 3.320830543884767e-08 10.77333450317383 0.6944445371627808 12.15278053283691 2.083333730697632 C 13.53222465515137 3.472222566604614 14.22222423553467 5.14833402633667 14.22222423553467 7.111112117767334 C 14.22222423553467 7.907223224639893 14.09278106689453 8.676113128662109 13.83333492279053 9.416668891906738 C 13.57389068603516 10.15722465515137 13.18500137329102 10.85166835784912 12.66666793823242 11.50000286102295 L 20.00000190734863 18.77778053283691 L 18.77778053283691 20.00000190734863 Z M 7.138889789581299 12.55555725097656 C 8.638890266418457 12.55555725097656 9.916667938232422 12.02333545684814 10.97222423553467 10.95833587646484 C 12.02777862548828 9.893335342407227 12.55555725097656 8.611111640930176 12.55555725097656 7.111112117767334 C 12.55555725097656 5.611112594604492 12.02777862548828 4.3288893699646 10.97222423553467 3.263889074325562 C 9.916667938232422 2.198889255523682 8.638890266418457 1.666666865348816 7.138889789581299 1.666666865348816 C 5.620555877685547 1.666666865348816 4.3288893699646 2.198889255523682 3.263889312744141 3.263889074325562 C 2.198889255523682 4.3288893699646 1.666666865348816 5.611112594604492 1.666666865348816 7.111112117767334 C 1.666666865348816 8.611111640930176 2.198889255523682 9.893335342407227 3.263889312744141 10.95833587646484 C 4.3288893699646 12.02333545684814 5.620555877685547 12.55555725097656 7.138889789581299 12.55555725097656" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.string(
                  '<svg viewBox="0.0 0.0 20.0 20.0" ><path  d="M 9.324999809265137 15 L 10.82499980926514 15 L 10.82499980926514 10.85000038146973 L 15 10.85000038146973 L 15 9.350000381469727 L 10.82499980926514 9.350000381469727 L 10.82499980926514 5 L 9.324999809265137 5 L 9.324999809265137 9.350000381469727 L 5 9.350000381469727 L 5 10.85000038146973 L 9.324999809265137 10.85000038146973 L 9.324999809265137 15 Z M 10 20 C 8.633500099182129 20 7.341499805450439 19.73749923706055 6.125 19.21249961853027 C 4.908500194549561 18.6875 3.845999956130981 17.97100067138672 2.9375 17.0625 C 2.029000043869019 16.15399932861328 1.3125 15.0915002822876 0.7875000238418579 13.875 C 0.262499988079071 12.6584997177124 0 11.35849952697754 0 9.975000381469727 C 0 8.608499526977539 0.262499988079071 7.316500186920166 0.7875000238418579 6.099999904632568 C 1.3125 4.883500099182129 2.029000043869019 3.825000047683716 2.9375 2.924999952316284 C 3.845999956130981 2.025000095367432 4.908500194549561 1.3125 6.125 0.7875000238418579 C 7.341499805450439 0.262499988079071 8.641500473022461 0 10.02499961853027 0 C 11.39150047302246 0 12.68350028991699 0.262499988079071 13.89999961853027 0.7875000238418579 C 15.11649990081787 1.3125 16.17499923706055 2.025000095367432 17.07500076293945 2.924999952316284 C 17.97500038146973 3.825000047683716 18.6875 4.883500099182129 19.21249961853027 6.099999904632568 C 19.73749923706055 7.316500186920166 20 8.616499900817871 20 10 C 20 11.36649990081787 19.73749923706055 12.6584997177124 19.21249961853027 13.875 C 18.6875 15.0915002822876 17.97500038146973 16.15399932861328 17.07500076293945 17.0625 C 16.17499923706055 17.97100067138672 15.11649990081787 18.6875 13.89999961853027 19.21249961853027 C 12.68350028991699 19.73749923706055 11.38350009918213 20 10 20 M 10.02499961853027 18.5 C 12.375 18.5 14.375 17.67099952697754 16.02499961853027 16.01250076293945 C 17.67499923706055 14.35400009155273 18.5 12.3415002822876 18.5 9.975000381469727 C 18.5 7.625 17.67499923706055 5.625 16.02499961853027 3.974999904632568 C 14.375 2.325000047683716 12.36649990081787 1.5 10 1.5 C 7.650000095367432 1.5 5.645999908447266 2.325000047683716 3.987499952316284 3.974999904632568 C 2.328999996185303 5.625 1.5 7.633500099182129 1.5 10 C 1.5 12.35000038146973 2.328999996185303 14.35400009155273 3.987499952316284 16.01250076293945 C 5.645999908447266 17.67099952697754 7.658500194549561 18.5 10.02499961853027 18.5" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.string(
                  '<svg viewBox="0.0 0.0 20.0 20.0" ><path  d="M 4 12.02499961853027 L 11.82499980926514 12.02499961853027 L 11.82499980926514 10.52499961853027 L 4 10.52499961853027 L 4 12.02499961853027 Z M 4 8.774999618530273 L 16 8.774999618530273 L 16 7.275000095367432 L 4 7.275000095367432 L 4 8.774999618530273 Z M 4 5.525000095367432 L 16 5.525000095367432 L 16 4.025000095367432 L 4 4.025000095367432 L 4 5.525000095367432 Z M 0 20 L 0 1.5 C 0 1.116500020027161 0.1500000059604645 0.7710000276565552 0.449999988079071 0.4625000059604645 C 0.75 0.153999999165535 1.100000023841858 0 1.5 0 L 18.5 0 C 18.88349914550781 0 19.22900009155273 0.153999999165535 19.53750038146973 0.4625000059604645 C 19.84600067138672 0.7710000276565552 20 1.116500020027161 20 1.5 L 20 14.5 C 20 14.88350009918213 19.84600067138672 15.22900009155273 19.53750038146973 15.53750038146973 C 19.22900009155273 15.8459997177124 18.88349914550781 16 18.5 16 L 4 16 L 0 20 Z M 1.5 16.375 L 3.375 14.5 L 18.5 14.5 L 18.5 1.5 L 1.5 1.5 L 1.5 16.375 Z M 1.5 1.5 L 1.5 16.375 L 1.5 1.5 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: SvgPicture.string(
                  '<svg viewBox="0.0 0.0 19.0 19.0" ><path transform="translate(0.0, 0.0)" d="M 9.5 9.178744316101074 C 8.193750381469727 9.178744316101074 7.125 8.750402450561523 6.293750286102295 7.893719673156738 C 5.462500095367432 7.037036895751953 5.046875 5.935587406158447 5.046875 4.589372158050537 C 5.046875 3.243156433105469 5.462500095367432 2.141706943511963 6.293750286102295 1.285024166107178 C 7.125 0.4283413887023926 8.193750381469727 0 9.5 0 C 10.80625057220459 0 11.875 0.4283413887023926 12.70625019073486 1.285024166107178 C 13.53749942779541 2.141706943511963 13.953125 3.243156433105469 13.953125 4.589372158050537 C 13.953125 5.935587406158447 13.53749942779541 7.037036895751953 12.70625019073486 7.893719673156738 C 11.875 8.750402450561523 10.80625057220459 9.178744316101074 9.5 9.178744316101074 M 0 19 L 0 16.12399291992188 C 0 15.34869575500488 0.1882187575101852 14.68599033355713 0.5640624761581421 14.13526630401611 C 0.9399062395095825 13.58454132080078 1.425000071525574 13.16660213470459 2.018749952316284 12.88083648681641 C 3.34459376335144 12.2689208984375 4.616406440734863 11.809983253479 5.833593845367432 11.50402545928955 C 7.05078125 11.19806671142578 8.27271842956543 11.04508781433105 9.5 11.04508781433105 C 10.72728061676025 11.04508781433105 11.9444694519043 11.20296382904053 13.15156269073486 11.51932430267334 C 14.35865688323975 11.83568382263184 15.62571811676025 12.2891149520874 16.95156288146973 12.88083648681641 C 17.56490707397461 13.16660213470459 18.06009292602539 13.58454132080078 18.43593788146973 14.13526630401611 C 18.81178092956543 14.68599033355713 19 15.34869575500488 19 16.12399291992188 L 19 19 L 0 19 Z M 1.78125 17.16425132751465 L 17.21875 17.16425132751465 L 17.21875 16.12399291992188 C 17.21875 15.79784202575684 17.12493705749512 15.48637676239014 16.93671798706055 15.19082164764404 C 16.74850082397461 14.89526462554932 16.51634407043457 14.67558765411377 16.23906326293945 14.5330114364624 C 14.97259330749512 13.90090179443359 13.81478118896484 13.4670524597168 12.765625 13.23268890380859 C 11.71646881103516 12.99832534790039 10.62812519073486 12.88083648681641 9.5 12.88083648681641 C 8.371874809265137 12.88083648681641 7.2734375 12.99832534790039 6.204687595367432 13.23268890380859 C 5.135937213897705 13.4670524597168 3.978124856948853 13.90090179443359 2.731250047683716 14.5330114364624 C 2.45396876335144 14.67558765411377 2.2265625 14.89526462554932 2.048437595367432 15.19082164764404 C 1.870312571525574 15.48637676239014 1.78125 15.79784202575684 1.78125 16.12399291992188 L 1.78125 17.16425132751465 Z M 9.5 7.342995166778564 C 10.27187442779541 7.342995166778564 10.91015625 7.082930564880371 11.41484355926514 6.562802314758301 C 11.91953182220459 6.042673110961914 12.171875 5.384863376617432 12.171875 4.589372158050537 C 12.171875 3.793880701065063 11.91953182220459 3.136070728302002 11.41484355926514 2.615942001342773 C 10.91015625 2.095813035964966 10.27187442779541 1.835748791694641 9.5 1.835748791694641 C 8.728124618530273 1.835748791694641 8.08984375 2.095813035964966 7.585155963897705 2.615942001342773 C 7.080468654632568 3.136070728302002 6.828125 3.793880701065063 6.828125 4.589372158050537 C 6.828125 5.384863376617432 7.080468654632568 6.042673110961914 7.585155963897705 6.562802314758301 C 8.08984375 7.082930564880371 8.728124618530273 7.342995166778564 9.5 7.342995166778564" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                  allowDrawingOutsideViewBox: true,
                  fit: BoxFit.fill,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
        backgroundColor: const Color(0xffffffff),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child:///** 스포츠 페이지 *//
          Pinned.fromPins(
            Pin(size: 375.0, middle: 0.5),
            Pin(start: -4.0, end: 0.0),
            child: SingleChildScrollView(
              primary: false,
              child: Column(children: [
                ///** 하위 카테고리 버튼 **//
                SizedBox(
                  width: 375.0,
                  height: 40,
                  child: Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: [
                              ///** 수영 버튼 **//
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (_sportsCategoriesController.hasClients) {
                                      _sportsCategoriesController.animateToPage(
                                        0,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                    '수영',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 14,
                                      color: const Color(0xff767676),
                                    ),
                                  ),
                                ),
                              ),

                              ///**  야구 버튼  **?/
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (_sportsCategoriesController.hasClients) {
                                      _sportsCategoriesController.animateToPage(
                                        1,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                    '야구',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 14,
                                      color: const Color(0xff767676),
                                    ),
                                  ),
                                ),
                              ),

                              ///** 축구 버튼 **//
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (_sportsCategoriesController.hasClients) {
                                      _sportsCategoriesController.animateToPage(
                                        2,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                    '축구',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 14,
                                      color: const Color(0xff767676),
                                    ),
                                  ),
                                ),
                              ),

                              ///** 농구 버튼  **//
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (_sportsCategoriesController.hasClients) {
                                      _sportsCategoriesController.animateToPage(
                                        3,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                    '농구',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 14,
                                      color: const Color(0xff767676),
                                    ),
                                  ),
                                ),
                              ),

                              ///** 미식축구 버튼  **//
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (_sportsCategoriesController.hasClients) {
                                      _sportsCategoriesController.animateToPage(
                                        4,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                    '미식축구',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 14,
                                      color: const Color(0xff767676),
                                    ),
                                  ),
                                ),
                              ),

                              ///** 양궁 버튼 **?/
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (_sportsCategoriesController.hasClients) {
                                      _sportsCategoriesController.animateToPage(
                                        5,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                    '양궁',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 14,
                                      color: const Color(0xff767676),
                                    ),
                                  ),
                                ),
                              ),

                              ///** 복싱 버튼  **///
                              Container(
                                child: TextButton(
                                  onPressed: () {
                                    if (_sportsCategoriesController.hasClients) {
                                      _sportsCategoriesController.animateToPage(
                                        6,
                                        duration: const Duration(milliseconds: 400),
                                        curve: Curves.easeInOut,
                                      );
                                    }
                                  },
                                  child: Text(
                                    '복싱',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 14,
                                      color: const Color(0xff767676),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                ///** 글 목록 부분 **//
                SizedBox(
                    width: 500.0,
                    height: 500.0,
                    child: PageView(
                      controller: _sportsCategoriesController,
                      children: [
                        ///** 수영 페이지 부분 **//
                        Column(
                          children: [
                            ///** 전체 메인페이지 글 목록 부분
                            SizedBox(
                              height: 500,
                              child: FutureBuilder<List<FireModel>>(
                                future: FireService().getFireModels(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<FireModel> datas = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: datas.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          FireModel data = datas[index];
                                          return Column(
                                              children: [
                                                if(data.category=="swimming")...[
                                                  Align(
                                                    alignment: Alignment(0.171, -0.928),
                                                    child: SizedBox(
                                                      width: 135.0,
                                                      height: 24.0,
                                                      child: Text(
                                                        '${data.title}',
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
                                                  ),

                                                  ///***메인페이지 title날짜 부분
                                                  Align(
                                                    alignment: Alignment(0.00, -0.2),
                                                    child: SizedBox(
                                                      width: 95.0,
                                                      height: 17.0,
                                                      child: Text(
                                                        '${data.place} · ${data.date}',
                                                        style: TextStyle(
                                                          fontFamily: 'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(0xff999999),
                                                          letterSpacing: -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),

                                                  ///** 태그 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.1, 0.928),
                                                    child: SizedBox(
                                                        width: 139.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '여자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '남자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                          ],
                                                        )),
                                                  ),

                                                  ///*** 인원 표시 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.7, 0.928),
                                                    child: SizedBox(
                                                        width: 40.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [

                                                            ///** 사람이미지 **//
                                                            SvgPicture.string(
                                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                              allowDrawingOutsideViewBox: true,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text(
                                                              '${data.people}/${data
                                                                  .totalPeople}',
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  ),

                                                  ///***이미지부분 안댐**//
                                                ]
                                              ]
                                          );
                                        }
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        ///** 야구 페이지 부분 **//
                        Column(
                          children: [
                            ///** 전체 메인페이지 글 목록 부분
                            SizedBox(
                              height: 500,
                              child: FutureBuilder<List<FireModel>>(
                                future: FireService().getFireModels(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<FireModel> datas = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: datas.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          FireModel data = datas[index];
                                          return Column(
                                              children: [
                                                if(data.category=="baseball")...[
                                                  Align(
                                                    alignment: Alignment(0.171, -0.928),
                                                    child: SizedBox(
                                                      width: 135.0,
                                                      height: 24.0,
                                                      child: Text(
                                                        '${data.title}',
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
                                                  ),

                                                  ///***메인페이지 title날짜 부분
                                                  Align(
                                                    alignment: Alignment(0.00, -0.2),
                                                    child: SizedBox(
                                                      width: 95.0,
                                                      height: 17.0,
                                                      child: Text(
                                                        '${data.place} · ${data.date}',
                                                        style: TextStyle(
                                                          fontFamily: 'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(0xff999999),
                                                          letterSpacing: -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),

                                                  ///** 태그 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.1, 0.928),
                                                    child: SizedBox(
                                                        width: 139.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '여자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '남자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                          ],
                                                        )),
                                                  ),

                                                  ///*** 인원 표시 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.7, 0.928),
                                                    child: SizedBox(
                                                        width: 40.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [

                                                            ///** 사람이미지 **//
                                                            SvgPicture.string(
                                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                              allowDrawingOutsideViewBox: true,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text(
                                                              '${data.people}/${data
                                                                  .totalPeople}',
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  ),

                                                  ///***이미지부분 안댐**//
                                                ]
                                              ]
                                          );
                                        }
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        ///** 축구 페이지 부분 **//
                        Column(
                          children: [
                            ///** 전체 메인페이지 글 목록 부분
                            SizedBox(
                              height: 500,
                              child: FutureBuilder<List<FireModel>>(
                                future: FireService().getFireModels(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<FireModel> datas = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: datas.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          FireModel data = datas[index];
                                          return Column(
                                              children: [
                                                if(data.category=="soccer")...[
                                                  Align(
                                                    alignment: Alignment(0.171, -0.928),
                                                    child: SizedBox(
                                                      width: 135.0,
                                                      height: 24.0,
                                                      child: Text(
                                                        '${data.title}',
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
                                                  ),

                                                  ///***메인페이지 title날짜 부분
                                                  Align(
                                                    alignment: Alignment(0.00, -0.2),
                                                    child: SizedBox(
                                                      width: 95.0,
                                                      height: 17.0,
                                                      child: Text(
                                                        '${data.place} · ${data.date}',
                                                        style: TextStyle(
                                                          fontFamily: 'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(0xff999999),
                                                          letterSpacing: -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),

                                                  ///** 태그 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.1, 0.928),
                                                    child: SizedBox(
                                                        width: 139.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '여자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '남자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                          ],
                                                        )),
                                                  ),

                                                  ///*** 인원 표시 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.7, 0.928),
                                                    child: SizedBox(
                                                        width: 40.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [

                                                            ///** 사람이미지 **//
                                                            SvgPicture.string(
                                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                              allowDrawingOutsideViewBox: true,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text(
                                                              '${data.people}/${data
                                                                  .totalPeople}',
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  ),

                                                  ///***이미지부분 안댐**//
                                                ]
                                              ]
                                          );
                                        }
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        ///** 농구 페이지 부분 **//
                        Column(
                          children: [
                            ///** 전체 메인페이지 글 목록 부분
                            SizedBox(
                              height: 500,
                              child: FutureBuilder<List<FireModel>>(
                                future: FireService().getFireModels(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<FireModel> datas = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: datas.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          FireModel data = datas[index];
                                          return Column(
                                              children: [
                                                if(data.category=="basketball")...[
                                                  Align(
                                                    alignment: Alignment(0.171, -0.928),
                                                    child: SizedBox(
                                                      width: 135.0,
                                                      height: 24.0,
                                                      child: Text(
                                                        '${data.title}',
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
                                                  ),

                                                  ///***메인페이지 title날짜 부분
                                                  Align(
                                                    alignment: Alignment(0.00, -0.2),
                                                    child: SizedBox(
                                                      width: 95.0,
                                                      height: 17.0,
                                                      child: Text(
                                                        '${data.place} · ${data.date}',
                                                        style: TextStyle(
                                                          fontFamily: 'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(0xff999999),
                                                          letterSpacing: -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),

                                                  ///** 태그 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.1, 0.928),
                                                    child: SizedBox(
                                                        width: 139.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '여자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '남자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                          ],
                                                        )),
                                                  ),

                                                  ///*** 인원 표시 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.7, 0.928),
                                                    child: SizedBox(
                                                        width: 40.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [

                                                            ///** 사람이미지 **//
                                                            SvgPicture.string(
                                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                              allowDrawingOutsideViewBox: true,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text(
                                                              '${data.people}/${data
                                                                  .totalPeople}',
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  ),

                                                  ///***이미지부분 안댐**//
                                                ]
                                              ]
                                          );
                                        }
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        ///** 미식축구 페이지 부분 **//
                        Column(
                          children: [
                            ///** 전체 메인페이지 글 목록 부분
                            SizedBox(
                              height: 500,
                              child: FutureBuilder<List<FireModel>>(
                                future: FireService().getFireModels(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<FireModel> datas = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: datas.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          FireModel data = datas[index];
                                          return Column(
                                              children: [
                                                if(data.category=="football")...[
                                                  Align(
                                                    alignment: Alignment(0.171, -0.928),
                                                    child: SizedBox(
                                                      width: 135.0,
                                                      height: 24.0,
                                                      child: Text(
                                                        '${data.title}',
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
                                                  ),

                                                  ///***메인페이지 title날짜 부분
                                                  Align(
                                                    alignment: Alignment(0.00, -0.2),
                                                    child: SizedBox(
                                                      width: 95.0,
                                                      height: 17.0,
                                                      child: Text(
                                                        '${data.place} · ${data.date}',
                                                        style: TextStyle(
                                                          fontFamily: 'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(0xff999999),
                                                          letterSpacing: -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),

                                                  ///** 태그 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.1, 0.928),
                                                    child: SizedBox(
                                                        width: 139.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '여자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '남자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                          ],
                                                        )),
                                                  ),

                                                  ///*** 인원 표시 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.7, 0.928),
                                                    child: SizedBox(
                                                        width: 40.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [

                                                            ///** 사람이미지 **//
                                                            SvgPicture.string(
                                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                              allowDrawingOutsideViewBox: true,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text(
                                                              '${data.people}/${data
                                                                  .totalPeople}',
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  ),

                                                  ///***이미지부분 안댐**//
                                                ]
                                              ]
                                          );
                                        }
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        ///** 양궁 페이지 부분 **//
                        Column(
                          children: [
                            ///** 전체 메인페이지 글 목록 부분
                            SizedBox(
                              height: 500,
                              child: FutureBuilder<List<FireModel>>(
                                future: FireService().getFireModels(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<FireModel> datas = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: datas.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          FireModel data = datas[index];
                                          return Column(
                                              children: [
                                                if(data.category=="archery")...[
                                                  Align(
                                                    alignment: Alignment(0.171, -0.928),
                                                    child: SizedBox(
                                                      width: 135.0,
                                                      height: 24.0,
                                                      child: Text(
                                                        '${data.title}',
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
                                                  ),

                                                  ///***메인페이지 title날짜 부분
                                                  Align(
                                                    alignment: Alignment(0.00, -0.2),
                                                    child: SizedBox(
                                                      width: 95.0,
                                                      height: 17.0,
                                                      child: Text(
                                                        '${data.place} · ${data.date}',
                                                        style: TextStyle(
                                                          fontFamily: 'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(0xff999999),
                                                          letterSpacing: -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),

                                                  ///** 태그 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.1, 0.928),
                                                    child: SizedBox(
                                                        width: 139.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '여자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '남자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                          ],
                                                        )),
                                                  ),

                                                  ///*** 인원 표시 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.7, 0.928),
                                                    child: SizedBox(
                                                        width: 40.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [

                                                            ///** 사람이미지 **//
                                                            SvgPicture.string(
                                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                              allowDrawingOutsideViewBox: true,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text(
                                                              '${data.people}/${data
                                                                  .totalPeople}',
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  ),

                                                  ///***이미지부분 안댐**//
                                                ]
                                              ]
                                          );
                                        }
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                        ///** 복싱 페이지 부분 **//
                        Column(
                          children: [
                            ///** 전체 메인페이지 글 목록 부분
                            SizedBox(
                              height: 500,
                              child: FutureBuilder<List<FireModel>>(
                                future: FireService().getFireModels(),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData) {
                                    List<FireModel> datas = snapshot.data!;
                                    return ListView.builder(
                                        itemCount: datas.length,
                                        itemBuilder: (BuildContext context, int index) {
                                          FireModel data = datas[index];
                                          return Column(
                                              children: [
                                                if(data.category=="boxing")...[
                                                  Align(
                                                    alignment: Alignment(0.171, -0.928),
                                                    child: SizedBox(
                                                      width: 135.0,
                                                      height: 24.0,
                                                      child: Text(
                                                        '${data.title}',
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
                                                  ),

                                                  ///***메인페이지 title날짜 부분
                                                  Align(
                                                    alignment: Alignment(0.00, -0.2),
                                                    child: SizedBox(
                                                      width: 95.0,
                                                      height: 17.0,
                                                      child: Text(
                                                        '${data.place} · ${data.date}',
                                                        style: TextStyle(
                                                          fontFamily: 'Source Han Sans KR',
                                                          fontSize: 12,
                                                          color: const Color(0xff999999),
                                                          letterSpacing: -0.30000000000000004,
                                                        ),
                                                        softWrap: false,
                                                      ),
                                                    ),
                                                  ),

                                                  ///** 태그 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.1, 0.928),
                                                    child: SizedBox(
                                                        width: 139.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '여자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                            SizedBox(
                                                              width: 3,
                                                            ),
                                                            TextButton(
                                                              onPressed: () {},
                                                              child: Text(
                                                                '남자',
                                                                style: TextStyle(
                                                                  fontFamily: 'Source Han Sans KR',
                                                                  fontSize: 12,
                                                                  color: const Color(
                                                                      0xff767676),
                                                                ),
                                                              ),
                                                              style: TextButton.styleFrom(
                                                                  minimumSize: Size.zero,
                                                                  padding:
                                                                  EdgeInsets.fromLTRB(
                                                                      6, 2, 2, 6),
                                                                  backgroundColor:
                                                                  const Color(0xfff7f7f7),
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                      BorderRadius.circular(
                                                                          5))),
                                                            ),
                                                          ],
                                                        )),
                                                  ),

                                                  ///*** 인원 표시 부분 **//
                                                  Align(
                                                    alignment: Alignment(0.7, 0.928),
                                                    child: SizedBox(
                                                        width: 40.0,
                                                        height: 34.0,
                                                        child: Row(
                                                          children: [

                                                            ///** 사람이미지 **//
                                                            SvgPicture.string(
                                                              '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>',
                                                              allowDrawingOutsideViewBox: true,
                                                              fit: BoxFit.fill,
                                                            ),
                                                            Text(
                                                              '${data.people}/${data
                                                                  .totalPeople}',
                                                              style: TextStyle(
                                                                  fontSize: 13
                                                              ),
                                                            )
                                                          ],
                                                        )),
                                                  ),

                                                  ///***이미지부분 안댐**//
                                                ]
                                              ]
                                          );
                                        }
                                    );
                                  } else {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                },
                              ),
                            )
                          ],
                        ),
                      ],
                    )),
              ]),
            ),
            //** 전체 메인페이지 글 목록 부분 *//
          ),
        )
    );
  }
}