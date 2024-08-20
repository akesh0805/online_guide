import 'package:flutter/material.dart';
import 'package:online_guide/pages/GuidePage.dart';
import 'package:provider/provider.dart';
import 'package:online_guide/model/users.dart';


class Userspage extends StatefulWidget {
  const Userspage({super.key});
static const id = "Users Page";

  @override
  State<Userspage> createState() => _UserspageState();
}

class _UserspageState extends State<Userspage> {
  @override
  Widget build(BuildContext context) {
    final userData = Provider.of<Users>(context);
    final users =userData.list;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("BO'LIMLAR"),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(15),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 2 / 1,
            crossAxisCount: 2),
        itemBuilder: (context, index) {
          final user = userData.list[index];
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => GuidePage(
                    userName: user.id,
                  ),
                ),
              );
            },
            child: GridTile(
              header: const Text(
                "Qo'qon Vagon Deposi",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              footer: GridTileBar(
                leading: const Icon(
                  Icons.construction,
                  size: 30,
                ),
                title: Text(
                  users[index].title,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                backgroundColor: Colors.black54,
              ),
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueAccent.withOpacity(0.7),
                        blurRadius: 3,
                        spreadRadius: 4,
                        // offset: Offset(0, 8),
                        blurStyle: BlurStyle.normal,
                      ),
                    ],
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25) 
                  ),
                  padding: const EdgeInsets.only(top: 30, bottom: 55),
                  child: Image.asset('assets/images/logovchd.png'),
                ),
              ),
            ),
          );
        },
        itemCount: users.length,
      ),
    );
  }
}