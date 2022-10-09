import 'package:adobe_xd/pinned.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:group_button/group_button.dart';
import 'package:categorized_dropdown/categorized_dropdown.dart';

class MakePage extends StatefulWidget {
  const MakePage({Key? key}) : super(key: key);

  @override
  State<MakePage> createState() => _MakePageState();
}

class _MakePageState extends State<MakePage> {
  ///** 카테고리 부분  **///
  final List<CategorizedDropdownItem<String>>? items = [
    CategorizedDropdownItem(text: '문화예술', subItems: [
      SubCategorizedDropdownItem(text: '뮤지컬', value: '뮤지컬'),
      SubCategorizedDropdownItem(text: '연극', value: '연극'),
      SubCategorizedDropdownItem(text: '콘서트', value: '콘서트'),
    ]),
    CategorizedDropdownItem(text: '스포츠 경기', subItems: [
      SubCategorizedDropdownItem(text: '야구', value: '야구'),
      SubCategorizedDropdownItem(text: '축구', value: '축구'),
    ]),
    CategorizedDropdownItem(text: '기타', value: '기타'),
  ];
  String? value;

  ///** 나이 버튼 부분 **///
  RangeValues _ageRangeValues = const RangeValues(20, 100);

  ///** 인원 버튼 부분 **///
  double _personalValue = 20;

  ///** 날짜 선택 범위 **//
  DateTimeRange? _selectedDateRange;

