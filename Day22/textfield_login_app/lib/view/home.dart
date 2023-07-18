import 'package:flutter/material.dart';
import 'package:textfield_login_app/view/second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController idController;
  late TextEditingController pwController;

  @override
  void initState() {
    super.initState();
    idController = TextEditingController();
    pwController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log In'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(50.0),
                child: CircleAvatar(
                  backgroundImage: AssetImage('images/login.png'),
                  radius: 70,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: idController,
                  decoration: const InputDecoration(
                    labelText: '사용자 ID를 입력하세요.',
                  ),
                  keyboardType: TextInputType.text,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: pwController,
                  decoration: const InputDecoration(
                    labelText: '비밀번호를 입력하세요.',
                  ),
                  keyboardType: TextInputType.text,
                  // Password 안보이게,,
                  obscureText: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                      )),
                  onPressed: () {
                    checkData();
                  },
                  child: const Text('Log In'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // --- Fcuntions ---
  checkData() {
    // 1. Data가 없을 때
    if (idController.text.trim().isEmpty || pwController.text.trim().isEmpty) {
      errorSnackBar();
    } else {
      // 2. Data가 일치 될 때,
      if (idController.text.trim() == "root" &&
          pwController.text.trim() == 'qwer1234') {
        _showDialog();
      } else {
        // 3. Data가 일치하지 않을 때,
        checkSnackBar();
      }
    }
  }

  // id나 password를 입력 안했을 경우
  errorSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('사용자 ID와 암호를 입력하세요.'),
      duration: Duration(seconds: 2),
      backgroundColor: Colors.red,
    ));
  }

  // id나 password가 일치하지 않을 경우
  checkSnackBar() {
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('사용자 ID나 암호가 맞지 않습니다.'),
        duration: Duration(seconds: 2),
        backgroundColor: Colors.blue));
  }

  // id와 password가 일치할 경우
  _showDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('환영 합니다!'),
          content: const Text('신분이 확인 되었습니다.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                String id = idController.text;
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) {
                    return SecondPage(id: id);
                  },
                ));
                idController.text = '';
                pwController.text = '';
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
} // End
