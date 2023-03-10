// import 'package:flutter/material.dart';
//
//
// class MainPage extends StatefulWidget {
//
//   late final String nick;
//
//   MainPage({required this.nick});
//
//   @override
//   _MainPage createState() => _MainPage();
//
// }
//
// class _MainPage extends State<MainPage> {
//
//   static final storage = FlutterSecureStorage();
//   late String nick;
//
//   @override
//   void initState() {
//     super.initState();
//     nick = widget.nick;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             Text(nick),
//             ElevatedButton(
//                 onPressed: () {
//                   storage.delete(key: "nick");
//                 },
//                 child: Text("๋ก๊ทธ์์"))
//           ],
//         ),
//       ),
//     );
//   }
//
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:untitled/Review/reviewMain.dart';
import 'package:untitled/Schedule/caledarM.dart';
import 'package:untitled/firstpage.dart';
import 'package:untitled/sidebar.dart';

import 'Memory/memoryMain.dart';
import 'ServiceCenter/upload_cstable.dart';

class MainPage extends StatefulWidget {

  late final String nick;

  MainPage({required this.nick});

  @override
  _MainPage createState() => _MainPage();

}

class _MainPage extends State<MainPage> {

  static final storage = const FlutterSecureStorage();
  late String nick;

  @override
  void initState() {
    super.initState();
    nick = widget.nick;
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Go Trip",
              style: TextStyle(
                  fontSize: 60,
                  fontFamily: 'Righteous',
                  color: Colors.purpleAccent
              )),
          iconTheme: const IconThemeData(
              color: Colors.black
          ),
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        endDrawer: SS(nick),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text('${nick}', style: const TextStyle(
                            fontSize: 48,
                            color: Colors.purpleAccent,
                            fontFamily: 'Dongle',
                            fontWeight: FontWeight.bold,
                          )),
                          const Text('๋!', style: TextStyle(
                            fontSize: 38,
                            color: Colors.deepPurpleAccent,
                            fontFamily: 'Dongle',
                            fontWeight: FontWeight.bold,
                          )),
                        ],
                      ),
                      const Text("๊ฐ์ด ์ฌํ์ ์ค๋นํด๋ณผ๊น์?",
                          style: TextStyle(
                            fontSize: 38,
                            color: Colors.deepPurpleAccent,
                            fontFamily: 'Dongle',
                            fontWeight: FontWeight.bold,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 1),
                        child: Row(
                          children: [
                            ClipOval(
                              child: Material(
                                color: Colors.purple[100], // button color
                                child: InkWell(
                                  splashColor: Colors.purple[700], // inkwell color
                                  child: const SizedBox(width: 60, height: 60, child: Icon(Icons.add, size: 60,),),
                                  onTap: () {Get.toNamed("/Calendar");},
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: (){Get.to(CalendarP1(nick: nick));},
                              child: const Text("๋๋ง์ ์ผ์? ๋ง๋ค๊ธฐ",
                                  style: TextStyle(
                                    fontSize: 50,
                                    fontFamily: 'Dongle',
                                    fontWeight: FontWeight.bold,
                                  )),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: TextButton(
                          onPressed: (){Get.to(ReviewMain(nick: nick,));},
                          child: const Text("์ฌ๋๋ค์ด ์ถ์ฒํ๋ ํ๋ฒ์ฏค์ ๊ฐ๋ณผ๋งํ๊ณณ",
                              style: TextStyle(
                                fontSize: 30,
                                fontFamily: 'Dongle',
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Container(
                          height: 200,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              SizedBox(
                                width: 250,
                                child: (Image.asset("assets/images/busan.jpg",fit: BoxFit.fitHeight)),
                              ),
                              const SizedBox(width: 200,),
                            ],
                          ),
                        ),
                      ),
                      ListTile(
                        leading:
                        const Icon(Icons.photo_album_outlined, color: Colors.black),
                        title: const Text('๋์ ์ถ์ต ๊ธฐ๋กํ๊ธฐ',
                            style:
                            TextStyle(
                                fontSize: 30,
                                fontFamily: 'Dongle',
                                fontWeight: FontWeight.bold,
                                color: Colors.deepPurpleAccent
                            )),
                        enabled: true,
                        contentPadding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
                        onTap: (){
                          //Get.toNamed("/MemoryMain");
                          //print('1 button clicked');
                          Get.to(MemoryMain(nick: nick,));
                        },
                      ),
                      Center(
                        child: RaisedButton(
                          onPressed: () {
                            //delete ํจ์๋ฅผ ํตํ์ฌ key ์ด๋ฆ์ด login์ธ๊ฒ์ ์์?ํ ํ๊ธฐ ์์ผ ๋ฒ๋ฆฐ๋ค.
                            //์ด๋ฅผ ํตํ์ฌ ๋ค์ ๋ก๊ทธ์ธ์์๋ ๋ก๊ทธ์ธ ์?๋ณด๊ฐ ์์ด ์?๋ณด๋ฅผ ๋ถ๋ฌ ์ฌ ์๊ฐ ์๊ฒ ๋๋ค.
                            storage.delete(key: "nick");
                            Navigator.pushReplacement(
                              context,
                              CupertinoPageRoute(
                                  builder: (context) => MyHomePage()),
                            );
                          },
                          child: const Text("Logout",
                              style: TextStyle(
                                  fontSize: 30,
                                  fontFamily: 'Dongle',
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


