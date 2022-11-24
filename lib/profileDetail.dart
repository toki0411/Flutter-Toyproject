import 'package:blackup/postList.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/svg.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> {
  /// PageView Page 컨트롤 ///
  final PageController _pageController = PageController();
  /// 신고하기 TextField  알림 창 부분 ///
  Future openDialog() => showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("신고하기"),
        content: TextField(
          decoration: InputDecoration(
            hintText: "신고사유를 입력해 주세요"
          ),
        ),
        actions: [
          TextButton(
              onPressed: (){},
              child: Text("제출"))
        ],
        
      )
  );

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    child: TextButton(onPressed: (){
                      openDialog();
                    },
                        child: Text("신고하기"))
                  ),
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
                            child: CircleAvatar())
                    ),
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
                                onPressed: (){}, icon: Icon(Icons.abc),
                              ),
                              IconButton(
                                onPressed: (){}, icon: Icon(Icons.abc),
                              ),
                              IconButton(
                                onPressed: (){}, icon: Icon(Icons.abc),
                              ),
                              IconButton(
                                onPressed: (){}, icon: Icon(Icons.abc),
                              )
                            ],
                          ),
                        ))
                  ],
                )
              ),
              /// 이름 및 나이 부분 ///
              Container(
                width: 375,
                height: 50,
                color: Colors.purple,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("김대구"),
                    Text("여자 . 23세")
                  ],
                ),
              ),
              /// 자기 소개 부분 ///
              Container(
                width: 375,
                height: 70,
                color: Colors.grey,
                child: Text(
                  "안녕하세요안녕하세요안"
                ),
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
                      onPressed: (){
                        if(_pageController.hasClients)
                          {
                            _pageController.animateToPage(0,
                                duration: const Duration(
                                  milliseconds: 400
                                ),
                                curve: Curves.easeInOut);
                          }
                      },
                      child: Text("작성한글"),
                    ),
                    TextButton(
                      onPressed: (){
                        if(_pageController.hasClients)
                        {
                          _pageController.animateToPage(
                              1,
                              duration: const Duration(
                                  milliseconds: 400
                              ),
                              curve: Curves.easeInOut);
                        }
                      },
                      child: Text("참여중"),
                    ),
                    TextButton(
                      onPressed: (){
                        if(_pageController.hasClients)
                        {
                          _pageController.animateToPage(
                              2,
                              duration: const Duration(
                                  milliseconds: 400
                              ),
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
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffededed)))),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              margin: EdgeInsets.fromLTRB(0, 3, 0, 20),
                              height: 130.0,
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
                                        '부산국제 페스티벌',
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
                                    alignment: Alignment(0.05, -0.2),
                                    child: SizedBox(
                                      width: 100.0,
                                      height: 17.0,
                                      child: Text(
                                        '부산 ·  9.13(월)',
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
                                    alignment: Alignment(0.1, 0.728),
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
                                    alignment: Alignment(0.97, 0.728),
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
                                              '1/2',
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
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                              ),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      ///  참여중 페이지 부분  ///
                      child: Container(
                        width: 375,
                        height: 500,
                        color: Colors.yellow,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffededed)))),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              margin: EdgeInsets.fromLTRB(0, 3, 0, 20),
                              height: 130.0,
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
                                        '부산국제 페스티벌',
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
                                    alignment: Alignment(0.05, -0.2),
                                    child: SizedBox(
                                      width: 100.0,
                                      height: 17.0,
                                      child: Text(
                                        '부산 ·  9.13(월)',
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
                                    alignment: Alignment(0.1, 0.728),
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
                                    alignment: Alignment(0.97, 0.728),
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
                                              '1/2',
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
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                              ),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SingleChildScrollView(
                      /// 참야완료 페이지 부분 ///
                      child: Container(
                        width: 375,
                        height: 500,
                        color: Colors.green,
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                          color: Color(0xffededed)))),
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              margin: EdgeInsets.fromLTRB(0, 3, 0, 20),
                              height: 130.0,
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
                                        '부산국제 페스티벌',
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
                                    alignment: Alignment(0.05, -0.2),
                                    child: SizedBox(
                                      width: 100.0,
                                      height: 17.0,
                                      child: Text(
                                        '부산 ·  9.13(월)',
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
                                    alignment: Alignment(0.1, 0.728),
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
                                    alignment: Alignment(0.97, 0.728),
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
                                              '1/2',
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
                                            child: ClipRRect(
                                              borderRadius: BorderRadius.circular(10),
                                              child: Image(
                                                image: NetworkImage(
                                                    'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl.jpg'),
                                              ),
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
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )
              )

            ],
          ),
        ),
      ),
    );
  }
}
