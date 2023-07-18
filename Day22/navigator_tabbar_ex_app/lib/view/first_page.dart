import 'package:flutter/material.dart';

import '../model/animal_list.dart';

// 노출된 Class
class FirstPage extends StatefulWidget {
  final List<Animal> list;
  const FirstPage({super.key, required this.list});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

// 노출 안된 Class
class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView.builder(
          // widget -> 상위 클래스를 가르킴.
          itemCount: widget.list.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.all(1.0),
              child: GestureDetector(
                onTap: () {
                  _showDialog(index);
                },
                child: Card(
                  child: Row(
                    children: [
                      Image.asset(
                        widget.list[index].imagePath,
                        width: 100,
                      ),
                      const SizedBox(width: 30),
                      Text(
                        widget.list[index].name,
                        style: const TextStyle(fontSize: 17),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  // --- Functions ---
  _showDialog(int index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(widget.list[index].name),
            content: Text(
              '이 동물은 ${widget.list[index].category}입니다.\n'
              '${widget.list[index].wings ? "날 수 있습니다" : "날 수 없습니다"}',
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
                      Navigator.of(context).pop();
                    },
                    child: const Text('종료'),
                  ),
                ],
              ),
            ],
          );
        });
  }
}
