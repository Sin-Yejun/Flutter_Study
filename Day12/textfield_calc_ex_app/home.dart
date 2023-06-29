import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController val1;
  late TextEditingController val2;
  late TextEditingController val3;
  late TextEditingController val4;
  late TextEditingController val5;
  late TextEditingController val6;

  @override
  void initState() {
    super.initState();
    val1 = TextEditingController();
    val2 = TextEditingController();
    val3 = TextEditingController();
    val4 = TextEditingController();
    val5 = TextEditingController();
    val6 = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('간단한 계산기'),
        centerTitle: true,
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).unfocus();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: val1,
                  decoration: const InputDecoration(
                    // 무엇을 입력하는 칸인지 알려줌
                    labelText: '첫번째 숫자를 입력하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: val2,
                  decoration: const InputDecoration(
                    // 무엇을 입력하는 칸인지 알려줌
                    labelText: '두번째 숫자를 입력하세요.',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lightBlue,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () {
                        inputCheck();
                      },
                      child: const Text(
                        '계산하기',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          )),
                      onPressed: () {
                        erase();
                      },
                      child: const Text(
                        '지우기',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                TextField(
                  controller: val3,
                  decoration: const InputDecoration(
                    // 무엇을 입력하는 칸인지 알려줌
                    labelText: '덧셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: val4,
                  decoration: const InputDecoration(
                    // 무엇을 입력하는 칸인지 알려줌
                    labelText: '뺄셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: val5,
                  decoration: const InputDecoration(
                    // 무엇을 입력하는 칸인지 알려줌
                    labelText: '곱셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: val6,
                  decoration: const InputDecoration(
                    // 무엇을 입력하는 칸인지 알려줌
                    labelText: '나눗셈 결과',
                  ),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  inputCheck() {
    // trim()은 앞뒤 스페이스를 다 제거해주는 역할, check할 때 꼭 필요함.
    if (val1.text.trim().isEmpty || val2.text.trim().isEmpty) {
      errorSnackbar();
    } else {
      int value1 = int.parse(val1.text); // String to int
      int value2 = int.parse(val2.text); // String to int

      setState(() {
        val3.text = (value1 + value2).toString();
        val4.text = (value1 - value2).toString();
        val5.text = (value1 * value2).toString();
        val6.text = (value1 / value2).toString();
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

  erase() {
    setState(() {
      val1.clear();
      val2.clear();
      val3.clear();
      val4.clear();
      val5.clear();
      val6.clear();
    });
  }
} // End
