import 'package:flutter/material.dart';
import 'package:workshop4_155/screen/foodmenu.dart';
import 'package:workshop4_155/screen/addform.dart';

class Item extends StatefulWidget {
  const Item({super.key, required this.foodMenus});

  final List<FoodMenu> foodMenus;

  @override
  State<Item> createState() => _ItemState();
}

class _ItemState extends State<Item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("รายการอาหาร"),
        backgroundColor: Colors.orange,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: widget.foodMenus.isEmpty
                ? const Center(
                    child: Text(
                      "ยังไม่มีรายการอาหาร\nกดปุ่ม + ด้านล่างเพื่อเพิ่มข้อมูล",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16, color: Colors.grey),
                    ),
                  )
                : ListView.builder(
                    itemCount: widget.foodMenus.length,
                    itemBuilder: (context, index) {
                      return Card(
                        margin: const EdgeInsets.all(10),
                        child: ListTile(
                          leading: Image.asset(
                            widget.foodMenus[index].foodpic.image,
                            width: 60,
                            height: 60,
                            fit: BoxFit.cover,
                          ),
                          title: Text(widget.foodMenus[index].name),
                          subtitle: Text(widget.foodMenus[index].component),
                          trailing: Text("${widget.foodMenus[index].price} บาท"),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              width: 70,
              height: 70,
              child: IconButton(
                icon: const Icon(
                  Icons.add_circle,
                  size: 50,
                  color: Colors.orange,
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AddForm(foodMenus: widget.foodMenus),
                    ),
                  ).then((_) {
                    // รีเฟรชหน้าจอเมื่อกลับมาจากหน้าเพิ่มข้อมูล
                    setState(() {});
                  });
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}