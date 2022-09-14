import 'package:flutter/material.dart';
import 'package:adobe_xd/pinned.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

_MyPageState? pageState;
class MyPage extends StatefulWidget {
  const MyPage({Key? key}) : super(key: key);

  @override
  //State<MyPage> createState() => _MyPageState();
  _MyPageState createState() {
    pageState = _MyPageState();
    return pageState!;
  }
}

class _MyPageState extends State<MyPage> {
   File? _image;
   FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
   User? _user;
   UploadTask? uploadTask;
   FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
   String _profileImageURL = "";

   @override
   void initState() {
     super.initState();
     _prepareService();
   }
   void _prepareService() async {
     _user = await _firebaseAuth.currentUser!;
   }
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: const Color(0xffffffff),
        body: GestureDetector(
          onTap: (){
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
                    width: 375.0,
                    height: 1065.0,
                    child: Stack(
                      children: <Widget>[
                        Pinned.fromPins(
                          Pin(size: 96.0, middle: 0.4982),
                          Pin(size: 96.0, start: 130.0),
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Padding(
                                    padding:
                                    EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 17.2),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 11.2, end: 10.0),
                                    Pin(size: 32.1, end: 0.0),
                                    child: SvgPicture.string(
                                      _svg_ma91rn,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  //** 프로필 사진 부분 CircleAvatar */
                                  Align(
                                    alignment: Alignment(-0.041, -0.03),
                                    child: SizedBox(
                                      width: 71.0,
                                      height: 71.0,
                                      child:  CircleAvatar(
                                        backgroundImage:
                                        (_image != null) ? FileImage(_image!)as ImageProvider : NetworkImage(""),
                                        radius: 30,
                                        ),
                                      ),
                                    ),
                                  ],
                                  ),
                                ],
                              ),
                        ),

