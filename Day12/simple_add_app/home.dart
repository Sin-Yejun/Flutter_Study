import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late int sum;
  late TextEditingController numController1;
  late TextEditingController numController2;

  @override
  void initState() {
    super.initState();
    sum = 0;
    numController1 = TextEditingController();
    numController2 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('간단한 덧셈 계산기'),
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '덧셈 결과 : $sum',
                  style: const TextStyle(
                    fontSize: 20,
                  ),
                ),
              ],
            ),
            Container(
              color: Colors.lightGreen,
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: numController1,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Container(
              color: Colors.amber,
              child: SizedBox(
                width: 300,
                child: TextField(
                  controller: numController2,
                  keyboardType: TextInputType.number,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    pressButton();
                  },
                  child: const SizedBox(
                    width: 250,
                    child: Row(
                      children: [
                        Icon(Icons.add),
                        Padding(
                          padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
                          child: Text('덧셈계산'),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  pressButton() {
    if (numController1.text.trim().isEmpty ||
        numController2.text.trim().isEmpty) {
      errorSnackbar();
    } else {
      int val1 = int.parse(numController1.text);
      int val2 = int.parse(numController2.text);
      setState(() {
        sum = val1 + val2;
      });
    }
  }

  errorSnackbar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요.'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2), // 스낵바 떠 있는 시간
    ));
  }
} // END
