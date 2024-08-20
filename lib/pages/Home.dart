import 'package:flutter/material.dart';
import 'package:online_guide/pages/AdminPage.dart';
import 'package:online_guide/pages/Test.dart';
import 'package:online_guide/pages/UsersPage.dart';
import 'package:online_guide/styles/button.dart';

class Home extends StatefulWidget {
  const Home({super.key});
  static const id = "Home";
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("VCHD4 TB"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 5),
            child: Image.asset('assets/images/logovchd.png'),
          )
        ],
      ),
      drawer: Drawer(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            colors: [Color(0xff72c6ef), Color(0xff004e8f), Color(0xff00068f)],
            stops: [0, 1, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          )),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 35),
                child: Center(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      border:
                          Border.all(color: Colors.lightBlueAccent, width: 5),
                      image: DecorationImage(
                        image: AssetImage(
                          'assets/images/foto.jpg',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                    height: 150,
                    width: 150,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  "Qo'qon vagon deposining Mehnat muhofazasi va harakat xavfsizligi bo'limining barcha yo'riqnomalarini raqamlashtirilgan tizimga o'tkazish va shaffoflikni ta'minlash maqsadida ushbu dastur yaratildi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      body: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(50),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff091e3a), Color(0xff2f80ed), Color(0xff2d9ee0)],
            stops: [0, 0.5, 1],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 40),
              child: Center(
                child: Text(
                  "Qo'qon vagon deposida yuritilishi zarur bo'lgan yo'riqnomalarni online to'ldirish dasturi",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white70),
                ),
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Text(
              "Kim sifatida foydalanmoqchisiz?",
              style: TextStyle(color: Colors.black, fontSize: 27),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.pushNamed(context, Userspage.id);
                  },
                  child: Text(
                    "FOYDALANUVCHI",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                  ),
                ),
                ElevatedButton(
                  style: buttonPrimary,
                  onPressed: () {
                    Navigator.pushNamed(context, HomePage.id);
                  },
                  child: Text(
                    "ADMIN",
                    style: TextStyle(color: Colors.blueAccent, fontSize: 30),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
