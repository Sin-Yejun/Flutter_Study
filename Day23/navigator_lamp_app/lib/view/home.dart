import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/mesaage.dart';
import 'package:navigator_lamp_app/view/controller.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController textcontroller;
  late String lamgImage;

  @override
  void initState() {
    super.initState();
    textcontroller = TextEditingController();
    lamgImage = 'images/lamp_on.png';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main 화면'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
        actions: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        Message.contents = textcontroller.text;
                        return const Controller();
                      },
                    ),
                    // Controller 에서 뭔가 한 정보를 받아와야함.
                  ).then((value) => getData());
                },
                icon: const Icon(Icons.edit)),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textcontroller,
                keyboardType: TextInputType.text,
                decoration: const InputDecoration(
                  labelText: "글자를 입력하세요",
                ),
              ),
            ),
            Image.asset(
              lamgImage,
              width: 150,
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  getData() {
    textcontroller.text = Message.contents;
    if (Message.lampStatus) {
      lamgImage = 'images/lamp_on.png';
    } else {
      lamgImage = 'images/lamp_off.png';
    }
    setState(() {});
  }
} // End
