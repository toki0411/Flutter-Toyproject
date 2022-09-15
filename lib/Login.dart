import 'package:flutter/material.dart';
import 'kakao_login/kakao_login_logout.dart';
import 'kakao_login/main_view_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MyHomePage extends StatefulWidget {

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final viewModel = MainViewModel(KakaoLogin());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffffff),
      body: Stack(
        children: <Widget>[
          Pinned.fromPins(
            Pin(size: 232.0, start: 32.0),
            Pin(size: 75.0, middle: 0.2822),
            child: Text(
              '딱 맞는 동행찾기\n크루에서 시작하세요',
              style: TextStyle(
                fontFamily: 'Source Han Sans KR',
                fontSize: 28,
                color: const Color(0xff191919),
                letterSpacing: -0.7000000000000001,
                fontWeight: FontWeight.w700,
                height: 1.25,
              ),
              textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
              softWrap: false,
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 31.0),
            Pin(size: 49.0, middle: 0.5413),
            child: Container(
              child: ElevatedButton(
                onPressed: ()async {
                  await viewModel.login();
                  setState(() {});
                },
                child: Text(''),
                style: ElevatedButton.styleFrom(
                    primary: Colors.yellow, elevation: 0.0),
              ),
              decoration: BoxDecoration(
                color: const Color(0xffffe500),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.004, 0.079),
            child: SizedBox(
              width: 118.0,
              height: 24.0,
              child: Text(
                '카카오로 시작하기',
                style: TextStyle(
                  fontFamily: 'Source Han Sans KR',
                  fontSize: 16,
                  color: const Color(0xff191919),
                  letterSpacing: -0.4,
                  fontWeight: FontWeight.w500,
                  height: 5,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 31.0),
            Pin(size: 49.0, middle: 0.6186),
            child: Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(''),
                style: ElevatedButton.styleFrom(
                    primary: Colors.green, elevation: 0.0),
              ),
              decoration: BoxDecoration(
                color: const Color(0xff01c73c),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.004, 0.228),
            child: SizedBox(
              width: 118.0,
              height: 24.0,
              child: Text(
                '네이버로 시작하기',
                style: TextStyle(
                  fontFamily: 'Source Han Sans KR',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  letterSpacing: -0.4,
                  height: 5,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
          Pinned.fromPins(
            Pin(start: 32.0, end: 31.0),
            Pin(size: 49.0, middle: 0.6959),
            child: Container(
              child: ElevatedButton(
                onPressed: () {},
                child: Text(''),
                style: ElevatedButton.styleFrom(
                    primary: Colors.black, elevation: 0.0),
              ),
              decoration: BoxDecoration(
                color: const Color(0xff191919),
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.004, 0.378),
            child: SizedBox(
              width: 116.0,
              height: 24.0,
              child: Text(
                'Apple로 시작하기',
                style: TextStyle(
                  fontFamily: 'Source Han Sans KR',
                  fontSize: 16,
                  color: const Color(0xffffffff),
                  letterSpacing: -0.4,
                  height: 5,
                ),
                textHeightBehavior:
                TextHeightBehavior(applyHeightToFirstAscent: false),
                softWrap: false,
              ),
            ),
          ),
          Align(
            alignment: Alignment(0.004, 0.497),
            child: SizedBox(
                width: 150.0,
                height: 17.0,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.transparent, elevation: 0.0),
                  onPressed: () {},
                  child: Text(
                    '로그인 없이 둘러보기',
                    style: TextStyle(
                      fontFamily: 'Source Han Sans KR',
                      fontSize: 12,
                      color: const Color(0xff767676),
                      letterSpacing: -0.30000000000000004,
                      decoration: TextDecoration.underline,
                      height: 6.666666666666667,
                    ),
                    textHeightBehavior:
                    TextHeightBehavior(applyHeightToFirstAscent: false),
                    softWrap: false,
                  ),
                )),
          ),
          Align(
            alignment: Alignment(-0.424, 0.377),
            child: SizedBox(
              width: 14.0,
              height: 16.0,
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 3.7, 0.0, 0.0),
                        child: SizedBox.expand(
                            child: SvgPicture.string(
                              _svg_oxqczl,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Align(
                        alignment: Alignment(0.263, -1.0),
                        child: SizedBox(
                          width: 3.0,
                          height: 4.0,
                          child: SvgPicture.string(
                            _svg_d1f62,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.fromLTRB(0.0, 3.7, 0.0, 0.0),
                        child: SizedBox.expand(
                            child: SvgPicture.string(
                              _svg_oxqczl,
                              allowDrawingOutsideViewBox: true,
                              fit: BoxFit.fill,
                            )),
                      ),
                      Align(
                        alignment: Alignment(0.263, -1.0),
                        child: SizedBox(
                          width: 3.0,
                          height: 4.0,
                          child: SvgPicture.string(
                            _svg_d1f62,
                            allowDrawingOutsideViewBox: true,
                          ),
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.426, 0.083),
            child: SizedBox(
              width: 16.0,
              height: 14.0,
              child: Stack(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      SizedBox.expand(
                          child: SvgPicture.string(
                            _svg_kh04at,
                            allowDrawingOutsideViewBox: true,
                            fit: BoxFit.fill,
                          )),
                      Container(
                        decoration: BoxDecoration(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.426, 0.228),
            child: SizedBox(
              width: 16.0,
              height: 14.0,
              child: SvgPicture.string(
                _svg_lg8fde,
                allowDrawingOutsideViewBox: true,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

const String _svg_oxqczl =
    '<svg viewBox="0.0 3.7 14.0 12.3" ><path transform="translate(0.0, -43.98)" d="M 13.51592826843262 49.34596633911133 C 12.63427257537842 48.51546478271484 11.86658477783203 47.71279144287109 10.24535942077637 47.62984466552734 C 8.937211990356445 47.57441711425781 8.340042114257812 48.34941101074219 7.117193222045898 48.37709045410156 C 5.979561328887939 48.40483856201172 6.064860343933105 47.51898574829102 3.704380035400391 47.76806640625 C 1.656898260116577 47.98947143554688 -0.1348452419042587 49.98265838623047 0.007319128140807152 52.77859497070312 C 0.1495622396469116 55.79586029052734 2.310854911804199 59.97573089599609 4.330060958862305 59.97573089599609 C 5.751940250396729 59.94797515869141 6.093371391296387 59.28376007080078 7.259436130523682 59.28376007080078 C 8.709749221801758 59.28376007080078 9.051022529602051 60.11402893066406 10.18857192993164 59.94797515869141 C 12.15083694458008 59.67137908935547 13.99936389923096 56.65388107299805 13.99936389923096 55.68515014648438 C 12.91867828369141 55.13141632080078 11.83807277679443 54.19028854370117 11.69590950012207 52.61238479614258 C 11.58209896087646 51.03449249267578 12.57748508453369 50.03793334960938 13.51592826843262 49.34596633911133" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_d1f62 =
    '<svg viewBox="6.7 0.0 3.4 3.9" ><path transform="translate(-78.41, 0.0)" d="M 85.12640380859375 3.87528657913208 C 84.98419189453125 2.768182277679443 85.751953125 0.3597072958946228 88.453857421875 0 C 88.76646423339844 1.854578018188477 87.202392578125 3.985989570617676 85.12640380859375 3.87528657913208" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_kh04at =
    '<svg viewBox="0.0 0.0 16.0 14.0" ><path transform="translate(0.0, 0.0)" d="M 7.999998569488525 -4.903999410998949e-07 C 3.581759452819824 -4.903999410998949e-07 0 2.696831941604614 0 6.023640632629395 C 0 8.188786506652832 1.517599940299988 10.08694839477539 3.79535961151123 11.14864253997803 C 3.627999782562256 11.74341678619385 3.189440011978149 13.30388355255127 3.101760149002075 13.63776779174805 C 2.992960214614868 14.05211448669434 3.260800123214722 14.04678153991699 3.436479806900024 13.9352331161499 C 3.574079751968384 13.84791374206543 5.628479957580566 12.51740169525146 6.515200138092041 11.94320011138916 C 6.996320724487305 12.0111665725708 7.492639064788818 12.0471305847168 7.999998569488525 12.0471305847168 C 12.41824054718018 12.0471305847168 15.99999713897705 9.350297927856445 15.99999713897705 6.023640632629395 C 15.99999713897705 2.696831941604614 12.41824054718018 -4.903999410998949e-07 7.999998569488525 -4.903999410998949e-07" fill="#381e1f" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_lg8fde =
    '<svg viewBox="103.0 490.0 16.0 14.0" ><path transform="translate(16298.0, 433.07)" d="M -16189.62109375 70.92613983154297 L -16194.99609375 70.92613983154297 L -16194.99609375 56.92614364624023 L -16189.62109375 56.92614364624023 L -16184.109375 64.47397613525391 L -16184.109375 56.92614364624023 L -16178.99609375 56.92614364624023 L -16178.99609375 70.92613983154297 L -16184.109375 70.92613983154297 L -16189.62109375 64.47397613525391 L -16189.62109375 70.92613983154297 Z" fill="#ffffff" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';



