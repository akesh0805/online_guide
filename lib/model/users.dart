import 'package:flutter/material.dart';

class User with ChangeNotifier{
  final String id;
  final String title;
  final String about;

  User({
    required this.id,
    required this.title,
    required this.about,

  });
}

class Users with ChangeNotifier{
  final List<User> _list =[
    User(id: 'b1', title: "Vagon yig'uv sexi", about: ""),
    User(id: 'b2', title: "Telejka sexi", about: ""),
    User(id: 'b3', title: "G'ildirak sexi", about: ""),
    User(id: "b4", title: "Avtobirikma sexi", about: ""),
    User(id: 'b5', title: "Avtotormoz nazorat bo'limi", about: ""),
    User(id: 'b6', title: "Yordamchi tayyorlov sexi", about: ""),
    User(id: 'b7', title: "Qo'qon VTXKB", about: ""),
    User(id: 'b8', title: "Namangan VTXKB", about: ''),
    User(id: "b9", title: "Axtachi VTXKB", about: ""),
    User(id: "b10", title: "Oxunboboyev VTXKB", about: ""),
    User(id: 'b11', title: "Oltiariq VTXKB", about: ""),
    User(id: 'b12', title: "Pop - 2", about: ""),
    User(id: 'b13', title: "Chodak VTXKB", about: ""),
    User(id: 'b14', title: "Orzu VTXKB", about: "")
  ];

List<User> get list {
    return [..._list];
  }

void addUser(){
  notifyListeners();
}
}