import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:scrap/Page/FeedbackPage.dart';
import 'package:scrap/widget/LongPaper.dart';

class Profile extends StatefulWidget {
  final DocumentSnapshot doc;
  Profile({@required this.doc});
  @override
  _ProfileState createState() => _ProfileState();
}

//หน้า Account
class _ProfileState extends State<Profile> {
  int page;
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: StreamBuilder(
          stream: Firestore.instance
              .collection('Users')
              .document(widget.doc['uid'])
              .collection('info')
              .document(widget.doc['uid'])
              .snapshots(),
          builder: (context, snapshot) {
            if (snapshot.hasData &&
                snapshot.connectionState == ConnectionState.active) {
              return ListView(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(
                        top: a.width / 20,
                        right: a.width / 25,
                        left: a.width / 25,
                        bottom: a.width / 8.0),
                    child: Column(
                      children: <Widget>[
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: a.width / 7,
                                  height: a.width / 10,
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(a.width),
                                      color: Colors.white),
                                  child: Icon(Icons.arrow_back,
                                      color: Colors.black, size: a.width / 15),
                                ),
                                onTap: () {
                                  Navigator.pop(
                                    context,
                                  );
                                },
                              ),
                              PopupMenuButton<String>(
                                //setting menu
                                onSelected: choiceAction,
                                itemBuilder: (BuildContext context) {
                                  return Constans.choices.map((String choice) {
                                    return PopupMenuItem(
                                        value: choice,
                                        child: Text(
                                          choice,
                                          style:
                                              TextStyle(fontSize: a.width / 15),
                                        ));
                                  }).toList();
                                },
                                child: Icon(Icons.more_horiz,
                                    color: Colors.white, size: a.width / 9),
                              )
                            ],
                          ),
                        ),
                        // ||
                        // ||   เป็นส่วนของรูปภาพ Profile
                        //\  /
                        // \/
                        Container(
                          margin: EdgeInsets.only(top: a.width / 10),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(a.width),
                              border: Border.all(
                                  color: Colors.white, width: a.width / 150)),
                          width: a.width / 3,
                          height: a.width / 3,
                          child: snapshot.data['img'] == null
                              ? Image.asset("assets/userprofile.png")
                              : Image.network(snapshot.data['img']),
                        ),
                        // ชื่อของ account
                        Container(
                            margin: EdgeInsets.only(top: a.width / 15),
                            child: Text(
                              "@" + widget.doc['id'],
                              style: TextStyle(
                                  color: Colors.white, fontSize: a.width / 12),
                            )),
                        // เบอร์โทรของ Account
                        Container(
                            margin: EdgeInsets.only(top: a.width / 1000),
                            child: Text(
                              "+66-" + widget.doc['phone'],
                              style: TextStyle(
                                  color: Colors.white, fontSize: a.width / 15),
                            )),
                        // ใส่ Container เพื่อสร้างกรอบ
                        Container(
                          margin: EdgeInsets.only(top: a.width / 30),
                          padding: EdgeInsets.only(top: a.width / 10),
                          height: a.width / 2.5,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: a.width / 1500,
                                      color:
                                          Colors.white))), //ใส่เส้นด้านใต้สุด
                          child: Row(
                            // ใส่ Row เพื่อเรียงแนวนอนของจำนวน ได้แก่ เขียน ผู้หยิบอ่าน ปาใส่
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Container(
                                child: Column(
                                  //เพื่อใช้สำหรับให้ จำนวน และ เขียน
                                  children: <Widget>[
                                    Text(
                                      snapshot.data['written'] == null
                                          ? '0'
                                          : snapshot.data['written'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "เขียน",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 18),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      //เพื่อใช้สำหรับ��ห้ จำนวน และ ผ�����้หยิบอ่าน
                                      snapshot.data['read'] == null
                                          ? '0'
                                          : snapshot.data['read'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "ผู้คนหยิบอ่าน",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 18),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                child: Column(
                                  //เพื่อใช้สำหรับให้ จำนวน ��ละ โ��นปาใส��
                                  children: <Widget>[
                                    Text(
                                      snapshot.data['threw'] == null
                                          ? '0'
                                          : snapshot.data['threw'].toString(),
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 10,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      "โดนปาใส่",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 18),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: a.width,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                            color: Colors.white,
                            width: a.width / 1500,
                          ))),
                          alignment: Alignment.topLeft,
                          child: Column(
                            children: <Widget>[
                              Container(
                                width: a.width,
                                padding: EdgeInsets.only(top: a.width / 20),
                                child: Text(
                                  "โดนปาใส่ล่าสุด",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                      fontSize: a.width / 18),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(bottom: 25.0),
                                width: a.width,
                                child: StreamBuilder(
                                    stream: Firestore.instance
                                        .collection('Users')
                                        .document(widget.doc['uid'])
                                        .collection('scraps')
                                        .document('recently')
                                        .snapshots(),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData &&
                                          snapshot.connectionState ==
                                              ConnectionState.active) {
                                        List data = snapshot?.data['scraps'];
                                        return snapshot?.data['scraps'] ==
                                                    null ||
                                                data.length == 0
                                            ? Container(
                                                height: a.height / 12,
                                                child: Center(
                                                  child: Text(
                                                    'ไม่มี',
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        color: Colors.white,
                                                        fontSize: a.width / 18),
                                                  ),
                                                ))
                                            : Wrap(
                                                children: data
                                                    .map((text) => scrap(
                                                        a,
                                                        data[data.length -
                                                            1 -
                                                            data.indexOf(
                                                                text)]))
                                                    .toList());
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                              )
                            ],
                          ),
                        ),
                        StreamBuilder(
                            stream: Firestore.instance
                                .collection('Users')
                                .document(widget.doc['uid'])
                                .collection('scraps')
                                .document('collection')
                                .snapshots(),
                            builder: (context, snapshot) {
                              if (snapshot.hasData &&
                                  snapshot.connectionState ==
                                      ConnectionState.active) {
                                return Column(
                                  children: <Widget>[
                                    Container(
                                      margin:
                                          EdgeInsets.only(top: a.width / 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: <Widget>[
                                          Container(
                                            child: Text(
                                              "กระดาษที่เก็บไว้",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: a.width / 18),
                                            ),
                                          ),
                                          Container(
                                            child: Text(
                                              snapshot?.data['scraps'] ==
                                                          null ||
                                                      snapshot.data['scraps']
                                                              .length ==
                                                          0
                                                  ? '0' + " แผ่น"
                                                  : snapshot
                                                          .data['scraps'].length
                                                          .toString() +
                                                      ' แผ่น',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: a.width / 18),
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    snapshot?.data['scraps'] == null ||
                                            snapshot.data['scraps'].length == 0
                                        ? Center(
                                            child: Text(
                                              'ไม่มี',
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                  fontSize: a.width / 18),
                                            ),
                                          )
                                        : Container(
                                            width: a.width,
                                            height: a.width / 1,
                                            child: ListView.builder(
                                              itemCount: snapshot
                                                  .data['scraps'].length,
                                              scrollDirection: Axis.horizontal,
                                              //  children: <Widget>[LongPaper(), LongPaper()],
                                              itemBuilder: (context, index) {
                                                String text = snapshot
                                                    .data['scraps'][snapshot
                                                        .data['scraps'].length -
                                                    (++index)];
                                                return LongPaper(
                                                  text: text,
                                                  uid: widget.doc['uid'],
                                                );
                                              },
                                            ))
                                  ],
                                );
                              } else {
                                return Center(
                                  child: CircularProgressIndicator(),
                                );
                              }
                            }),

                        Container(
                          margin: EdgeInsets.only(top: 100),
                          child: InkWell(
                            child: Container(
                                width: a.width / 2,
                                height: a.width / 6,
                                decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.circular(a.width),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: a.width / 400,
                                    )),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: <Widget>[
                                    Icon(Icons.feedback,
                                        color: Colors.white,
                                        size: a.width / 15),
                                    SizedBox(width: 5),
                                    Text(
                                      'Feedback',
                                      style: TextStyle(
                                        fontSize: a.width / 12,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                )),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FeedbackPage())); //ไปยังหน้า Profile
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget scrap(Size a, String data) {
    return Container(
      padding: EdgeInsets.all(a.width / 32),
      child: InkWell(
        child: Image.asset(
          './assets/paper.png',
          width: a.width / 6.4,
          height: a.width / 6.4,
          fit: BoxFit.cover,
        ),
        onTap: () {
          dialog(data);
        },
      ),
    );
  }

//ส่วนของ กระดาษที่ถูกปาใส่ เม���่อกด
  dialog(String text) {
    return showDialog(
        context: context,
        builder: (builder) {
          return AlertDialog(
              contentPadding: EdgeInsets.all(0),
              backgroundColor: Colors.transparent,
              content:
                  StatefulBuilder(builder: (context, StateSetter setState) {
                Size a = MediaQuery.of(context).size;
                return Container(
                  width: a.width,
                  height: a.height / 1.76,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        width: a.width,
                        child: Image.asset(
                          'assets/paper-readed.png',
                          width: a.width,
                          height: a.height / 2.1,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                          top: 12,
                          left: 12,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('เขียนโดย : ใครสักคน'),
                                //  Text('เวลา : 9:00')
                              ],
                            ),
                          )),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          width: a.width / 1.2,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              InkWell(
                                child: Container(
                                  width: a.width / 3.5,
                                  height: a.width / 6.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(a.width)),
                                  alignment: Alignment.center,
                                  child: Text("เก็บไว้",
                                      style: TextStyle(
                                          fontSize: a.width / 15,
                                          color: Color(0xff26A4FF))),
                                ),
                                onTap: () async {
                                  Navigator.pop(context);
                                  await Firestore.instance
                                      .collection('Users')
                                      .document(widget.doc['uid'])
                                      .collection('scraps')
                                      .document('recently')
                                      .updateData({
                                    'scraps': FieldValue.arrayRemove([text]),
                                  });
                                  await Firestore.instance
                                      .collection('Users')
                                      .document(widget.doc['uid'])
                                      .collection('scraps')
                                      .document('collection')
                                      .updateData({
                                    'scraps': FieldValue.arrayUnion([text])
                                  });
                                },
                              ),
                              InkWell(
                                child: Container(
                                  width: a.width / 3.5,
                                  height: a.width / 6.5,
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius:
                                          BorderRadius.circular(a.width)),
                                  alignment: Alignment.center,
                                  child: Text(
                                    "ทิ้ง",
                                    style: TextStyle(fontSize: a.width / 15),
                                  ),
                                ),
                                onTap: () async {
                                  Navigator.pop(context);
                                  await Firestore.instance
                                      .collection('Users')
                                      .document(widget.doc['uid'])
                                      .collection('scraps')
                                      .document('recently')
                                      .updateData({
                                    'scraps': FieldValue.arrayRemove([text])
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                          left: a.width / 16,
                          top: a.height / 12,
                          child: Container(
                            alignment: Alignment.center,
                            height: a.height / 3.2,
                            width: a.width / 1.48,
                            child: Text(
                              text,
                              style: TextStyle(fontSize: a.width / 14),
                            ),
                          ))
                    ],
                  ),
                );
              }));
        });
  }

  void choiceAction(String choice) {
    print("It's work!");

    if (choice == Constans.Account) {
      print('Account');
    }
    if (choice == Constans.UserReport) {
      print('UserReport');
    }
    if (choice == Constans.Feedback) {
      print('Feedback');
    }
    if (choice == Constans.About) {
      print('About');
    }
    if (choice == Constans.SignOut) {
      print('SignOut');
    }
  }
}

class Constans {
  static const String Account = 'แก้ไขบัญชี';
  static const String UserReport = 'ร้องเรียนผู้ใช้';
  static const String Feedback = 'ให้คำแนะนำ';
  static const String About = 'เกี่ยวกับแอป';
  static const String SignOut = 'ออกจากระบบ';

  static const List<String> choices = <String>[
    Account,
    UserReport,
    Feedback,
    About,
    SignOut,
  ];
}
