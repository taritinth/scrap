import 'package:flutter/material.dart';
import 'package:scrap/widget/Arrow_back.dart';
import 'package:scrap/widget/ProfileCard.dart';

class AddFriend extends StatefulWidget {
  @override
  _AddFriendState createState() => _AddFriendState();
}

class _AddFriendState extends State<AddFriend> {
  @override
  Widget build(BuildContext context) {
    Size a = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        color: Colors.black,
        child: ListView(
          children: <Widget>[
            Container(
              child: Column(
                children: <Widget>[
                  ArrowBack(),
                  Container(
                    width: a.width,padding: EdgeInsets.only(left: a.width/25),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "ค้นหาไอดี",
                          style: TextStyle(
                              fontSize: a.width / 8, color: Colors.white),
                        ),
                        Text("ค้นหาไอดีแล้วปาใส่กระดาษใส่พวกเขากัน",
                            style: TextStyle(
                                color: Colors.white, fontSize: a.width / 18)),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: a.width / 10),
                    height: a.width / 7.5,
                    width: a.width * 9 / 10,
                    decoration: BoxDecoration(
                        color: Color(0xff434343),
                        borderRadius: BorderRadius.circular(a.width)),
                    child: Container(
                      padding: EdgeInsets.only(
                          left: a.width / 25, right: a.width / 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Container(child: Text("@phuminsathipchan")),
                          Container(
                            width: a.width / 9,
                            height: a.width / 9,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(a.width),
                                color: Colors.white),
                          )
                        ],
                      ),
                    ),
                  ),
                  Container(
                    child: ProfileCard(),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: a.width / 20),
                    width: a.width,
                  
                    child: Row(
                      // ใส��� Row ��พื่อเรียงแนวนอนของจำนวน ได้แก่ เขียน ผู้หยิบอ่าน ปาใส่
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        Container(padding: EdgeInsets.only(top: a.width/20),
                          height: a.width/5,
                          decoration: BoxDecoration(
                              color: Color(0xff434343),
                              borderRadius: BorderRadius.circular(a.width/20)),
                          child: Row(
                            children: <Widget>[
                              Container(
                                //color: Colors.black,
                                width: a.width / 6,
                                child: Column(
                                  //เพื่อใช้สำหรับให้ จำนวน และ เขียน
                                  children: <Widget>[
                                    Text(
                                      "เขียน",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 36),
                                    ),
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: a.width / 6,
                                // color: Colors.blue,
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "ผู้คนหยิบอ่าน",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 36),
                                    ),
                                    Text(
                                      //เพื่อใช้สำหรับ��ห้ จำนวน และ ผ�����้หยิบอ่าน
                                      "0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: a.width / 6,
                                //  color: Colors.blue,
                                child: Column(
                                  //เพื่อใช้สำหรับให้ จำนวน ��ละ โ��นปาใส��
                                  children: <Widget>[
                                    Text(
                                      "โดนปาใส่",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 36),
                                    ),
                                    Text(
                                      "0",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: a.width / 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: a.width / 5,
                          height: a.width / 5,
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
                                size: a.width / 16,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
