import 'package:flutter/material.dart';

import '../model/message.dart';

class InsertList extends StatefulWidget {
  const InsertList({super.key});

  @override
  State<InsertList> createState() => _InsertListState();
}

class _InsertListState extends State<InsertList> {
  late TextEditingController controller;

  @override
  void initState() {
    super.initState();
    controller = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Add View'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: controller,
                decoration: const InputDecoration(
                  // 무엇을 입력하는 칸인지 알려줌
                  labelText: '목록을 입력하세요.',
                  //hintText: '목록을 입력하세요.',
                ),
                keyboardType:
                    TextInputType.text, // 어떤 타입만 입력 가능하게 해줌. (기본값은 text임)
              ),
              Padding(
                padding: const EdgeInsets.all(50.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                  onPressed: () => addAction(),
                  child: const Text('OK'),
                ),
              ),
            ],
          ),
        ));
  }

  // --- Functions---
  addAction() {
    if (controller.text.trim().isNotEmpty) {
      addList();
    }
    Navigator.pop(context);
  }

  addList() {
    Message.imagePath = 'images/pencil.png';
    Message.workList = controller.text;
    Message.action = true;
  }
} // End