  void _show() async {
    final DateTimeRange? result = await showDateRangePicker(
      context: context,
      locale: Locale('ko', 'KO'),
      firstDate: DateTime(2022, 1, 1),
      lastDate: DateTime(2030, 12, 31),
      currentDate: DateTime.now(),
      saveText: 'Done',
    );

    if (result != null) {
      // Rebuild the UI
      print(result.start.toString());
      setState(() {
        _selectedDateRange = result;
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///** AppBar */
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '글쓰기',
          style: TextStyle(
            fontFamily: 'Source Han Sans KR',
            fontSize: 21,
            color: const Color(0xff191919),
            letterSpacing: -1,
            fontWeight: FontWeight.w500,
            height: 2,
          ),
          textHeightBehavior:
              TextHeightBehavior(applyHeightToFirstAscent: false),
          softWrap: false,
        ),
        elevation: 0.0,
        backgroundColor: const Color(0xffffffff),
        actions: [
          TextButton(
              onPressed: () {},
              child: Text(
                '완료',
                style: TextStyle(
                  fontFamily: 'Source Han Sans KR',
                  fontSize: 21,
                  color: const Color(0xffbcbcbc),
                  fontWeight: FontWeight.w500,
                ),
              ))
        ],
      ),
      backgroundColor: const Color(0xffffffff),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: Stack(
          children: <Widget>[
            Pinned.fromPins(
              Pin(size: 375.0, middle: 0.5),
              Pin(start: -100.0, end: 0.0),
              child: SingleChildScrollView(
                primary: false,
                child: SizedBox(
                  width: 375.0,
                  height: 1482.0,
                  child: Stack(
                    children: <Widget>[
                      ///** 사진 적용 버튼 */
                      Pinned.fromPins(
                        Pin(size: 85.0, start: 24.0),
                        Pin(size: 85.0, start: 125.0),
                        child: Container(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: const Color(0x29000000),
                                    elevation: 0),
                                onPressed: () {},
                                child: Text(''))
                            // decoration: BoxDecoration(
                            //   color: const Color(0xfff7f7f7),
                            //   borderRadius: BorderRadius.circular(10.0),
                            // ),
                            ),
                      ),
                      Pinned.fromPins(
                        Pin(size: 22.0, start: 56.0),
                        Pin(size: 20.0, start: 158.0),
                        child: Stack(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                Padding(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 0.0, 0.6, 0.6),

                                  ///** 사진모양 이미지 부분 */
                                  child: SizedBox.expand(
                                      child: SvgPicture.string(
                                    _svg_e7kd7s,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Pinned.fromPins(
                        Pin(start: 24.0, end: 24.0),
                        Pin(size: 1.0, start: 274.0),
                        child: Container(
                          color: const Color(0xffdbdbdb),
                        ),
                      ),

                      ///** 제목을 입력하는 TextField 부분 */
                      Pinned.fromPins(Pin(size: 329.0, start: 24.0),
                          Pin(size: 26.0, start: 250.0),
                          child: TextFormField(
                            decoration: InputDecoration(
                              hintText: '제목',
                              hintStyle: TextStyle(
                                fontFamily: 'Source Han Sans KR',
                                fontSize: 18,
                                color: const Color(0xff999999),
                                letterSpacing: -0.45,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          )),
                      Pinned.fromPins(
                        Pin(size: 65.0, start: 24.0),
                        Pin(size: 26.0, middle: 0.2186),
                        child: Text(
                          '카테고리',
                          style: TextStyle(
                            fontFamily: 'Source Han Sans KR',
                            fontSize: 18,
                            color: const Color(0xff191919),
                            letterSpacing: -0.45,
                            fontWeight: FontWeight.w500,
                          ),
                          softWrap: false,
                        ),
                      ),

                      ///** 카테고리버튼 부분 태그 버튼 **//
                      Pinned.fromPins(Pin(size: 300.0, start: 24.0),
                          Pin(size: 45.0, middle: 0.2347),
                          child: Container(
                            child:
                            CategorizedDropdown(
                              items: items,
                              value: value,
                              hint: const Text('카테고리를 선택해 주세요',
                              style: TextStyle(
                                fontSize: 13
                              ),),
                              onChanged: (v) {
                                setState(() {
                                  value = value;
                                });
                              },
                            ),
                          )),
                      Pinned.fromPins(
                        Pin(size: 330.0, start: 25),
                        Pin(size: 1200.0, middle: 1.4),
                        child: Column(
                          children: [
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      '내용',
                                      style: TextStyle(
                                        fontFamily: 'Source Han Sans KR',
                                        fontSize: 18,
                                        color: const Color(0xff191919),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            ///** 내용작성 텍스트 필드 **//
                            Container(
                              child: ConstrainedBox(
                                constraints: BoxConstraints(
                                  maxHeight: 300.0,
                                ),
                                child: Scrollbar(
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    reverse: true,
                                    child: TextField(
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        fillColor: const Color(0xfff7f7f7),
                                        filled: true,
                                      ),
                                      minLines: 10,
                                      maxLines: null,
                                      maxLength: 300,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Column(
                                  children: [
                                    Text(
                                      '날짜',
                                      style: TextStyle(
                                        fontFamily: 'Source Han Sans KR',
                                        fontSize: 18,
                                        color: const Color(0xff191919),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            ///*** 날짜 선택 부분 ** //
                            Container(
                                width: 375,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    ///** 날짜 버튼 **///
                                    TextButton(
                                      onPressed: _show,
                                      child: Text('선택하기'),
                                    ),

                                    ///** 시작 날짜 **//
                                    Text(
                                      "시작 날짜: ${_selectedDateRange?.start.toString().split(' ')[0]}",
                                      style: const TextStyle(
                                        fontFamily: 'Source Han Sans KR',
                                        fontSize: 18,
                                        color: const Color(0xff191919),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    ),

                                    ///** 끝나는 날짜 **//
                                    Text(
                                      "종료 날짜: ${_selectedDateRange?.end.toString().split(' ')[0]}",
                                      style: const TextStyle(
                                        fontFamily: 'Source Han Sans KR',
                                        fontSize: 18,
                                        color: const Color(0xff191919),
                                        fontWeight: FontWeight.w500,
                                      ),
                                    )
                                  ],
                                )),
                            SizedBox(
                              height: 10,
                            ),

                            ///** 지역 지정 버튼 **/
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  '지역',
                                  style: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 18,
                                    color: const Color(0xff191919),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),

                            ///*** 지역 버튼  **/
                            /// Used multiselctedlibary **//
                            Container(
                              width: 370,
                              padding: EdgeInsets.all(6),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: const Color(0xffdbdbdb))),
                              child: GroupButton(
                                buttons: const [
                                  '서울',
                                  '경기',
                                  '인천',
                                  '강원',
                                  '대전',
                                  '세종',
                                  '충남',
                                  '중북',
                                  '부산',
                                  '울산',
                                  '경남',
                                  '경북',
                                  '대구',
                                  '광주',
                                  '전남',
                                  '전북',
                                  '제주',
                                  '해외',
                                  '기타'
                                ],
                                options: GroupButtonOptions(
                                    mainGroupAlignment:
                                        MainGroupAlignment.start,
                                    elevation: 0.0,
                                    buttonWidth: 54,
                                    unselectedShadow: const [],
                                    unselectedColor: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Container(
                                child: Text(
                                  '성별',
                                  style: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 18,
                                    color: const Color(0xff191919),
                                    fontWeight: FontWeight.w500,
                                  ),
                                  softWrap: false,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: 370,
                              child: GroupButton(
                                buttons: ['누구나', '남자', '여자'],
                                options: GroupButtonOptions(
                                    mainGroupAlignment:
                                        MainGroupAlignment.start,
                                    elevation: 0.0,
                                    buttonHeight: 20,
                                    unselectedShadow: const [],
                                    unselectedColor: Color(0xffffffff),
                                    borderRadius: BorderRadius.circular(10)),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),

                            ///** 나이 선택 부분 **//
                            Align(
                              alignment: Alignment.topLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    child: Text(
                                      '나이 ${_ageRangeValues.start.round()}살 부터 ${_ageRangeValues.end.round()}살까지',
                                      style: TextStyle(
                                        fontFamily: 'Source Han Sans KR',
                                        fontSize: 18,
                                        color: const Color(0xff191919),
                                        fontWeight: FontWeight.w500,
                                      ),
                                      softWrap: false,
                                    ),
                                  ),

                                  ///*** 나이 슬라이드 버튼 부분 **//
                                  RangeSlider(
                                    activeColor: const Color(0xff1677ff),
                                    values: _ageRangeValues,
                                    min: 20,
                                    max: 100,
                                    divisions: 80,
                                    labels: RangeLabels(
                                      _ageRangeValues.start.round().toString(),
                                      _ageRangeValues.end.round().toString(),
                                    ),
                                    onChanged: (RangeValues values) {
                                      setState(() {
                                        _ageRangeValues = values;
                                      });
                                    },
                                  ),
                                  ///** 인원 선택 버튼 ** ///
                                  Text(
                                    '인원 ${_personalValue.round()}명',
                                    style: TextStyle(
                                      fontFamily: 'Source Han Sans KR',
                                      fontSize: 18,
                                      color: const Color(0xff191919),
                                      fontWeight: FontWeight.w500,
                                    ),
                                    softWrap: false,
                                  ),
                                  Slider(
                                    value: _personalValue,
                                    max: 100,
                                    divisions: 100,
                                    label: _personalValue.round().toString(),
                                    onChanged: (double value) {
                                      setState(() {
                                        _personalValue = value;
                                      });
                                    },
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

const String _svg_e7kd7s =
    '<svg viewBox="0.0 0.0 21.4 19.4" ><path  d="M 10.71801376342773 15.48022556304932 C 12.00417613983154 15.48022556304932 13.08508777618408 15.03955078125 13.96021270751953 14.15874195098877 C 14.83534049987793 13.27793121337891 15.27317142486572 12.19000339508057 15.27317142486572 10.89548969268799 C 15.27317142486572 9.583175659179688 14.83534049987793 8.490928649902344 13.96021270751953 7.618751049041748 C 13.08508777618408 6.746572971343994 12.00417613983154 6.310752391815186 10.71801376342773 6.310752391815186 C 9.414167404174805 6.310752391815186 8.32896900177002 6.746572971343994 7.462417125701904 7.618751049041748 C 6.595866203308105 8.490928649902344 6.162858486175537 9.583175659179688 6.162858486175537 10.89548969268799 C 6.162858486175537 12.19000339508057 6.595866203308105 13.27793121337891 7.462417125701904 14.15874195098877 C 8.32896900177002 15.03955078125 9.414167404174805 15.48022556304932 10.71801376342773 15.48022556304932 M 1.607702136039734 19.41769981384277 C 1.17898166179657 19.41769981384277 0.8038510680198669 19.25588989257812 0.4823106527328491 18.93226051330566 C 0.1607702076435089 18.6086311340332 0 18.2310619354248 0 17.79956245422363 L 0 3.964447498321533 C 0 3.550742864608765 0.1607702076435089 3.178030490875244 0.4823106527328491 2.845232963562012 C 0.8038510680198669 2.512434720993042 1.17898166179657 2.34630560874939 1.607702136039734 2.34630560874939 L 5.546572685241699 2.34630560874939 L 7.502609729766846 0 L 13.93342018127441 0 L 15.88945865631104 2.34630560874939 L 19.82832717895508 2.34630560874939 C 20.23936080932617 2.34630560874939 20.60967063903809 2.512434720993042 20.94032096862793 2.845232963562012 C 21.27096939086914 3.178030490875244 21.43602752685547 3.550742864608765 21.43602752685547 3.964447498321533 L 21.43602752685547 17.79956245422363 C 21.43602752685547 18.2310619354248 21.27096939086914 18.6086311340332 20.94032096862793 18.93226051330566 C 20.60967063903809 19.25588989257812 20.23936080932617 19.41769981384277 19.82832717895508 19.41769981384277 L 1.607702136039734 19.41769981384277 Z" fill="#999999" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_huyrgp =
    '<svg viewBox="3.9 5.0 7.4 4.5" ><path transform="translate(-57.79, -859.83)" d="M 61.6865234375 867.0300903320312 L 64.17849731445312 869.2877807617188 L 69.10468292236328 864.8369140625" fill="none" stroke="#ffffff" stroke-width="2" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_o57k4q =
    '<svg viewBox="24.0 65.0 19.0 19.0" ><path transform="translate(24.0, 65.0)" d="M 17.5384635925293 0.0003032684326171875 L 9.500000953674316 8.038764953613281 L 1.461538672447205 0.0003032684326171875 L 0 1.461841940879822 L 8.03846263885498 9.499607086181641 L 0 17.53876686096191 L 1.461538672447205 19.00030326843262 L 9.500000953674316 10.96184158325195 L 17.5384635925293 19.00030326843262 L 19 17.53876686096191 L 10.96153926849365 9.499607086181641 L 19 1.461841940879822 L 17.5384635925293 0.0003032684326171875 Z" fill="#000000" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
