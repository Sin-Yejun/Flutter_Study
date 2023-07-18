import 'package:flutter/material.dart';

import '../model/animal_list.dart';
import 'first_page.dart';
import 'second_page.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  late TabController controller;
  late List<Animal> animalList;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
    animalList = [];
    addList();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('동물 친구 찾기'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: TabBarView(
        controller: controller,
        children: [
          FirstPage(list: animalList),
          SecondPage(list: animalList),
        ],
      ),
      bottomNavigationBar: TabBar(
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorColor: Colors.blue,
        controller: controller,
        tabs: const [
          Tab(
            // FirstPage와 매치
            icon: Icon(
              Icons.looks_one,
              color: Colors.lightBlue,
            ),
          ),
          Tab(
            // SecondPage와 매치
            icon: Icon(
              Icons.looks_two,
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }

  // --- Functions
  addList() {
    animalList.add(Animal(
        name: '벌', imagePath: 'images/bee.png', category: '곤충', wings: true));
    animalList.add(Animal(
        name: '고양이',
        imagePath: 'images/cat.png',
        category: '포유류',
        wings: false));
    animalList.add(Animal(
        name: '젖소',
        imagePath: 'images/cow.png',
        category: '포유류',
        wings: false));
    animalList.add(Animal(
        name: '강아지',
        imagePath: 'images/dog.png',
        category: '포유류',
        wings: false));
    animalList.add(Animal(
        name: '여우',
        imagePath: 'images/fox.png',
        category: '포유류',
        wings: false));
    animalList.add(Animal(
        name: '원숭이',
        imagePath: 'images/monkey.png',
        category: '영장류',
        wings: false));
    animalList.add(Animal(
        name: '돼지',
        imagePath: 'images/pig.png',
        category: '포유류',
        wings: false));
    animalList.add(Animal(
        name: '늑대',
        imagePath: 'images/wolf.png',
        category: '포유류',
        wings: false));
  }
} // End