                        Container(
                          decoration: BoxDecoration(
                            color: const Color(0xffffffff),
                            borderRadius: BorderRadius.circular(30.0),
                            border: Border.all(
                                width: 2.0, color: const Color(0xffdbdbdb)),
                          ),
                          margin: EdgeInsets.fromLTRB(206.0, 197.0, 169.0, 903.0),
                        ),
                        //**프로필 사진 카메라 변경부분 버튼*/
                        Pinned.fromPins(
                          Pin(size: 15.0, middle: 0.5917),
                          Pin(size: 14.0, start: 203.0),
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: SvgPicture.string(
                                        _svg_vmw9m4,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      )),
                                  ElevatedButton(
                                      onPressed: () {
                                        _uploadImageToStorage(ImageSource.gallery);
                                      },
                                      style: ElevatedButton.styleFrom(
                                          primary: Colors.transparent, elevation: 0.0),
                                      child: Text(''))
                                ],
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 29.0, start: 24.0),
                          Pin(size: 24.0, middle: 0.2314),
                          child: Text(
                            '이름',
                            style: TextStyle(
                              fontFamily: 'Source Han Sans KR',
                              fontSize: 16,
                              color: const Color(0xff191919),
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 24.0, end: 24.0),
                          Pin(size: 48.0, middle: 0.27),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 106.0, start: 24.0),
                          Pin(size: 24.0, middle: 0.3318),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Source Han Sans KR',
                                fontSize: 16,
                                color: const Color(0xff191919),
                              ),
                              children: [
                                TextSpan(
                                  text: '성별',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '(수정불가) ',
                                  style: TextStyle(
                                    color: const Color(0xffc5c5c5),
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        //** 성별 버튼 남 여
                        Pinned.fromPins(
                          Pin(size: 163.0, start: 25.0),
                          Pin(size: 48.0, middle: 0.3726),
                          child: Container(
                            child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent, elevation: 0.0),
                                child: Text('')),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(-0.45, -0.249),
                          child: SizedBox(
                            width: 15.0,
                            height: 24.0,
                            child: Text(
                              '남',
                              style: TextStyle(
                                fontFamily: 'Source Han Sans KR',
                                fontSize: 16,
                                color: const Color(0xff191919),
                                letterSpacing: -0.4,
                                fontWeight: FontWeight.w500,
                                height: 5,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 163.0, end: 24.0),
                          Pin(size: 48.0, middle: 0.3726),
                          child: Container(
                            child: ElevatedButton(
                                onPressed: (){},
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.transparent, elevation: 0.0),
                                child: Text('')),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topRight: Radius.circular(10.0),
                                bottomRight: Radius.circular(10.0),
                              ),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment(0.456, -0.249),
                          child: SizedBox(
                            width: 15.0,
                            height: 24.0,
                            child: Text(
                              '여',
                              style: TextStyle(
                                fontFamily: 'Source Han Sans KR',
                                fontSize: 16,
                                color: const Color(0xff191919),
                                letterSpacing: -0.4,
                                fontWeight: FontWeight.w500,
                                height: 5,
                              ),
                              textHeightBehavior: TextHeightBehavior(
                                  applyHeightToFirstAscent: false),
                              softWrap: false,
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 103.0, start: 24.0),
                          Pin(size: 24.0, middle: 0.4312),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Source Han Sans KR',
                                fontSize: 16,
                                color: const Color(0xff191919),
                              ),
                              children: [
                                TextSpan(
                                  text: '나이',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: '(수정불가)',
                                  style: TextStyle(
                                    color: const Color(0xffc5c5c5),
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        //** 나이 TextField */
                        Pinned.fromPins(
                          Pin(size: 71.0, start: 24.0),
                          Pin(size: 48.0, middle: 0.4753),
                          child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                border: Border.all(
                                    width: 1.0, color: const Color(0xffdbdbdb)),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(9.0),
                                child: TextFormField(
                                  decoration: InputDecoration(
                                      border: InputBorder.none
                                  ),
                                ),
                              )
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(start: 24.0, end: 24.0),
                          Pin(size: 109.0, middle: 0.6125),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 59.0, start: 24.0),
                          Pin(size: 24.0, middle: 0.5316),
                          child: Text(
                            '자기소개',
                            style: TextStyle(
                              fontFamily: 'Source Han Sans KR',
                              fontSize: 16,
                              color: const Color(0xff191919),
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                        //* 자기소개 TextField */
                        Pinned.fromPins(
                            Pin(size: 300.0, start: 36.0),
                            Pin(size: 200.0, middle: 0.6762),
                            child:
                            TextFormField(
                              minLines: 1,
                              maxLines: 4,
                              decoration: InputDecoration(
                                  hintText: '자기소개를 입력하세요',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 16,
                                    color: const Color(0xff999999),
                                  ),
                                  border: InputBorder.none
                              ),
                            )
                        ),
                        Pinned.fromPins(
                          Pin(size: 75.0, start: 24.0),
                          Pin(size: 24.0, middle: 0.6887),
                          child: Text.rich(
                            TextSpan(
                              style: TextStyle(
                                fontFamily: 'Source Han Sans KR',
                                fontSize: 16,
                                color: const Color(0xff191919),
                              ),
                              children: [
                                TextSpan(
                                  text: 'SNS',
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                TextSpan(
                                  text: ' ',
                                  style: TextStyle(
                                    color: const Color(0xff000000),
                                  ),
                                ),
                                TextSpan(
                                  text: '(선택)',
                                  style: TextStyle(
                                    color: const Color(0xffc5c5c5),
                                  ),
                                ),
                              ],
                            ),
                            textHeightBehavior:
                            TextHeightBehavior(applyHeightToFirstAscent: false),
                            softWrap: false,
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 18.0, start: 31.0),
                          Pin(size: 18.0, middle: 0.7878),
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(size: 10.0, middle: 0.3814),
                                    Pin(start: 0.0, end: 0.0),
                                    child: SvgPicture.string(
                                      _svg_ycxwyu,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Pinned.fromPins(
                                    Pin(start: 0.0, end: 0.0),
                                    Pin(size: 8.0, middle: 0.4578),
                                    child: Container(
                                      decoration: BoxDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 18.0, start: 31.0),
                          Pin(size: 18.0, middle: 0.7394),
                          child: Stack(
                            children: <Widget>[
                              SizedBox.expand(
                                  child: SvgPicture.string(
                                    _svg_f0mu4g,
                                    allowDrawingOutsideViewBox: true,
                                    fit: BoxFit.fill,
                                  )),
                              Padding(
                                padding: EdgeInsets.all(4.5),
                                child: SizedBox.expand(
                                    child: SvgPicture.string(
                                      _svg_q4ma23,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    )),
                              ),
                              Align(
                                alignment: Alignment(0.597, -0.623),
                                child: SizedBox(
                                  width: 2.0,
                                  height: 2.0,
                                  child: SvgPicture.string(
                                    _svg_muft33,
                                    allowDrawingOutsideViewBox: true,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 20.0, start: 30.0),
                          Pin(size: 16.0, end: 176.0),
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  SizedBox.expand(
                                      child: SvgPicture.string(
                                        _svg_bnjt0o,
                                        allowDrawingOutsideViewBox: true,
                                        fit: BoxFit.fill,
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //** SNS 아이콘 부분 */
                        Pinned.fromPins(
                          Pin(size: 23.0, start: 29.0),
                          Pin(size: 10.0, end: 124.0),
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Pinned.fromPins(
                                    Pin(size: 5.9, start: 0.0),
                                    Pin(size: 7.4, start: 0.6),
                                    child: SvgPicture.string(
                                      _svg_p6p15z,
                                      allowDrawingOutsideViewBox: true,
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(-0.37, -0.679),
                                    child: SizedBox(
                                      width: 3.0,
                                      height: 7.0,
                                      child: SvgPicture.string(
                                        _svg_wlqjp,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment(0.209, 0.135),
                                    child: SizedBox(
                                      width: 6.0,
                                      height: 5.0,
                                      child: SvgPicture.string(
                                        _svg_zk91h,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: SizedBox(
                                      width: 6.0,
                                      height: 8.0,
                                      child: SvgPicture.string(
                                        _svg_l9jw0k,
                                        allowDrawingOutsideViewBox: true,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        //** SNS TextFormField */
                        Pinned.fromPins(
                          Pin(size: 272.0, end: 41.0),
                          Pin(size: 40.0, middle: 0.7443),
                          child: Container(
                            child:
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 15,
                                    color: const Color(0xff999999),
                                  ),
                                  border: InputBorder.none
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 272.0, end: 41.0),
                          Pin(size: 40.0, end: 164.0),
                          child: Container(
                            child:
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 15,
                                    color: const Color(0xff999999),
                                  ),
                                  border: InputBorder.none
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 272.0, end: 41.0),
                          Pin(size: 40.0, middle: 0.7962),
                          child: Container(
                            child:
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 15,
                                    color: const Color(0xff999999),
                                  ),
                                  border: InputBorder.none
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 272.0, end: 41.0),
                          Pin(size: 40.0, end: 109.0),
                          child: Container(
                            child:
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: '',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 15,
                                    color: const Color(0xff999999),
                                  ),
                                  border: InputBorder.none
                              ),
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              border: Border.all(
                                  width: 1.0, color: const Color(0xffdbdbdb)),
                            ),
                          ),
                        ),
                        //** 완료버튼 */
                        Pinned.fromPins(
                          Pin(start: 24.0, end: 24.0),
                          Pin(size: 49.0, end: 35.0),
                          child: Container(
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  primary: Colors.transparent, elevation: 0.0),
                              onPressed: () {}, child: null,
                            ),
                            decoration: BoxDecoration(
                              color: const Color(0xffededed),
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        ),
                        Pinned.fromPins(
                          Pin(size: 33.0, middle: 0.5),
                          Pin(size: 26.0, end: 47.0),
                          child: Text(
                            '완료',
                            style: TextStyle(
                              fontFamily: 'Source Han Sans KR',
                              fontSize: 18,
                              color: const Color(0xffffffff),
                              fontWeight: FontWeight.w500,
                            ),
                            softWrap: false,
                          ),
                        ),
                        //** 프로필 이름 입력 TextField */
                        Pinned.fromPins(
                            Pin(size: 130.0, start: 36.0),
                            Pin(size: 30.0, middle: 0.2791),
                            child:
                            TextFormField(
                              decoration: InputDecoration(
                                  hintText: '이름을 입력하세요',
                                  hintStyle: TextStyle(
                                    fontFamily: 'Source Han Sans KR',
                                    fontSize: 15,
                                    color: const Color(0xff999999),
                                  ),
                                  border: InputBorder.none
                              ),
                            )
                        ),
                        Pinned.fromPins(
                          Pin(start: 0.0, end: 0.0),
                          Pin(size: 106.0, start: 0.0),
                          child: Stack(
                            children: <Widget>[
                              Stack(
                                children: <Widget>[
                                  Stack(
                                    children: <Widget>[
                                      Container(
                                        color: const Color(0xffffffff),
                                        margin:
                                        EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 1.0),
                                      ),
                                      Pinned.fromPins(
                                        Pin(start: 0.0, end: 0.0),
                                        Pin(size: 60.0, end: 0.0),
                                        child: Container(
                                          color: const Color(0xffffffff),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment(-0.573, 0.584),
                                        child: SizedBox(
                                          width: 94.0,
                                          height: 29.0,
                                          child: Text(
                                            '프로필 설정',
                                            style: TextStyle(
                                              fontFamily: 'Source Han Sans KR',
                                              fontSize: 20,
                                              color: const Color(0xff191919),
                                              letterSpacing: -0.5,
                                              fontWeight: FontWeight.w500,
                                              height: 4,
                                            ),
                                            textHeightBehavior: TextHeightBehavior(
                                                applyHeightToFirstAscent: false),
                                            softWrap: false,
                                          ),
                                        ),
                                      ),
                                      Pinned.fromPins(
                                        Pin(size: 28.0, start: 24.0),
                                        Pin(size: 28.0, middle: 0.7949),
                                        child: Stack(
                                          children: <Widget>[
                                            SizedBox.expand(
                                                child: SvgPicture.string(
                                                  _svg_u7ytpg,
                                                  allowDrawingOutsideViewBox: true,
                                                  fit: BoxFit.fill,
                                                )),
                                            Pinned.fromPins(
                                              Pin(start: 3.5, end: 3.5),
                                              Pin(size: 14.0, middle: 0.5),
                                              child: SvgPicture.string(
                                                _svg_xsfw,
                                                allowDrawingOutsideViewBox: true,
                                                fit: BoxFit.fill,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
   Future _uploadImageToStorage(ImageSource source) async { //프로필 사진 업로드 및 파베에 올리기
     final image = await ImagePicker().pickImage(source: source);
     if (image == null) return;
     setState(() {
       _image = File(image.path);
     });
     // 프로필 사진을 업로드할 경로와 파일명을 정의. 사용자의 uid를 이용하여 파일명의 중복 가능성 제거
     Reference storageReference =
     _firebaseStorage.ref().child("profile/${_user?.uid}");
     // 파일 업로드
     UploadTask storageUploadTask = storageReference.putFile(_image!);
     // 파일 업로드 완료까지 대기
     await storageUploadTask;
     // 업로드한 사진의 URL 획득
     String downloadURL = await storageReference.getDownloadURL();
     // 업로드된 사진의 URL을 페이지에 반영
     setState(() {
       _profileImageURL = downloadURL;
     });
   }

}



const String _svg_gb8dxv =
    '<svg viewBox="0.0 0.0 96.0 78.8" ><path transform="translate(0.0, 0.0)" d="M 49.30051040649414 63.92406463623047 C 64.58856201171875 63.92406463623047 78.06349945068359 69.20203399658203 86.01364898681641 77.22811889648438 C 92.25038909912109 69.12845611572266 95.99763488769531 59.01395034790039 95.99763488769531 48.00000381469727 C 95.99763488769531 21.49154663085938 74.50846862792969 0 48.00000381469727 0 C 21.48917388916016 0 0 21.49154663085938 0 48.00000381469727 C 0 59.72353363037109 4.214773654937744 70.45507049560547 11.19430541992188 78.78968811035156 C 18.8881664276123 69.90448760986328 33.05132675170898 63.92406463623047 49.30051040649414 63.92406463623047" fill="#f1f1f5" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ma91rn =
    '<svg viewBox="11.2 63.9 74.8 32.1" ><path transform="translate(6.48, 36.99)" d="M 41.52132415771484 59.01194000244141 C 57.01821517944336 59.01194000244141 70.75894927978516 51.63846206665039 79.53497314453125 40.24005889892578 C 71.58482360839844 32.21633148193359 58.1098747253418 26.93599700927734 42.82183456420898 26.93599700927734 C 26.57501602172852 26.93599700927734 12.41186046600342 32.91641998291016 4.717999935150146 41.80162048339844 C 13.52251052856445 52.3148193359375 26.73401832580566 59.01194000244141 41.52132415771484 59.01194000244141" fill="#fcfcfc" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_q8jazf =
    '<svg viewBox="21.5 21.8 51.1 51.1" ><path transform="translate(12.45, 12.59)" d="M 60.20235061645508 34.73867797851562 C 60.20235061645508 48.85911560058594 48.75411605834961 60.30734634399414 34.6336784362793 60.30734634399414 C 20.51086044311523 60.30734634399414 9.064999580383301 48.85911560058594 9.064999580383301 34.73867797851562 C 9.064999580383301 20.61823463439941 20.51086044311523 9.169999122619629 34.6336784362793 9.169999122619629 C 48.75411605834961 9.169999122619629 60.20235061645508 20.61823463439941 60.20235061645508 34.73867797851562" fill="#fcfcfc" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_vmw9m4 =
    '<svg viewBox="0.0 -0.2 14.6 13.6" ><path transform="translate(0.0, -0.17)" d="M 7.307736873626709 10.83615779876709 C 8.184665679931641 10.83615779876709 8.921650886535645 10.52768516540527 9.518326759338379 9.91111946105957 C 10.11500453948975 9.294551849365234 10.41352558135986 8.533001899719238 10.41352558135986 7.626842498779297 C 10.41352558135986 6.70822286605835 10.11500453948975 5.943650245666504 9.518326759338379 5.333125591278076 C 8.921650886535645 4.722600936889648 8.184665679931641 4.417526721954346 7.307736873626709 4.417526721954346 C 6.418750286102295 4.417526721954346 5.678842544555664 4.722600936889648 5.088011741638184 5.333125591278076 C 4.497181415557861 5.943650245666504 4.201948642730713 6.70822286605835 4.201948642730713 7.626842498779297 C 4.201948642730713 8.533001899719238 4.497181415557861 9.294551849365234 5.088011741638184 9.91111946105957 C 5.678842544555664 10.52768516540527 6.418750286102295 10.83615779876709 7.307736873626709 10.83615779876709 M 1.096160531044006 13.5923900604248 C 0.8038510680198669 13.5923900604248 0.5480802655220032 13.47912311553955 0.3288481533527374 13.25258159637451 C 0.1096160560846329 13.02604198455811 0 12.76174354553223 0 12.45969295501709 L 0 2.775113105773926 C 0 2.485519886016846 0.1096160560846329 2.224621295928955 0.3288481533527374 1.991662979125977 C 0.5480802655220032 1.758704304695129 0.8038510680198669 1.642413854598999 1.096160531044006 1.642413854598999 L 3.781754016876221 1.642413854598999 L 5.115415573120117 0 L 9.500059127807617 0 L 10.83372116088867 1.642413854598999 L 13.51931285858154 1.642413854598999 C 13.79956340789795 1.642413854598999 14.05204772949219 1.758704304695129 14.27749156951904 1.991662979125977 C 14.50293350219727 2.224621295928955 14.61547374725342 2.485519886016846 14.61547374725342 2.775113105773926 L 14.61547374725342 12.45969295501709 C 14.61547374725342 12.76174354553223 14.50293350219727 13.02604198455811 14.27749156951904 13.25258159637451 C 14.05204772949219 13.47912311553955 13.79956340789795 13.5923900604248 13.51931285858154 13.5923900604248 L 1.096160531044006 13.5923900604248 Z" fill="#999999" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_ycxwyu =
    '<svg viewBox="3.1 0.0 10.0 18.0" ><path transform="translate(-126.03, -512.07)" d="M 137.0518188476562 515.0713500976562 L 139.0769805908203 515.0713500976562 L 139.0769805908203 512.0718383789062 L 136.5621032714844 512.0718383789062 L 136.5621032714844 512.0718383789062 L 136.0423583984375 512.0718383789062 C 136.0423583984375 512.0718383789062 134.1346435546875 512.0272216796875 132.9188232421875 513.5164794921875 C 132.9188232421875 513.5164794921875 132.0899810791016 514.2529907226562 132.0773468017578 516.4083251953125 L 132.0768127441406 516.4083251953125 L 132.0768127441406 518.6583862304688 L 129.0769805908203 518.6583862304688 L 129.0769805908203 521.8435668945312 L 132.0768127441406 521.8435668945312 L 132.0768127441406 530.0717163085938 L 135.5353088378906 530.0717163085938 L 135.5353088378906 521.8435668945312 L 138.5114440917969 521.8435668945312 L 138.9269104003906 518.6583862304688 L 135.5353088378906 518.6583862304688 L 135.5353088378906 516.4083251953125 L 135.5347900390625 516.4083251953125 C 135.5437316894531 516.1572265625 135.6622009277344 515.0484619140625 137.0518188476562 515.0713500976562 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_f0mu4g =
    '<svg viewBox="0.0 0.1 18.0 18.0" ><path transform="translate(0.0, 0.09)" d="M 12.4542760848999 -0.001000000163912773 L 5.546070575714111 -0.001000000163912773 C 2.482875347137451 -0.001000000163912773 0 2.482085466384888 0 5.545760154724121 L 0 12.4537181854248 C 0 15.51634788513184 2.482875347137451 17.99908447265625 5.546070575714111 17.99908447265625 L 12.4542760848999 17.99908447265625 C 15.51747131347656 17.99908447265625 18.00000190734863 15.51634788513184 18.00000190734863 12.4537181854248 L 18.00000190734863 5.545760154724121 C 18.00000190734863 2.482085466384888 15.51747131347656 -0.001000000163912773 12.4542760848999 -0.001000000163912773 M 16.27242469787598 11.79037284851074 C 16.27242469787598 14.26615619659424 14.26529693603516 16.27174949645996 11.79146289825439 16.27174949645996 L 6.208970069885254 16.27174949645996 C 3.733657836914062 16.27174949645996 1.727138042449951 14.26615619659424 1.727138042449951 11.79037284851074 L 1.727138042449951 6.207800388336182 C 1.727138042449951 3.733755826950073 3.733657836914062 1.7264244556427 6.208970069885254 1.7264244556427 L 11.79146289825439 1.7264244556427 C 14.26529693603516 1.7264244556427 16.27242469787598 3.733755826950073 16.27242469787598 6.207800388336182 L 16.27242469787598 11.79037284851074 Z" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_q4ma23 =
    '<svg viewBox="4.5 4.4 9.5 9.5" ><path transform="translate(-47.26, -44.97)" d="M 56.50582885742188 49.35698699951172 C 53.88665008544922 49.35698699951172 51.76399993896484 51.47897720336914 51.76399993896484 54.09801483154297 C 51.76399993896484 56.71575546264648 53.88665008544922 58.83921813964844 56.50582885742188 58.83921813964844 C 59.12413024902344 58.83921813964844 61.24686813354492 56.71575546264648 61.24686813354492 54.09801483154297 C 61.24686813354492 51.47897720336914 59.12413024902344 49.35698699951172 56.50582885742188 49.35698699951172 M 56.50582885742188 56.95054244995117 C 54.92916107177734 56.95054244995117 53.65281677246094 55.67262268066406 53.65281677246094 54.09801483154297 C 53.65281677246094 52.52158355712891 54.92916107177734 51.24531555175781 56.50582885742188 51.24531555175781 C 58.08066558837891 51.24531555175781 59.35796356201172 52.52158355712891 59.35796356201172 54.09801483154297 C 59.35796356201172 55.67262268066406 58.08066558837891 56.95054244995117 56.50582885742188 56.95054244995117" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_muft33 =
    '<svg viewBox="12.4 3.1 2.4 2.4" ><path transform="translate(-130.76, -31.52)" d="M 145.6232604980469 35.83338165283203 C 145.6232604980469 36.49924468994141 145.0823059082031 37.03897476196289 144.4170684814453 37.03897476196289 C 143.7514801025391 37.03897476196289 143.2120208740234 36.49924468994141 143.2120208740234 35.83338165283203 C 143.2120208740234 35.16777420043945 143.7514801025391 34.62699890136719 144.4170684814453 34.62699890136719 C 145.0823059082031 34.62699890136719 145.6232604980469 35.16777420043945 145.6232604980469 35.83338165283203" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_bnjt0o =
    '<svg viewBox="0.0 0.0 20.0 16.0" ><path  d="M 6.289961814880371 16 C 13.83856582641602 16 17.96586036682129 9.843916893005371 17.96586036682129 4.506887435913086 C 17.96586036682129 4.332312107086182 17.9631519317627 4.158056259155273 17.95362281799316 3.985185384750366 C 18.75608253479004 3.415629863739014 19.4518871307373 2.70229959487915 20.0001049041748 1.893581509590149 C 19.26532173156738 2.214489698410034 18.47314834594727 2.431483268737793 17.64459228515625 2.52953577041626 C 18.49177169799805 2.028829574584961 19.14069366455078 1.237696886062622 19.44928932189941 0.2952226400375366 C 18.65711402893066 0.7568144798278809 17.77734375 1.094988226890564 16.84289169311523 1.276704668998718 C 16.09251403808594 0.4906877279281616 15.02920818328857 0 13.84766101837158 0 C 11.58126068115234 0 9.745272636413574 1.809277772903442 9.745272636413574 4.037836074829102 C 9.745272636413574 4.355013370513916 9.781329154968262 4.661960124969482 9.850302696228027 4.960380077362061 C 6.440578460693359 4.789427280426025 3.414489030838013 3.182969093322754 1.391934156417847 0.7397618889808655 C 1.040458679199219 1.335749268531799 0.8363515734672546 2.028829574584961 0.8363515734672546 2.768591403961182 C 0.8363515734672546 4.169567108154297 1.559875845909119 5.406304836273193 2.663244962692261 6.13135814666748 C 1.990070819854736 6.110362529754639 1.355985403060913 5.928859233856201 0.8038676977157593 5.625323295593262 C 0.8030014634132385 5.64376163482666 0.8030014634132385 5.659641742706299 0.8030014634132385 5.677013874053955 C 0.8030014634132385 7.634329319000244 2.218432426452637 9.267220497131348 4.09383487701416 9.636727333068848 C 3.751346588134766 9.728597640991211 3.387635469436646 9.779437065124512 3.013962507247925 9.779437065124512 C 2.749110698699951 9.779437065124512 2.492271423339844 9.752471923828125 2.24225378036499 9.705043792724609 C 2.765677452087402 11.31139659881592 4.28040075302124 12.47896480560303 6.075135231018066 12.51179122924805 C 4.671073913574219 13.59558963775635 2.901135206222534 14.24071025848389 0.9783061146736145 14.24071025848389 C 0.6480533480644226 14.24071025848389 0.3221317827701569 14.22194957733154 0 14.18443584442139 C 1.815524101257324 15.33143329620361 3.972237110137939 16 6.289961814880371 16" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_p6p15z =
    '<svg viewBox="0.0 0.2 5.9 7.4" ><path transform="translate(0.0, -1.06)" d="M 3.330066204071045 3.284447193145752 C 3.330066204071045 3.284447193145752 2.527581214904785 3.284447193145752 1.800106167793274 3.965052366256714 L 1.800106167793274 1.223000049591064 L 0 1.223000049591064 L 0 8.427458763122559 L 1.818618774414062 8.427458763122559 L 1.818618774414062 7.862922668457031 C 1.818618774414062 7.862922668457031 2.247561454772949 8.607293128967285 3.330066204071045 8.607293128967285 C 3.330066204071045 8.607293128967285 5.866698265075684 8.517574310302734 5.866698265075684 5.918993949890137 C 5.866698265075684 5.918993949890137 5.773312568664551 3.284447193145752 3.330066204071045 3.284447193145752 M 2.933623075485229 7.086536407470703 C 2.29528284072876 7.086536407470703 1.776794075965881 6.588927745819092 1.776794075965881 5.97498607635498 C 1.776794075965881 5.361571788787842 2.29528284072876 4.863962650299072 2.933623075485229 4.863962650299072 C 3.572237730026245 4.863962650299072 4.0901780128479 5.361571788787842 4.0901780128479 5.97498607635498 C 4.0901780128479 6.588927745819092 3.572237730026245 7.086536407470703 2.933623075485229 7.086536407470703" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_wlqjp =
    '<svg viewBox="6.4 0.0 2.6 7.4" ><path transform="translate(-40.55, 0.0)" d="M 46.99800109863281 0 L 46.99800109863281 1.666864395141602 C 46.99800109863281 1.666864395141602 47.81927490234375 1.63102912902832 47.81927490234375 3.100799798965454 L 47.81927490234375 7.365585327148438 L 49.55410385131836 7.365585327148438 L 49.55410385131836 2.706480741500854 C 49.55410385131836 2.706480741500854 49.62843322753906 0 46.99800109863281 0" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_zk91h =
    '<svg viewBox="10.3 2.2 6.0 5.3" ><path transform="translate(-64.62, -14.8)" d="M 77.85855865478516 17.04000091552734 C 77.85855865478516 17.04000091552734 74.8848876953125 17.04039573669434 74.8848876953125 19.70814323425293 C 74.8848876953125 19.70814323425293 74.78862762451172 22.34045028686523 77.85855865478516 22.34045028686523 C 77.85855865478516 22.34045028686523 80.90078735351562 22.33623504638672 80.90078735351562 19.70814323425293 C 80.90078735351562 19.70814323425293 80.99993896484375 17.04000091552734 77.85855865478516 17.04000091552734 M 77.85897064208984 20.81969451904297 C 77.22035217285156 20.81969451904297 76.70214080810547 20.32208442687988 76.70214080810547 19.70814323425293 C 76.70214080810547 19.09472846984863 77.22035217285156 18.59712028503418 77.85897064208984 18.59712028503418 C 78.49745178222656 18.59712028503418 79.01552581787109 19.09472846984863 79.01552581787109 19.70814323425293 C 79.01552581787109 20.32208442687988 78.49745178222656 20.81969451904297 77.85897064208984 20.81969451904297" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_l9jw0k =
    '<svg viewBox="17.2 2.2 5.8 7.8" ><path transform="translate(-108.19, -14.79)" d="M 129.4445037841797 17.21138381958008 L 129.4445037841797 17.69489479064941 C 129.4445037841797 17.69489479064941 128.92724609375 17.03668594360352 127.9342880249023 17.03668594360352 C 127.9342880249023 17.03668594360352 125.3879241943359 16.93339729309082 125.3879241943359 19.68664741516113 C 125.3879241943359 19.68664741516113 125.3596649169922 22.25163269042969 127.8640747070312 22.25163269042969 C 127.8640747070312 22.25163269042969 128.8854064941406 22.29181480407715 129.4445037841797 21.59276580810547 L 129.4445037841797 21.99656867980957 C 129.4445037841797 21.99656867980957 129.5710754394531 23.25989151000977 128.2975463867188 23.25989151000977 L 127.8640747070312 23.25989151000977 L 127.8640747070312 24.79171562194824 L 128.5634460449219 24.79171562194824 C 128.5634460449219 24.79171562194824 131.1933288574219 24.81885528564453 131.1933288574219 22.09037399291992 L 131.1933288574219 17.21138381958008 L 129.4445037841797 17.21138381958008 Z M 128.3688507080078 20.81637954711914 C 127.7299652099609 20.81637954711914 127.2124328613281 20.31876945495605 127.2124328613281 19.7048282623291 C 127.2124328613281 19.0914134979248 127.7299652099609 18.59380531311035 128.3688507080078 18.59380531311035 C 129.00732421875 18.59380531311035 129.5254058837891 19.0914134979248 129.5254058837891 19.7048282623291 C 129.5254058837891 20.31876945495605 129.00732421875 20.81637954711914 128.3688507080078 20.81637954711914" fill="#767676" stroke="none" stroke-width="1" stroke-miterlimit="10" stroke-linecap="butt" /></svg>';
const String _svg_u7ytpg =
    '<svg viewBox="0.0 0.0 28.0 28.0" ><path transform="translate(-479.37, 176.27)" d="M 479.3660278320312 -176.2720031738281 L 507.3659973144531 -176.2720031738281 L 507.3659973144531 -148.2720184326172 L 479.3660278320312 -148.2720184326172 L 479.3660278320312 -176.2720031738281 Z" fill="none" fill-opacity="0.5" stroke="none" stroke-width="1" stroke-opacity="0.5" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';
const String _svg_xsfw =
    '<svg viewBox="3.5 7.0 21.0 14.0" ><path transform="translate(-482.87, 169.27)" d="M 507.3660278320312 -156.4385070800781 L 490.8345031738281 -156.4385070800781 L 495.010986328125 -160.6269989013672 L 493.3659973144531 -162.2720031738281 L 486.3660278320312 -155.2720031738281 L 493.3659973144531 -148.2720031738281 L 495.010986328125 -149.9169921875 L 490.8345031738281 -154.1054992675781 L 507.3660278320312 -154.1054992675781 L 507.3660278320312 -156.4385070800781 Z" fill="#191919" stroke="none" stroke-width="1" stroke-miterlimit="4" stroke-linecap="butt" /></svg>';