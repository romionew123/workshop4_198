import 'package:flutter/material.dart';
import 'package:workshop4_155/screen/item.dart';
import 'package:workshop4_155/screen/foodmenu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // สร้าง List เก็บข้อมูลรายการอาหาร เริ่มต้นเป็นลิสต์ว่าง
  List<FoodMenu> foodMenus = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Item(foodMenus: foodMenus),
    );
  }
}