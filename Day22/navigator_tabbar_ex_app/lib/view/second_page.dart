import 'package:flutter/material.dart';

import '../model/animal_list.dart';

class SecondPage extends StatefulWidget {
  final List<Animal> list;
  const SecondPage({super.key, required this.list});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  late TextEditingController nameController; // TextField
  late int _radioValue; // Radio Button
  late bool flyExist; // Check Box
  late String _imagePath;
  late String imageName;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _radioValue = 0;
    flyExist = false;
    _imagePath = "";
    imageName = "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: const InputDecoration(
                labelText: '이름을 입력하세요',
              ),

              maxLines: 1, // 한줄이 최대
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('양서류'),
                Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('파충류'),
                Radio(
                  value: 2,
                  groupValue: _radioValue,
                  onChanged: (value) => _radioChange(value),
                ),
                const Text('포유류'),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Text('날 수 있나요?'),
                Checkbox(
                  value: flyExist,
                  onChanged: (value) {
                    flyExist = value!;
                    setState(() {});
                  },
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    child: Image.asset(
                      'images/cow.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/cow.png';
                      imageName = '젖소';
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/pig.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/pig.png';
                      imageName = '돼지';
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/bee.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/bee.png';
                      imageName = '벌';
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/cat.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/cat.png';
                      imageName = '고양이';
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/dog.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/dog.png';
                      imageName = '강아지';
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/fox.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/fox.png';
                      imageName = '여우';
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/monkey.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/monkey.png';
                      imageName = '원숭이';
                      setState(() {});
                    },
                  ),
                  GestureDetector(
                    child: Image.asset(
                      'images/wolf.png',
                      width: 80,
                    ),
                    onTap: () {
                      _imagePath = 'images/wolf.png';
                      imageName = '늑대';
                      setState(() {});
                    },
                  ),
                ],
              ),
            ),
            Text(imageName),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                _showDialog();
              },
              child: const Text('동물 추가하기'),
            ),
          ],
        ),
      ),
    );
  }

  // --- Functions ---
  _radioChange(int? value) {
    _radioValue = value!;
    setState(() {});
  }

  // --- Functions ---
  getKind(int radioValue) {
    switch (radioValue) {
      case 0:
        return "양서류";
      case 1:
        return "파충류";
      case 2:
        return "포유류";
    }
  }

  _showDialog() {
    var animal = Animal(
        name: nameController.text,
        imagePath: _imagePath,
        category: getKind(_radioValue),
        wings: flyExist);
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('동물 추가하기'),
            content: Text(
              '이 동물은 ${animal.name}입니다.\n'
              '또 동물의 종류는 ${animal.category}입니다.\n'
              '이 동물은 ${animal.wings ? "날 수 있습니다" : "날 수 없습니다"}\n'
              '이 동물을 추가하시겠습니까?',
            ),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      widget.list.add(animal);
                      Navigator.of(context).pop();
                    },
                    child: const Text('예'),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        backgroundColor: Colors.lightBlue,
                        foregroundColor: Colors.white),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('아니요'),
                  ),
                ],
              ),
            ],
          );
        });
  }
} // End
