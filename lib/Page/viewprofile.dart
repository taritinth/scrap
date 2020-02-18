import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

class Viewprofile extends StatefulWidget {
  final DocumentSnapshot account;
  final DocumentSnapshot info;
  final DocumentSnapshot self;
  Viewprofile(
      {@required this.info, @required this.account, @required this.self});
  @override
  _ViewprofileState createState() => _ViewprofileState();
}

class _ViewprofileState extends State<Viewprofile> {
  bool public;
  String text;
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Stack(
        children: <Widget>[
          Container(
            color: Colors.black,
            width: a.width,
            height: a.height,
          ),
          Column(
            children: <Widget>[
              Container(
                  color: Colors.black,
                  width: a.width,
                  height: a.height / 6,
                  child: Padding(
                      padding: EdgeInsets.only(
                          top: a.width / 15,
                          right: a.width / 25,
                          left: a.width / 25,
                          bottom: a.width / 30.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                InkWell(
                                  //back btn
                                  child: Container(
                                    width: a.width / 7,
                                    height: a.width / 10,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(a.width),
                                        color: Colors.white),
                                    child: Icon(Icons.arrow_back,
                                        color: Colors.black,
                                        size: a.width / 15),
                                  ),
                                  onTap: () {
                                    Navigator.pop(
                                      context,
                                    );
                                  },
                                ),
                              ],
                            ), //back btn
                          ]))),
              Container(
                color: Colors.black,
                child: Container(
                    margin: EdgeInsets.only(left: 20, right: 13),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(a.width),
                        border: Border.all(
                            color: Colors.white, width: a.width / 190)),
                    width: a.width / 3.2,
                    height: a.width / 3.2,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(a.width),
                      child: Image.network(
                        widget.info.data['img'],
                        fit: BoxFit.cover,
                      ),
                    )),
              ),
              SizedBox(
                height: a.width / 15,
              ),
              Text(
                "@${widget.account.data['id']}",
                style: TextStyle(color: Colors.white, fontSize: a.width / 12),
              ),
              Text(
                "Join ${widget.info.data['createdDay']}",
                style: TextStyle(color: Colors.blue, fontSize: a.width / 12),
              ),
              Container(
                margin: EdgeInsets.only(top: a.width / 30),
                padding: EdgeInsets.only(top: a.width / 10),
                height: a.width / 2.5,
                //ใส่เส้นด้านใต้สุด
                child: Row(
                  // ใส่ Row เพื่อเรียงแนวนอนของจำนวน ได้แก่ เขียน ผู้หยิบอ่าน ปาใส่
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      child: Column(
                        //เพื่อใช้สำหรับให้ จำนวน และ เขียน
                        children: <Widget>[
                          Text(
                            widget.info?.data['written'] == null
                                ? '0'
                                : widget.info.data['written'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: a.width / 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "เขียน",
                            style: TextStyle(
                                color: Colors.white, fontSize: a.width / 21),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: a.width / 10, right: a.width / 10),
                      child: Column(
                        children: <Widget>[
                          Text(
                            //เพื่อใช้สำหรับ��ห้ จำนวน และ ผ�����้หยิบอ่าน
                            widget.info?.data['read'] == null
                                ? '0'
                                : widget.info.data['read'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: a.width / 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "ผู้คนหยิบอ่าน",
                            style: TextStyle(
                                color: Colors.white, fontSize: a.width / 21),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        //เพื่อใช้สำหรับให้ จำนวน ��ละ โ��นปาใส��
                        children: <Widget>[
                          Text(
                            widget.info?.data['threw'] == null
                                ? '0'
                                : widget.info.data['threw'].toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: a.width / 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "โดนปาใส่",
                            style: TextStyle(
                                color: Colors.white, fontSize: a.width / 21),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              InkWell(
                child: Container(
                  width: a.width / 3.6,
                  height: a.width / 3.6,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(a.width),
                      border: Border.all(
                          color: Colors.white38, width: a.width / 500)),
                  child: Container(
                    margin: EdgeInsets.all(a.width / 35),
                    width: a.width / 5,
                    height: a.width / 5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(a.width),
                        border: Border.all(color: Colors.white)),
                    child: Container(
                      margin: EdgeInsets.all(a.width / 35),
                      width: a.width / 5,
                      height: a.width / 5,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(a.width),
                          color: Colors.white,
                          border: Border.all(color: Colors.white)),
                      child: Icon(
                        Icons.create,
                        size: a.width / 12,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  dialog();
                },
              ),
            ],
          ),
        ],
      )),
    );
  }

  dialog() {
    var _key = GlobalKey<FormState>();
    DateTime now = DateTime.now();
    String time = DateFormat('Hm').format(now);
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
              backgroundColor: Colors.transparent,
              content:
                  StatefulBuilder(builder: (context, StateSetter setState) {
                Size a = MediaQuery.of(context).size;
                return Container(
                  width: a.height,
                  height: a.height / 1.3,
                  child: ListView(
                    children: <Widget>[
                      Form(
                        key: _key,
                        child: Column(
                          children: <Widget>[
                            Container(
                              width: a.height,
                              alignment: Alignment.topRight,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  //ปุ่ม������ดหากต้องการที่จะเปิดเผยตัวตน
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Container(
                                          width: a.width / 15,
                                          height: a.width / 15,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      a.width / 50),
                                              border: Border.all(
                                                  color: Colors.white)),
                                          child: Checkbox(
                                            value: public ?? false,
                                            onChanged: (bool value) {
                                              setState(() {
                                                public = value;
                                              });
                                            },
                                          ),
                                        ),
                                        Container(
                                          child: Text(
                                            "\t" + "เปิดเผยตัวตน",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: a.width / 20),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  //ออกจากหน้านี้
                                  InkWell(
                                    child: Icon(
                                      Icons.clear,
                                      size: a.width / 10,
                                      color: Colors.white,
                                    ),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              ),
                            ),
                            //ส่ว��ของกระดาษที่เขีย���
                            Container(
                              margin: EdgeInsets.only(top: a.width / 50),
                              width: a.width / 1,
                              height: a.height / 2,
                              //ทำเป็นชั้นๆ
                              child: Stack(
                                children: <Widget>[
                                  //ช���้นที่ 1 ส่วนของก���ะดาษ
                                  Container(
                                    child: Image.asset(
                                      'assets/paper-readed.png',
                                      width: a.width,
                                      height: a.height / 2,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                        left: a.width / 10, top: a.width / 20),
                                    width: a.width,
                                    alignment: Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          public ?? false
                                              ? 'เขียนโดย : @${widget.self['id']}'
                                              : 'เขียนโดย : ไม่ระบุตัวตน',
                                          style: TextStyle(
                                              color: Colors.grey[600]),
                                        ),
                                        Text("เวลา" + " : " + time,
                                            style:
                                                TextStyle(color: Colors.grey))
                                      ],
                                    ),
                                  ),
                                  //ชั้นที่ 3 เอาไว้สำหรับเขียนข้อความ
                                  Container(
                                    width: a.width,
                                    height: a.height,
                                    alignment: Alignment.center,
                                    child: SizedBox(
                                      width: a.width / 3,
                                      child: TextFormField(
                                        textAlign: TextAlign
                                            .center, //เพ��่อให้ข้อความอยู่ตรงกลาง
                                        style:
                                            TextStyle(fontSize: a.width / 15),
                                        maxLines: null,
                                        decoration: InputDecoration(
                                          border: InputBorder
                                              .none, //สำหรับใหเส้นใต้หาย
                                          hintText: 'เขียนข้อความบางอย่าง',
                                          hintStyle: TextStyle(
                                            fontSize: a.width / 25,
                                            color: Colors.grey,
                                          ),
                                        ),
                                        //หากไม่ได้กรอกจะขึ้น
                                        validator: (val) {
                                          return val.trim() == null ||
                                                  val.trim() == ""
                                              ? 'เขียนบางอย่างสิ'
                                              : null;
                                        },
                                        //เนื้อหาที่กรอกเข้าไปใน text
                                        onChanged: (val) {
                                          text = val;
                                        },
                                      ),
                                    ),
                                  )
                                  //)
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: a.width / 24),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: <Widget>[
                                  //ปุ่มปาใส่
                                  InkWell(
                                    child: Container(
                                      width: a.width / 4.5,
                                      height: a.width / 8,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(a.width)),
                                      alignment: Alignment.center,
                                      child: Text("ปาใส่",
                                          style: TextStyle(
                                              fontSize: a.width / 15)),
                                    ),
                                    //ให้ dialog แรกหายไปก่อนแล้วเปิด dialog2
                                    onTap: () {
                                      if (_key.currentState.validate()) {
                                        _key.currentState.save();
                                        Navigator.pop(context);
                                        throwTo(widget.account['uid']);
                                        toast(
                                            'ปากระดาษไปหา"${widget.account['id']}"แล้ว');
                                      }
                                    },
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }));
        });
  }

  toast(String text) {
    return Fluttertoast.showToast(
        msg: text,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIos: 1,
        backgroundColor: Colors.white60,
        textColor: Colors.black,
        fontSize: 16.0);
  }

  increaseTransaction(String uid, String key) async {
    await Firestore.instance
        .collection('Users')
        .document(uid)
        .collection('info')
        .document(uid)
        .get()
        .then((value) => Firestore.instance
            .collection('Users')
            .document(uid)
            .collection('info')
            .document(uid)
            .updateData(
                {key: value?.data[key] == null ? 1 : ++value.data[key]}));
  }

  throwTo(String thrownID) async {
    DateTime now = DateTime.now();
    String time = DateFormat('Hm').format(now);
    String date = DateFormat('d/M/y').format(now);
    await Firestore.instance
        .collection('Users')
        .document(thrownID)
        .collection('scraps')
        .document('recently')
        .setData({
      'id': FieldValue.arrayUnion([widget.self['id']]),
      'scraps': {
        widget.self['uid']: FieldValue.arrayUnion([
          {
            'text': text,
            'writer': public ?? false ? widget.self['id'] : 'ไม่ระบุตัวตน',
            'time': time
          }
        ])
      }
    }, merge: true);
    await notifaication(thrownID, date, time);
    await increaseTransaction(widget.self['uid'], 'written');
    await increaseTransaction(thrownID, 'threw');
  }

  notifaication(String who, String date, String time) async {
    await Firestore.instance.collection('Notifications').add({'uid': who});
    await Firestore.instance
        .collection('Users')
        .document(who)
        .collection('notification')
        .add({
      'writer': public ?? false ? widget.self['id'] : 'ไม่ระบุตัวตน',
      'date': date,
      'time': time
    });
  }
}
