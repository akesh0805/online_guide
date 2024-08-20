import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:online_guide/pages/ExcelTable.dart';
import 'package:online_guide/model/guides.dart';
import 'package:online_guide/model/users.dart';
import 'package:online_guide/pages/AdminPage.dart';
import 'package:online_guide/pages/GuidePage.dart';
import 'package:online_guide/pages/Home.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:online_guide/pages/Test.dart';
import 'package:online_guide/pages/UsersPage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options:  const FirebaseOptions(
            apiKey: "AIzaSyAuMohCVS9q8LuVWwJum_HCtHEu0bJ1UyQ",
            authDomain: "online-guide-vchd4.firebaseapp.com",
            projectId: "online-guide-vchd4",
            storageBucket: "online-guide-vchd4.appspot.com",
            messagingSenderId: "1097552646868",
            appId: "1:1097552646868:web:8b8b0742eb06e098386141",
            measurementId: "G-EF18WPGDLL"));
  } else {
    await Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Users()),
        ChangeNotifierProvider(create: (context) => Guides()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'vchd4 online guide',
        theme: ThemeData(textTheme: GoogleFonts.montserratTextTheme()),
        home: Home(),
        routes: {
          Home.id: (context) => Home(),
          Userspage.id: (context) => Userspage(),
          Adminpage.id: (context) => Adminpage(),
          GuidePage.id: (context) => GuidePage(
                userName: '',
              ),
          Exceltable.id: (context) => Exceltable(),
          HomePage.id:(context) => HomePage(),
        },
      ),
    );
  }
}
