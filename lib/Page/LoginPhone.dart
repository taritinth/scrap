import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:scrap/widget/Loading.dart';
import 'package:scrap/widget/Toast.dart';
import 'package:scrap/widget/warning.dart';

import 'OTPScreen.dart';

class LoginPhone extends StatefulWidget {
  @override
  _LoginPhoneState createState() => _LoginPhoneState();
}

class _LoginPhoneState extends State<LoginPhone> {
  String phone;
  bool loading = false;
  var _key = GlobalKey<FormState>();

  Future<void> phoneVerified() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieval = (String id) {
      print(id);
    };
    final PhoneCodeSent smsCode = (String id, [int resendCode]) {
      setState(() {
        loading = false;
      });
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => OTPScreen(verifiedID: id, phone: phone)));
    };
    final PhoneVerificationCompleted success = (AuthCredential credent) async {
      print('yes sure');
      // FirebaseUser user = await FirebaseAuth.instance.currentUser();
      // user.linkWithCredential(credent);
    };
    PhoneVerificationFailed failed = (AuthException error) {
      Dg().warning(context, 'เกิดข้อผิดพลาดไม่ทราบสาเหตุ กรุณาลองอีกครั้ง', "เกิดผิดพลาด",);
    };
    await FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: '+66' + phone,
            timeout: Duration(seconds: 120),
            verificationCompleted: success,
            verificationFailed: failed,
            codeSent: smsCode,
            codeAutoRetrievalTimeout: autoRetrieval)
        .catchError((e) {
      setState(() {
        loading = false;
      });
      print(e.toString());
    });
  }

  Future<bool> hasAccount(String phone) async {
    final QuerySnapshot phones = await Firestore.instance
        .collection('Users')
        .where('phone', isEqualTo: phone)
        .limit(1)
        .getDocuments();
    final List<DocumentSnapshot> doc = phones.documents;
    return doc.length == 1;
  }

  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(a.width / 20),
                child: Container(
                  width: a.width,
                  
                  alignment: Alignment.topLeft,
                  child: Form(
                      key: _key,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                            width: a.width / 7,
                            height: a.width / 10,
                            child: InkWell(
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(a.width),
                                    color: Colors.white),
                                child: Icon(Icons.arrow_back,
                                    color: Colors.black, size: a.width / 15),
                              ),
                              onTap: () {
                                Navigator.pop(context);
                              },
                            ),
                          ),
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "ยืนยันตัวตน",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: a.width / 8),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: a.width / 20, bottom: a.width / 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                              topLeft:
                                                  const Radius.circular(40.0),
                                              bottomLeft:
                                                  const Radius.circular(40.0)),
                                          border: Border(
                                            top: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                            left: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                        width: a.width / 4,
                                        height: a.width / 6.3,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: <Widget>[
                                            Text(
                                              '+66',
                                              style: TextStyle(
                                                fontSize: a.width / 13,
                                                color: Colors.white,
                                              ),
                                            ),
                                            SizedBox(width: 6),
                                            Container(
                                              child: Image.asset(
                                                'assets/thai-flag-round.png',
                                                width: a.width / 18,
                                                height: a.width / 18,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 5),
                                      Container(
                                        width: a.width / 1.7,
                                        height: a.width / 6.3,
                                        padding: EdgeInsets.only(left: 15),
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                              topRight:
                                                  const Radius.circular(40.0),
                                              bottomRight:
                                                  const Radius.circular(40.0)),
                                          border: Border(
                                            top: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                            left: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                            right: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                            bottom: BorderSide(
                                                width: 1.0,
                                                color: Colors.white),
                                          ),
                                        ),
                                        child: TextFormField(
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: a.width / 14,
                                            fontWeight: FontWeight.w900,
                                          ),
                                          keyboardType: TextInputType.phone,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: 'เบอร์โทรศัพท์',
                                            hintStyle: TextStyle(
                                                color: Colors.grey[500]),
                                          ),
                                          validator: (val) {
                                            return val.trim() == ""
                                                ? Taoast().toast("กรุณาใส่เบอร์โทรศัพท์")
                                                : val.trim().length > 10
                                                    ? Taoast()
                                                        .toast("ตรวจสอบเลข 10 หลัก")
                                                    : null;
                                          },
                                          onSaved: (val) {
                                            phone = val.trim();
                                          },
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Text(
                                  "เราจะส่งเลข 6 หลัก เพื่อยืนยันเบอร์คุณ",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: a.width / 18),
                                ),
                                SizedBox(
                                  height: a.width / 7,
                                ),
                                InkWell(
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(
                                            a.width / 10)),
                                    width: a.width / 2.5,
                                    padding: EdgeInsets.all(10.0),
                                    alignment: Alignment.center,
                                    child: Text(
                                      "ต่อไป",
                                      style: TextStyle(
                                          fontSize: a.width / 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  onTap: () async {
                                    if (_key.currentState.validate()) {
                                      _key.currentState.save();
                                      setState(() {
                                        loading = true;
                                      });
                                      await hasAccount(phone)
                                          ? await phoneVerified()
                                          : Dg().warning(context,
                                              'ไม่พบัญชีที่ใช้เบอร์โทรนี้' ,"เกิดผิดพลาด",);
                                    }
                                  },
                                )
                              ],
                            ),
                          ),
                          Container(
                            width: a.width,
                            height: a.width / 10,
                            alignment: Alignment.center,
                            color: Colors.black,
                            child: Text(
                              'สร้างบัญชีใหม่',
                              style: TextStyle(
                                  fontSize: a.width / 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey[500]),
                            ),
                          ),
                        ],
                      )),
                ),
              ),
              loading ? Loading() : SizedBox()
            ],
          ),
        ],
      ),
    );
  }

  
}
