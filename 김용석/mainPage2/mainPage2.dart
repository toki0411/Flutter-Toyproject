import 'package:blackup/postList.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'FireModel.dart';
import 'FireService.dart';

class MainPage2 extends StatefulWidget {
  const MainPage2({Key? key}) : super(key: key);

  @override
  State<MainPage2> createState() => _MainPageState2();
}

class _MainPageState2 extends State<MainPage2> {
  ///**PageViewPage Controller **/
  final PageController _pageController = PageController();
  CollectionReference post = FirebaseFirestore.instance.collection('post');
  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
  ///*** category Controller **//
  final PageController _cultureCategoriesController = PageController();
  final PageController _sportsCategoriesController = PageController();


  @override
  void dispose2() {
    _cultureCategoriesController.dispose();
    super.dispose();
  }

  @override
  void dispose3() {
    _sportsCategoriesController.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///**상단 AppBar  및 패이지 이동 버튼 **///
      appBar: AppBar(
          backgroundColor: const Color(0xffffffff),
          centerTitle: true,
          title: Text(
            'CREW',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.w900),
          ),
          elevation: 0.0,
          actions: [
            IconButton(icon: Icon(Icons.search), onPressed: null),
            IconButton(icon: Icon(Icons.notifications), onPressed: null),
          ],
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(50),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ///** 전체 페이지 부분 *//
                  TextButton(
                    onPressed: () {
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          0,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
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
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          1,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
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
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          2,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
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
                      if (_pageController.hasClients) {
                        _pageController.animateToPage(
                          3,
                          duration: const Duration(milliseconds: 400),
                          curve: Curves.easeInOut,
                        );
                      }
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
      body:
      GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },

        child: PageView(
          controller: _pageController,
          children: <Widget>[
            ///**전체페이지*//
            Pinned.fromPins(
              Pin(size: 375.0, middle: 0.5),
              Pin(start: 10.0, end: 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  children: [
                    ///** 전체 메인페이지 글 목록 부분
                    SizedBox(
                      height: 540,
                      child: FutureBuilder<List<FireModel>>(
                        future: FireService().getFireModels(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            List<FireModel> datas = snapshot.data!;
                            return ListView.builder(
                                itemCount: datas.length,
                                itemBuilder: (BuildContext context, int index) {
                                  FireModel data = datas[index];

                                  return SizedBox(
                                    height: 100.0,
                                    width: 375.0,
                                    child: Stack(
                                      children: <Widget>[
                                        ///** 메인페이지 title 부분 **//
                                        Align(
                                          alignment: Alignment(0.171, -0.928),
                                          child: SizedBox(
                                            width: 129.0,
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
                                          alignment: Alignment(-0.05, -0.2),
                                          child: SizedBox(
                                            width: 75.0,
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
                                                        color: const Color(0xff767676),
                                                      ),
                                                    ),
                                                    style: TextButton.styleFrom(
                                                        minimumSize: Size.zero,
                                                        padding:
                                                        EdgeInsets.fromLTRB(6, 2, 2, 6),
                                                        backgroundColor:
                                                        const Color(0xfff7f7f7),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(5))),
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
                                                        color: const Color(0xff767676),
                                                      ),
                                                    ),
                                                    style: TextButton.styleFrom(
                                                        minimumSize: Size.zero,
                                                        padding:
                                                        EdgeInsets.fromLTRB(6, 2, 2, 6),
                                                        backgroundColor:
                                                        const Color(0xfff7f7f7),
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius:
                                                            BorderRadius.circular(5))),
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
                                        ///***이미지부분 **//
                                        Pinned.fromPins(
                                            Pin(size: 100.0, start: 24.0),
                                            Pin(size: 100.0, middle: 0.1503),
                                            child: Stack(
                                              children: [
                                                Container(
                                                  height: double.infinity,
                                                  child: Image(
                                                    width: 300,
                                                    fit: BoxFit.fill,
                                                    image: NetworkImage(
                                                        '${data.image}'),
                                                  ),
                                                ),
                                                Align(
                                                  alignment: Alignment(1.2, 1.2),
                                                  child: IconButton(
                                                      onPressed: (){},
                                                      icon: SvgPicture.string(
                                                        '<svg viewBox="0.0 0.0 19.0 17.0" ><path transform="translate(0.0, 0.0)" d="M 9.5 17 L 8.526250839233398 16.14188194274902 C 6.848074913024902 14.6422643661499 5.462499618530273 13.34720230102539 4.369999885559082 12.25716209411621 C 3.277500152587891 11.16712188720703 2.406825065612793 10.19304180145264 1.757500052452087 9.334924697875977 C 1.108175039291382 8.476806640625 0.653124988079071 7.699863910675049 0.3918749690055847 7.004092693328857 C 0.1306250095367432 6.308321475982666 0 5.604665756225586 0 4.893588066101074 C 0 3.50204610824585 0.4787999987602234 2.338717222213745 1.436875104904175 1.403137683868408 C 2.394949913024902 0.4675578773021698 3.578175067901611 -1.213235094610354e-07 4.987500190734863 -1.213235094610354e-07 C 5.889999389648438 -1.213235094610354e-07 6.72504997253418 0.2087311148643494 7.493124961853027 0.6261935830116272 C 8.261199951171875 1.04365611076355 8.929999351501465 1.646657347679138 9.5 2.435197591781616 C 10.16499900817871 1.60027277469635 10.86942481994629 0.9856752157211304 11.61374950408936 0.5914050936698914 C 12.35807514190674 0.19713494181633 13.15750026702881 -1.213235094610354e-07 14.01249980926514 -1.213235094610354e-07 C 15.42182445526123 -1.213235094610354e-07 16.60505104064941 0.4675578773021698 17.56312370300293 1.403137683868408 C 18.52120018005371 2.338717222213745 19 3.50204610824585 19 4.893588066101074 C 19 5.604665756225586 18.86937522888184 6.308321475982666 18.60812568664551 7.004092693328857 C 18.34687614440918 7.699863910675049 17.89182472229004 8.476806640625 17.24250030517578 9.334924697875977 C 16.59317398071289 10.19304180145264 15.72249889373779 11.16712188720703 14.63000011444092 12.25716209411621 C 13.53750038146973 13.34720230102539 12.1519250869751 14.6422643661499 10.47375011444092 16.14188194274902 L 9.5 17 Z M 9.5 15.16780376434326 C 11.09932518005371 13.72987747192383 12.41744995117188 12.49697113037109 13.45437526702881 11.46862125396729 C 14.49129962921143 10.44027233123779 15.31494998931885 9.539945602416992 15.92437553405762 8.766712188720703 C 16.53380012512207 7.993478775024414 16.96129989624023 7.305593490600586 17.20687484741211 6.702591419219971 C 17.45244979858398 6.099590301513672 17.57500076293945 5.496589660644531 17.57500076293945 4.893588066101074 C 17.57500076293945 3.873124361038208 17.24250030517578 3.034487962722778 16.57749938964844 2.377216577529907 C 15.91250038146973 1.719945311546326 15.0575008392334 1.391541600227356 14.01249980926514 1.391541600227356 C 13.20499992370605 1.391541600227356 12.45307445526123 1.635061264038086 11.75625038146973 2.122100591659546 C 11.05942535400391 2.609140157699585 10.49749946594238 3.293314695358276 10.07000064849854 4.174624919891357 L 8.90625 4.174624919891357 C 8.494424819946289 3.308621883392334 7.940574645996094 2.628621578216553 7.243750095367432 2.133697032928467 C 6.546924591064453 1.638772010803223 5.795000076293945 1.391541600227356 4.987500190734863 1.391541600227356 C 3.942499876022339 1.391541600227356 3.087500095367432 1.719945311546326 2.422499895095825 2.377216577529907 C 1.757500052452087 3.034487962722778 1.424999952316284 3.873124361038208 1.424999952316284 4.893588066101074 C 1.424999952316284 5.496589660644531 1.547549843788147 6.103301525115967 1.793125033378601 6.714188098907471 C 2.038699865341187 7.325074672698975 2.46619987487793 8.020845413208008 3.075624942779541 8.80150032043457 C 3.685050010681152 9.582155227661133 4.512500286102295 10.48294639587402 5.557499885559082 11.50341033935547 C 6.602499961853027 12.5238733291626 7.916824817657471 13.74518299102783 9.5 15.16780376434326" fill="#ffffff" stroke="none" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>',
                                                        allowDrawingOutsideViewBox: true,
                                                        fit: BoxFit.fill,
                                                      )),
                                                ),
                                              ],
                                            )
                                        ),
                                        SizedBox(
                                          height: 20,
                                        ),
                                      ],
                                    ),
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
              ),
            ),

            ///**문화예술 페이지 **//
            Pinned.fromPins(
              Pin(size: 375.0, middle: 0.5),
              Pin(start: 10.0, end: 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  children: [
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
                                  ///** 뮤지컬 버튼 **//
                                  Container(
                                    child: TextButton(onPressed: (){
                                      if (_cultureCategoriesController.hasClients) {
                                        _cultureCategoriesController.animateToPage(
                                          0,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                      child: Text(
                                        '뮤지컬',
                                        style: TextStyle(
                                          fontFamily: 'Source Han Sans KR',
                                          fontSize: 14,
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///**  연극 버튼  **?/
                                  Container(
                                    child: TextButton(onPressed: (){
                                      if (_cultureCategoriesController.hasClients) {
                                        _cultureCategoriesController.animateToPage(
                                          1,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                      child: Text(
                                        '연극',
                                        style: TextStyle(
                                          fontFamily: 'Source Han Sans KR',
                                          fontSize: 14,
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 전시 버튼 **//
                                  Container(
                                    child: TextButton(onPressed: (){
                                      if (_cultureCategoriesController.hasClients) {
                                        _cultureCategoriesController.animateToPage(
                                          2,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                      child: Text(
                                        '전시',
                                        style: TextStyle(
                                          fontFamily: 'Source Han Sans KR',
                                          fontSize: 14,
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 콘서트 버튼  **//
                                  Container(
                                    child: TextButton(onPressed: (){
                                      if (_cultureCategoriesController.hasClients) {
                                        _cultureCategoriesController.animateToPage(
                                          3,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                      child: Text(
                                        '콘서트',
                                        style: TextStyle(
                                          fontFamily: 'Source Han Sans KR',
                                          fontSize: 14,
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 클래식 버튼  **//
                                  Container(
                                    child: TextButton(onPressed: (){
                                      if (_cultureCategoriesController.hasClients) {
                                        _cultureCategoriesController.animateToPage(
                                          4,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                      child: Text(
                                        '클래식',
                                        style: TextStyle(
                                          fontFamily: 'Source Han Sans KR',
                                          fontSize: 14,
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 패스티벌 버튼 **?/
                                  Container(
                                    child: TextButton(onPressed: (){
                                      if (_cultureCategoriesController.hasClients) {
                                        _cultureCategoriesController.animateToPage(
                                          5,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                      child: Text(
                                        '페스티벌',
                                        style: TextStyle(
                                          fontFamily: 'Source Han Sans KR',
                                          fontSize: 14,
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 기타 버튼  **///
                                  Container(
                                    child: TextButton(onPressed: (){
                                      if (_cultureCategoriesController.hasClients) {
                                        _cultureCategoriesController.animateToPage(
                                          6,
                                          duration: const Duration(milliseconds: 400),
                                          curve: Curves.easeInOut,
                                        );
                                      }
                                    },
                                      child: Text(
                                        '기타',
                                        style: TextStyle(
                                          fontFamily: 'Source Han Sans KR',
                                          fontSize: 14,
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                    ,
                    ///** 전체 메인페이지 글 목록 부분 *//
                    SizedBox(
                        width: 375.0,
                        height: 100.0,
                        child: PageView(
                          controller: _cultureCategoriesController,
                          children: [
                            ///** 뮤지컬 페이지 부분 **//
                            Container(
                              child: PostList(),
                            ),
                            Container(
                              child: PostList(),
                            ),
                            Container(
                              child: PostList(),
                            ),
                            Container(
                              child: PostList(),
                            ),
                            Container(
                              child: PostList(),
                            ),
                            Container(
                              child: PostList(),
                            ),
                            Container(
                              child: PostList(),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),

            ///**스포츠경기 *//
            Pinned.fromPins(
              Pin(size: 375.0, middle: 0.5),
              Pin(start: 10.0, end: 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  children: [
                    ///** 하위 카테고리 버튼  **//
                    SizedBox(
                      width: 375.0,
                      height: 40,
                      child: Container(
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              Row(
                                children: [
                                  ///** 수영  **//
                                  Container(
                                    child: TextButton(onPressed: (){
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
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///**  야구  **?/
                                  Container(
                                    child: TextButton(onPressed: (){
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
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 축구 **//
                                  Container(
                                    child: TextButton(onPressed: (){
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
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 농구 **//
                                  Container(
                                    child: TextButton(onPressed: (){
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
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 미식축구  **//
                                  Container(
                                    child: TextButton(onPressed: (){
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
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 양궁 **?/
                                  Container(
                                    child: TextButton(onPressed: (){
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
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                  ///** 복싱  **///
                                  Container(
                                    child: TextButton(onPressed: (){
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
                                          color: const Color(0xff767676) ,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          )
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    )
                    ,
                    ///** 전체 메인페이지 글 목록 부분 *//
                    SizedBox(
                        width: 375.0,
                        height: 100.0,
                        child: PageView(
                          controller: _sportsCategoriesController,
                          children: [
                            ///** 수영 **//
                            Container(
                              child: PostList(),
                            ),
                            /// 야구
                            Container(
                              child: PostList(),
                            ),
                            ///  축구
                            Container(
                              child: PostList(),
                            ),
                            /// 농구
                            Container(
                              child: PostList(),
                            ),
                            /// 미식축구
                            Container(
                              child: PostList(),
                            ),
                            /// 양궁
                            Container(
                              child: PostList(),
                            ),
                            /// 복싱
                            Container(
                              child: PostList(),
                            )
                          ],
                        )
                    ),
                  ],
                ),
              ),
            ),

            ///**기타 **//
            Pinned.fromPins(
              Pin(size: 375.0, middle: 0.5),
              Pin(start: 10.0, end: 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  children: [
                    ///** 전체 메인페이지 글 목록 부분
                    SizedBox(
                      width: 375.0,
                      height: 100.0,
                      child: PostList(),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      width: 375.0,
                      height: 100.0,
                      child: PostList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _svg_yoicpa =
    '<svg viewBox="0.0 0.0 18.0 20.0" ><path  d="M 0 17.00000190734863 L 0 15.5 L 2.362499475479126 15.5 L 2.362499475479126 7.850000381469727 C 2.362499475479126 6.450000286102295 2.826562166213989 5.204000473022461 3.754687547683716 4.112500667572021 C 4.682812213897705 3.021000146865845 5.90625 2.333499908447266 7.424999237060547 2.049999952316284 L 7.424999237060547 1.325000166893005 C 7.424999237060547 0.9415000677108765 7.579687118530273 0.6250000596046448 7.889061450958252 0.3750000298023224 C 8.198436737060547 0.1250000149011612 8.568562507629395 0 9 0 C 9.431436538696289 0 9.801560401916504 0.1250000149011612 10.11093711853027 0.3750000298023224 C 10.42031192779541 0.6250000596046448 10.5749979019165 0.9415000677108765 10.5749979019165 1.325000166893005 L 10.5749979019165 2.049999952316284 C 12.09375 2.333499908447266 13.32168579101562 3.021000146865845 14.25937366485596 4.112500667572021 C 15.19706249237061 5.204000473022461 15.66562652587891 6.450000286102295 15.66562652587891 7.850000381469727 L 15.66562652587891 15.5 L 18 15.5 L 18 17.00000190734863 L 0 17.00000190734863 Z M 9 20.00000190734863 C 8.399811744689941 20.00000190734863 7.875 19.80400276184082 7.424999237060547 19.41250228881836 C 6.974998950958252 19.0210018157959 6.75 18.55000114440918 6.75 18.00000190734863 L 11.25 18.00000190734863 C 11.25 18.55000114440918 11.02950000762939 19.0210018157959 10.58906269073486 19.41250228881836 C 10.14862442016602 19.80400276184082 9.618749618530273 20.00000190734863 9 20.00000190734863 M 4.049999713897705 15.5 L 13.97812366485596 15.5 L 13.97812366485596 7.850000381469727 C 13.97812366485596 6.616500377655029 13.5 5.566500663757324 12.5437479019165 4.700000286102295 C 11.58749866485596 3.833500385284424 10.41581249237061 3.400000333786011 9.028122901916504 3.400000333786011 C 7.64043664932251 3.400000333786011 6.464249610900879 3.833500385284424 5.498436450958252 4.700000286102295 C 4.532624244689941 5.566500663757324 4.049999713897705 6.616500377655029 4.049999713897705 7.850000381469727 L 4.049999713897705 15.5 Z" fill="#191919" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_a0bou =
    '<svg viewBox="0.0 0.0 15.0 15.0" ><path transform="translate(0.0, 0.0)" d="M 10.88179969787598 9.848990440368652 C 11.32729148864746 9.293936729431152 11.6614990234375 8.699286460876465 11.88406658172607 8.065041542053223 C 12.10698986053467 7.430439949035645 12.21827411651611 6.772295475006104 12.21827411651611 6.090249538421631 C 12.21827411651611 4.409036636352539 11.62571716308594 2.973959445953369 10.44024467468262 1.784304261207581 C 9.255129814147949 0.5946493148803711 7.819180488586426 0 6.133111476898193 0 C 4.430582523345947 0 2.982824802398682 0.5946493148803711 1.789837956428528 1.784304261207581 C 0.5964933633804321 2.973959445953369 0 4.409036636352539 0 6.090249538421631 C 0 7.771462440490723 0.5964933633804321 9.206896781921387 1.789837956428528 10.39619541168213 C 2.982824802398682 11.58585071563721 4.438455104827881 12.18049907684326 6.15672779083252 12.18049907684326 C 6.872734546661377 12.18049907684326 7.549022197723389 12.06563663482666 8.185235023498535 11.8355541229248 C 8.821446418762207 11.60582733154297 9.378579139709473 11.284423828125 9.855916976928711 10.87205791473389 L 13.99630546569824 15.00000095367432 L 14.05105209350586 15.00000095367432 L 15.00000095367432 13.92342662811279 L 10.88179969787598 9.848990440368652 Z M 9.426169395446777 9.385255813598633 C 8.519442558288574 10.29738426208496 7.421637058258057 10.75327014923096 6.133111476898193 10.75327014923096 C 4.828483581542969 10.75327014923096 3.718869686126709 10.29738426208496 2.803912401199341 9.385255813598633 C 1.889313220977783 8.473127365112305 1.431655645370483 7.375148773193359 1.431655645370483 6.090249538421631 C 1.431655645370483 4.805707454681396 1.889313220977783 3.707372426986694 2.803912401199341 2.795243740081787 C 3.718869686126709 1.883472323417664 4.828483581542969 1.427586197853088 6.133111476898193 1.427586197853088 C 7.421637058258057 1.427586197853088 8.519442558288574 1.883472323417664 9.426169395446777 2.795243740081787 C 10.3328971862793 3.707372426986694 10.7862606048584 4.805707454681396 10.7862606048584 6.090249538421631 C 10.7862606048584 7.375148773193359 10.3328971862793 8.473127365112305 9.426169395446777 9.385255813598633" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_yuaac =
    '<svg viewBox="0.0 0.0 20.0 20.0" ><path transform="translate(0.0, 0.0)" d="M 18.77778053283691 20.00000190734863 L 11.47222328186035 12.6944465637207 C 10.91666793823242 13.17611312866211 10.26833534240723 13.55111312866211 9.527778625488281 13.8194465637207 C 8.787222862243652 14.08778095245361 8.000000953674316 14.22222423553467 7.166667938232422 14.22222423553467 C 5.166667938232422 14.22222423553467 3.472222566604614 13.52778053283691 2.083333730697632 12.13889122009277 C 0.6944445371627808 10.75000190734863 0 9.073890686035156 0 7.111112117767334 C 0 5.14833402633667 0.6944445371627808 3.472222566604614 2.083333730697632 2.083333730697632 C 3.472222566604614 0.6944445371627808 5.157222747802734 3.320830543884767e-08 7.138889789581299 3.320830543884767e-08 C 9.101667404174805 3.320830543884767e-08 10.77333450317383 0.6944445371627808 12.15278053283691 2.083333730697632 C 13.53222465515137 3.472222566604614 14.22222423553467 5.14833402633667 14.22222423553467 7.111112117767334 C 14.22222423553467 7.907223224639893 14.09278106689453 8.676113128662109 13.83333492279053 9.416668891906738 C 13.57389068603516 10.15722465515137 13.18500137329102 10.85166835784912 12.66666793823242 11.50000286102295 L 20.00000190734863 18.77778053283691 L 18.77778053283691 20.00000190734863 Z M 7.138889789581299 12.55555725097656 C 8.638890266418457 12.55555725097656 9.916667938232422 12.02333545684814 10.97222423553467 10.95833587646484 C 12.02777862548828 9.893335342407227 12.55555725097656 8.611111640930176 12.55555725097656 7.111112117767334 C 12.55555725097656 5.611112594604492 12.02777862548828 4.3288893699646 10.97222423553467 3.263889074325562 C 9.916667938232422 2.198889255523682 8.638890266418457 1.666666865348816 7.138889789581299 1.666666865348816 C 5.620555877685547 1.666666865348816 4.3288893699646 2.198889255523682 3.263889312744141 3.263889074325562 C 2.198889255523682 4.3288893699646 1.666666865348816 5.611112594604492 1.666666865348816 7.111112117767334 C 1.666666865348816 8.611111640930176 2.198889255523682 9.893335342407227 3.263889312744141 10.95833587646484 C 4.3288893699646 12.02333545684814 5.620555877685547 12.55555725097656 7.138889789581299 12.55555725097656" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_mxxrw6 =
    '<svg viewBox="40.0 725.0 19.0 20.0" ><path transform="translate(-38.51, 893.1)" d="M 88.239501953125 -168.1020050048828 L 78.50900268554688 -161.54150390625 L 78.50900268554688 -148.1020050048828 L 85.29450225830078 -148.1020050048828 L 85.29450225830078 -156.0825042724609 L 90.72299957275391 -156.0825042724609 L 90.72299957275391 -148.1020050048828 L 97.50900268554688 -148.1020050048828 L 97.50900268554688 -161.8569946289062 L 88.239501953125 -168.1020050048828 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_b49vwm =
    '<svg viewBox="0.0 0.0 20.0 20.0" ><path  d="M 9.324999809265137 15 L 10.82499980926514 15 L 10.82499980926514 10.85000038146973 L 15 10.85000038146973 L 15 9.350000381469727 L 10.82499980926514 9.350000381469727 L 10.82499980926514 5 L 9.324999809265137 5 L 9.324999809265137 9.350000381469727 L 5 9.350000381469727 L 5 10.85000038146973 L 9.324999809265137 10.85000038146973 L 9.324999809265137 15 Z M 10 20 C 8.633500099182129 20 7.341499805450439 19.73749923706055 6.125 19.21249961853027 C 4.908500194549561 18.6875 3.845999956130981 17.97100067138672 2.9375 17.0625 C 2.029000043869019 16.15399932861328 1.3125 15.0915002822876 0.7875000238418579 13.875 C 0.262499988079071 12.6584997177124 0 11.35849952697754 0 9.975000381469727 C 0 8.608499526977539 0.262499988079071 7.316500186920166 0.7875000238418579 6.099999904632568 C 1.3125 4.883500099182129 2.029000043869019 3.825000047683716 2.9375 2.924999952316284 C 3.845999956130981 2.025000095367432 4.908500194549561 1.3125 6.125 0.7875000238418579 C 7.341499805450439 0.262499988079071 8.641500473022461 0 10.02499961853027 0 C 11.39150047302246 0 12.68350028991699 0.262499988079071 13.89999961853027 0.7875000238418579 C 15.11649990081787 1.3125 16.17499923706055 2.025000095367432 17.07500076293945 2.924999952316284 C 17.97500038146973 3.825000047683716 18.6875 4.883500099182129 19.21249961853027 6.099999904632568 C 19.73749923706055 7.316500186920166 20 8.616499900817871 20 10 C 20 11.36649990081787 19.73749923706055 12.6584997177124 19.21249961853027 13.875 C 18.6875 15.0915002822876 17.97500038146973 16.15399932861328 17.07500076293945 17.0625 C 16.17499923706055 17.97100067138672 15.11649990081787 18.6875 13.89999961853027 19.21249961853027 C 12.68350028991699 19.73749923706055 11.38350009918213 20 10 20 M 10.02499961853027 18.5 C 12.375 18.5 14.375 17.67099952697754 16.02499961853027 16.01250076293945 C 17.67499923706055 14.35400009155273 18.5 12.3415002822876 18.5 9.975000381469727 C 18.5 7.625 17.67499923706055 5.625 16.02499961853027 3.974999904632568 C 14.375 2.325000047683716 12.36649990081787 1.5 10 1.5 C 7.650000095367432 1.5 5.645999908447266 2.325000047683716 3.987499952316284 3.974999904632568 C 2.328999996185303 5.625 1.5 7.633500099182129 1.5 10 C 1.5 12.35000038146973 2.328999996185303 14.35400009155273 3.987499952316284 16.01250076293945 C 5.645999908447266 17.67099952697754 7.658500194549561 18.5 10.02499961853027 18.5" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_m8yad5 =
    '<svg viewBox="0.0 0.0 20.0 20.0" ><path  d="M 4 12.02499961853027 L 11.82499980926514 12.02499961853027 L 11.82499980926514 10.52499961853027 L 4 10.52499961853027 L 4 12.02499961853027 Z M 4 8.774999618530273 L 16 8.774999618530273 L 16 7.275000095367432 L 4 7.275000095367432 L 4 8.774999618530273 Z M 4 5.525000095367432 L 16 5.525000095367432 L 16 4.025000095367432 L 4 4.025000095367432 L 4 5.525000095367432 Z M 0 20 L 0 1.5 C 0 1.116500020027161 0.1500000059604645 0.7710000276565552 0.449999988079071 0.4625000059604645 C 0.75 0.153999999165535 1.100000023841858 0 1.5 0 L 18.5 0 C 18.88349914550781 0 19.22900009155273 0.153999999165535 19.53750038146973 0.4625000059604645 C 19.84600067138672 0.7710000276565552 20 1.116500020027161 20 1.5 L 20 14.5 C 20 14.88350009918213 19.84600067138672 15.22900009155273 19.53750038146973 15.53750038146973 C 19.22900009155273 15.8459997177124 18.88349914550781 16 18.5 16 L 4 16 L 0 20 Z M 1.5 16.375 L 3.375 14.5 L 18.5 14.5 L 18.5 1.5 L 1.5 1.5 L 1.5 16.375 Z M 1.5 1.5 L 1.5 16.375 L 1.5 1.5 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_uqozn4 =
    '<svg viewBox="0.0 0.0 19.0 19.0" ><path transform="translate(0.0, 0.0)" d="M 9.5 9.178744316101074 C 8.193750381469727 9.178744316101074 7.125 8.750402450561523 6.293750286102295 7.893719673156738 C 5.462500095367432 7.037036895751953 5.046875 5.935587406158447 5.046875 4.589372158050537 C 5.046875 3.243156433105469 5.462500095367432 2.141706943511963 6.293750286102295 1.285024166107178 C 7.125 0.4283413887023926 8.193750381469727 0 9.5 0 C 10.80625057220459 0 11.875 0.4283413887023926 12.70625019073486 1.285024166107178 C 13.53749942779541 2.141706943511963 13.953125 3.243156433105469 13.953125 4.589372158050537 C 13.953125 5.935587406158447 13.53749942779541 7.037036895751953 12.70625019073486 7.893719673156738 C 11.875 8.750402450561523 10.80625057220459 9.178744316101074 9.5 9.178744316101074 M 0 19 L 0 16.12399291992188 C 0 15.34869575500488 0.1882187575101852 14.68599033355713 0.5640624761581421 14.13526630401611 C 0.9399062395095825 13.58454132080078 1.425000071525574 13.16660213470459 2.018749952316284 12.88083648681641 C 3.34459376335144 12.2689208984375 4.616406440734863 11.809983253479 5.833593845367432 11.50402545928955 C 7.05078125 11.19806671142578 8.27271842956543 11.04508781433105 9.5 11.04508781433105 C 10.72728061676025 11.04508781433105 11.9444694519043 11.20296382904053 13.15156269073486 11.51932430267334 C 14.35865688323975 11.83568382263184 15.62571811676025 12.2891149520874 16.95156288146973 12.88083648681641 C 17.56490707397461 13.16660213470459 18.06009292602539 13.58454132080078 18.43593788146973 14.13526630401611 C 18.81178092956543 14.68599033355713 19 15.34869575500488 19 16.12399291992188 L 19 19 L 0 19 Z M 1.78125 17.16425132751465 L 17.21875 17.16425132751465 L 17.21875 16.12399291992188 C 17.21875 15.79784202575684 17.12493705749512 15.48637676239014 16.93671798706055 15.19082164764404 C 16.74850082397461 14.89526462554932 16.51634407043457 14.67558765411377 16.23906326293945 14.5330114364624 C 14.97259330749512 13.90090179443359 13.81478118896484 13.4670524597168 12.765625 13.23268890380859 C 11.71646881103516 12.99832534790039 10.62812519073486 12.88083648681641 9.5 12.88083648681641 C 8.371874809265137 12.88083648681641 7.2734375 12.99832534790039 6.204687595367432 13.23268890380859 C 5.135937213897705 13.4670524597168 3.978124856948853 13.90090179443359 2.731250047683716 14.5330114364624 C 2.45396876335144 14.67558765411377 2.2265625 14.89526462554932 2.048437595367432 15.19082164764404 C 1.870312571525574 15.48637676239014 1.78125 15.79784202575684 1.78125 16.12399291992188 L 1.78125 17.16425132751465 Z M 9.5 7.342995166778564 C 10.27187442779541 7.342995166778564 10.91015625 7.082930564880371 11.41484355926514 6.562802314758301 C 11.91953182220459 6.042673110961914 12.171875 5.384863376617432 12.171875 4.589372158050537 C 12.171875 3.793880701065063 11.91953182220459 3.136070728302002 11.41484355926514 2.615942001342773 C 10.91015625 2.095813035964966 10.27187442779541 1.835748791694641 9.5 1.835748791694641 C 8.728124618530273 1.835748791694641 8.08984375 2.095813035964966 7.585155963897705 2.615942001342773 C 7.080468654632568 3.136070728302002 6.828125 3.793880701065063 6.828125 4.589372158050537 C 6.828125 5.384863376617432 7.080468654632568 6.042673110961914 7.585155963897705 6.562802314758301 C 8.08984375 7.082930564880371 8.728124618530273 7.342995166778564 9.5 7.342995166778564" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_g4hon0 =
    '<svg viewBox="0.0 0.0 19.0 17.0" ><path transform="translate(0.0, 0.0)" d="M 9.5 17 L 8.526250839233398 16.14188194274902 C 6.848074913024902 14.6422643661499 5.462499618530273 13.34720230102539 4.369999885559082 12.25716209411621 C 3.277500152587891 11.16712188720703 2.406825065612793 10.19304180145264 1.757500052452087 9.334924697875977 C 1.108175039291382 8.476806640625 0.653124988079071 7.699863910675049 0.3918749690055847 7.004092693328857 C 0.1306250095367432 6.308321475982666 0 5.604665756225586 0 4.893588066101074 C 0 3.50204610824585 0.4787999987602234 2.338717222213745 1.436875104904175 1.403137683868408 C 2.394949913024902 0.4675578773021698 3.578175067901611 -1.213235094610354e-07 4.987500190734863 -1.213235094610354e-07 C 5.889999389648438 -1.213235094610354e-07 6.72504997253418 0.2087311148643494 7.493124961853027 0.6261935830116272 C 8.261199951171875 1.04365611076355 8.929999351501465 1.646657347679138 9.5 2.435197591781616 C 10.16499900817871 1.60027277469635 10.86942481994629 0.9856752157211304 11.61374950408936 0.5914050936698914 C 12.35807514190674 0.19713494181633 13.15750026702881 -1.213235094610354e-07 14.01249980926514 -1.213235094610354e-07 C 15.42182445526123 -1.213235094610354e-07 16.60505104064941 0.4675578773021698 17.56312370300293 1.403137683868408 C 18.52120018005371 2.338717222213745 19 3.50204610824585 19 4.893588066101074 C 19 5.604665756225586 18.86937522888184 6.308321475982666 18.60812568664551 7.004092693328857 C 18.34687614440918 7.699863910675049 17.89182472229004 8.476806640625 17.24250030517578 9.334924697875977 C 16.59317398071289 10.19304180145264 15.72249889373779 11.16712188720703 14.63000011444092 12.25716209411621 C 13.53750038146973 13.34720230102539 12.1519250869751 14.6422643661499 10.47375011444092 16.14188194274902 L 9.5 17 Z M 9.5 15.16780376434326 C 11.09932518005371 13.72987747192383 12.41744995117188 12.49697113037109 13.45437526702881 11.46862125396729 C 14.49129962921143 10.44027233123779 15.31494998931885 9.539945602416992 15.92437553405762 8.766712188720703 C 16.53380012512207 7.993478775024414 16.96129989624023 7.305593490600586 17.20687484741211 6.702591419219971 C 17.45244979858398 6.099590301513672 17.57500076293945 5.496589660644531 17.57500076293945 4.893588066101074 C 17.57500076293945 3.873124361038208 17.24250030517578 3.034487962722778 16.57749938964844 2.377216577529907 C 15.91250038146973 1.719945311546326 15.0575008392334 1.391541600227356 14.01249980926514 1.391541600227356 C 13.20499992370605 1.391541600227356 12.45307445526123 1.635061264038086 11.75625038146973 2.122100591659546 C 11.05942535400391 2.609140157699585 10.49749946594238 3.293314695358276 10.07000064849854 4.174624919891357 L 8.90625 4.174624919891357 C 8.494424819946289 3.308621883392334 7.940574645996094 2.628621578216553 7.243750095367432 2.133697032928467 C 6.546924591064453 1.638772010803223 5.795000076293945 1.391541600227356 4.987500190734863 1.391541600227356 C 3.942499876022339 1.391541600227356 3.087500095367432 1.719945311546326 2.422499895095825 2.377216577529907 C 1.757500052452087 3.034487962722778 1.424999952316284 3.873124361038208 1.424999952316284 4.893588066101074 C 1.424999952316284 5.496589660644531 1.547549843788147 6.103301525115967 1.793125033378601 6.714188098907471 C 2.038699865341187 7.325074672698975 2.46619987487793 8.020845413208008 3.075624942779541 8.80150032043457 C 3.685050010681152 9.582155227661133 4.512500286102295 10.48294639587402 5.557499885559082 11.50341033935547 C 6.602499961853027 12.5238733291626 7.916824817657471 13.74518299102783 9.5 15.16780376434326" fill="#ffffff" stroke="none" stroke-width="0.30000001192092896" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_drhn =
    '<svg viewBox="0.2 0.2 18.5 16.5" ><path transform="translate(-0.27, -0.28)" d="M 9.768292427062988 16.97278213500977 L 8.818293571472168 16.14127540588379 C 7.181049346923828 14.68816661834717 5.829268455505371 13.43326663970947 4.763415336608887 12.37703132629395 C 3.697561264038086 11.32079696655273 2.848122119903564 10.37692546844482 2.21463418006897 9.54542064666748 C 1.581146240234375 8.713915824890137 1.137195110321045 7.961068153381348 0.882317066192627 7.28687572479248 C 0.6274389624595642 6.612682342529297 0.5 5.930848598480225 0.5 5.241823196411133 C 0.5 3.893437623977661 0.9671218991279602 2.766187191009521 1.901829242706299 1.859622359275818 C 2.836536645889282 0.953057587146759 3.990902423858643 0.4999998509883881 5.365853786468506 0.4999998509883881 C 6.246341228485107 0.4999998509883881 7.06102466583252 0.7022577524185181 7.810365676879883 1.106773614883423 C 8.559707641601562 1.511289358139038 9.212194442749023 2.095590114593506 9.768292427062988 2.859675168991089 C 10.41707324981689 2.050643682479858 11.10431671142578 1.455106616020203 11.83048820495605 1.073063850402832 C 12.55665874481201 0.6910212635993958 13.33658504486084 0.4999998509883881 14.17073154449463 0.4999998509883881 C 15.54568195343018 0.4999998509883881 16.70004844665527 0.953057587146759 17.6347541809082 1.859622359275818 C 18.5694637298584 2.766187191009521 19.03658485412598 3.893437623977661 19.03658485412598 5.241823196411133 C 19.03658485412598 5.930848598480225 18.90914535522461 6.612682342529297 18.65426826477051 7.28687572479248 C 18.39939117431641 7.961068153381348 17.9554386138916 8.713915824890137 17.32195091247559 9.54542064666748 C 16.68846321105957 10.37692546844482 15.83902359008789 11.32079696655273 14.77317047119141 12.37703132629395 C 13.70731639862061 13.43326663970947 12.35553741455078 14.68816661834717 10.71829223632812 16.14127540588379 L 9.768292427062988 16.97278213500977 Z" fill="#ec5e65" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_k88ohk =
    '<svg viewBox="0.2 0.2 18.5 16.5" ><path transform="translate(-0.27, -0.28)" d="M 9.768292427062988 16.97278213500977 L 8.818293571472168 16.14127540588379 C 7.181049346923828 14.68816661834717 5.829268455505371 13.43326663970947 4.763415336608887 12.37703132629395 C 3.697561264038086 11.32079696655273 2.848122119903564 10.37692546844482 2.21463418006897 9.54542064666748 C 1.581146240234375 8.713915824890137 1.137195110321045 7.961068153381348 0.882317066192627 7.28687572479248 C 0.6274389624595642 6.612682342529297 0.5 5.930848598480225 0.5 5.241823196411133 C 0.5 3.893437623977661 0.9671218991279602 2.766187191009521 1.901829242706299 1.859622359275818 C 2.836536645889282 0.953057587146759 3.990902423858643 0.4999998509883881 5.365853786468506 0.4999998509883881 C 6.246341228485107 0.4999998509883881 7.06102466583252 0.7022577524185181 7.810365676879883 1.106773614883423 C 8.559707641601562 1.511289358139038 9.212194442749023 2.095590114593506 9.768292427062988 2.859675168991089 C 10.41707324981689 2.050643682479858 11.10431671142578 1.455106616020203 11.83048820495605 1.073063850402832 C 12.55665874481201 0.6910212635993958 13.33658504486084 0.4999998509883881 14.17073154449463 0.4999998509883881 C 15.54568195343018 0.4999998509883881 16.70004844665527 0.953057587146759 17.6347541809082 1.859622359275818 C 18.5694637298584 2.766187191009521 19.03658485412598 3.893437623977661 19.03658485412598 5.241823196411133 C 19.03658485412598 5.930848598480225 18.90914535522461 6.612682342529297 18.65426826477051 7.28687572479248 C 18.39939117431641 7.961068153381348 17.9554386138916 8.713915824890137 17.32195091247559 9.54542064666748 C 16.68846321105957 10.37692546844482 15.83902359008789 11.32079696655273 14.77317047119141 12.37703132629395 C 13.70731639862061 13.43326663970947 12.35553741455078 14.68816661834717 10.71829223632812 16.14127540588379 L 9.768292427062988 16.97278213500977 Z" fill="none" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_brga =
    '<svg viewBox="0.0 0.0 12.0 12.0" ><path transform="translate(0.0, 0.0)" d="M 6 5.797101974487305 C 5.175000190734863 5.797101974487305 4.5 5.526570796966553 3.975000143051147 4.985507488250732 C 3.450000047683716 4.44444465637207 3.1875 3.74879264831543 3.1875 2.898550987243652 C 3.1875 2.048309326171875 3.450000047683716 1.352657079696655 3.975000143051147 0.8115941882133484 C 4.5 0.2705314159393311 5.175000190734863 0 6 0 C 6.825000286102295 0 7.5 0.2705314159393311 8.02500057220459 0.8115941882133484 C 8.550000190734863 1.352657079696655 8.8125 2.048309326171875 8.8125 2.898550987243652 C 8.8125 3.74879264831543 8.550000190734863 4.44444465637207 8.02500057220459 4.985507488250732 C 7.5 5.526570796966553 6.825000286102295 5.797101974487305 6 5.797101974487305 M 0 12.00000095367432 L 0 10.1835765838623 C 0 9.693914413452148 0.1188750043511391 9.275362968444824 0.3562500178813934 8.92753791809082 C 0.593625009059906 8.579710960388184 0.9000000357627869 8.315749168395996 1.274999976158142 8.135266304016113 C 2.112375020980835 7.748792171478271 2.915625095367432 7.458938121795654 3.684375047683716 7.265700817108154 C 4.453125 7.072464942932129 5.224874973297119 6.975846290588379 6 6.975846290588379 C 6.775125026702881 6.975846290588379 7.543875217437744 7.07555627822876 8.30625057220459 7.275363445281982 C 9.068625450134277 7.475169658660889 9.868874549865723 7.761547088623047 10.70625019073486 8.135266304016113 C 11.09362602233887 8.315749168395996 11.40637493133545 8.579710960388184 11.64375019073486 8.92753791809082 C 11.88112545013428 9.275362968444824 12 9.693914413452148 12 10.1835765838623 L 12 12.00000095367432 L 0 12.00000095367432 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
