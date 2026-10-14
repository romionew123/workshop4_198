import 'package:flutter/material.dart';
import 'package:workshop4_155/screen/foodmenu.dart';
import 'package:workshop4_155/screen/item.dart';

class AddForm extends StatefulWidget {
  const AddForm({super.key, required this.foodMenus});

  final List<FoodMenu> foodMenus;

  @override
  State<AddForm> createState() => _AddFormState();
}

class _AddFormState extends State<AddForm> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _component = '';
  int _price = 0;
  FoodType _foodType = FoodType.ttype1;
  Foodpic _foodpic = Foodpic.menu1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("เพิ่มข้อมูลอาหาร"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  maxLength: 20,
                  decoration: const InputDecoration(
                    labelText: "ชื่ออาหาร",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนชื่ออาหาร";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _name = value!;
                  },
                ),
                TextFormField(
                  maxLength: 100,
                  decoration: const InputDecoration(
                    labelText: "ส่วนประกอบสำคัญ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนส่วนประกอบสำคัญ";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _component = value!;
                  },
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "ราคา",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "กรุณาป้อนราคา";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    _price = int.parse(value.toString());
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<FoodType>(
                  value: _foodType,
                  decoration: const InputDecoration(
                    labelText: "ชนิดอาหาร",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  items: FoodType.values.map((key) {
                    return DropdownMenuItem(
                      value: key,
                      child: Text(key.ty),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodType = value!;
                    });
                  },
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<Foodpic>(
                  value: _foodpic,
                  decoration: const InputDecoration(
                    labelText: "เลือกรูปภาพ",
                    labelStyle: TextStyle(fontSize: 20),
                  ),
                  items: Foodpic.values.map((pic) {
                    return DropdownMenuItem(
                      value: pic,
                      child: Row(
                        children: [
                          Text(pic.namefood),
                          const SizedBox(width: 10),
                          Image.asset(
                            pic.image,
                            width: 30,
                            height: 30,
                            fit: BoxFit.cover,
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      _foodpic = value!;
                    });
                  },
                ),
                const SizedBox(height: 30),
                FilledButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      
                      // เพิ่มข้อมูลใหม่เข้าไปใน List
                      widget.foodMenus.add(FoodMenu(
                        name: _name,
                        component: _component,
                        price: _price,
                        foodpic: _foodpic,
                        foodType: _foodType,
                      ));

                      // กลับไปหน้าก่อนหน้า (Item)
                      Navigator.pop(context);
                    }
                  },
                  style: FilledButton.styleFrom(
                    backgroundColor: Colors.orange,
                    minimumSize: const Size.fromHeight(50),
                  ),
                  child: const Text("บันทึกข้อมูล", style: TextStyle(fontSize: 20)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}