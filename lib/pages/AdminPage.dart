import 'package:flutter/material.dart';

class Adminpage extends StatefulWidget {
  const Adminpage({super.key});
static const id = "Admin page";
  @override
  State<Adminpage> createState() => _AdminpageState();
}

class _AdminpageState extends State<Adminpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
    );
  }
}