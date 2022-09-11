const functions = require("firebase-functions");
const admin = require("firebase-admin");
const auth = require("firebase-auth");


var serviceAccount = require("./black-up-b0203-firebase-adminsdk-280cx-f972879b55.json");

admin.initializeApp({
  credential: admin.credential.cert(serviceAccount)
});

// // Create and Deploy Your First Cloud Functions
// // https://firebase.google.com/docs/functions/write-firebase-functions
//
//서버에서 받은 정보들을 처리함.
exports.createCustomToken = functions.https.onRequest(async (request, response) => {
  const user = request.body;
  const uid = `kakao:${user.uid}`;

    const updateParams = { //정보의 재가공
        email: user.email,
        photoURL: user.photoURL,
        displayName: user.displayName,
    };

    try{  //기존 계정이 있는 경우, 바뀐 것들을 업데이트
        await admin.auth().updateUser(uid, updateParams);  //uid의 유저의 정보를 위의 업데이트 함수로 업데이트
    } catch(e){ //uid 유저 정보 없을때 (처음 접속 시)
        updateParams["uid"] = uid;
        await admin.auth().createUser(updateParams);
    }
    const token = await admin.auth().createCustomToken(uid); //토큰생성

     response.send(token);
 });
