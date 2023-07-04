import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late TextEditingController heightController;
  late TextEditingController weightController;
  late String imagepath;
  late String sentence;
  @override
  void initState() {
    super.initState();
    heightController = TextEditingController();
    weightController = TextEditingController();
    imagepath = 'images/bmi.png';
    sentence = '';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('BMI 계산기'),
          backgroundColor: Colors.lightBlue,
          foregroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                TextField(
                  controller: heightController,
                  decoration: const InputDecoration(
                    labelText: '신장을 입력하세요 (단위:cm)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: weightController,
                  decoration: const InputDecoration(
                    labelText: '몸무게를 입력하세요 (단위:kg)',
                  ),
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 40,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    setState(() {
                      outputBMI();
                    });
                  },
                  child: const Text('BMI 계산'),
                ),
                const SizedBox(
                  height: 40,
                ),
                Text(
                  sentence,
                  style: const TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Image.asset(
                  imagepath,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  // ----- Functions ------
  outputBMI() {
    if (heightController.text.isEmpty || weightController.text.isEmpty) {
      errorSnackbar();
    } else {
      // 몸무게 / (신장)^2
      double height = double.parse(heightController.text) / 100;
      double weight = double.parse(weightController.text);
      double bmi =
          double.parse((weight / (height * height)).toStringAsFixed(2));

      DispalyClass(bmi);
    }
  }

  DispalyClass(double bmi) {
    String name;
    if (bmi >= 30) {
      name = '고도비만';
      imagepath = 'images/obese.png';
    } else if (bmi >= 25) {
      name = '비만';
      imagepath = 'images/overweight.png';
    } else if (bmi >= 23) {
      name = '과체중';
      imagepath = 'images/risk.png';
    } else if (bmi >= 18.5) {
      name = '정상체중';
      imagepath = 'images/normal.png';
    } else {
      name = '저체중';
      imagepath = 'images/underweight.png';
    }
    setState(() {
      //print('귀하의 bim지수는 $bmi이고 $name 입니다.');
      sentence = '귀하의 bmi지수는 $bmi이고 [$name] 입니다.';
    });
  }

  errorSnackbar() {
    sentence = '';
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
      content: Text('숫자를 입력하세요.'),
      backgroundColor: Colors.red,
      duration: Duration(seconds: 2), // 스낵바 떠 있는 시간
    ));
  }
} // End
