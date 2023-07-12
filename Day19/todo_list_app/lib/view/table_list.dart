import 'package:flutter/material.dart';
import 'package:listview_todo_app/model/message.dart';
import 'package:listview_todo_app/view/detail_list.dart';

import '../model/todo_list.dart';

class TableList extends StatefulWidget {
  const TableList({super.key});

  @override
  State<TableList> createState() => _TableListState();
}

class _TableListState extends State<TableList> {
  // Property
  late List<TodoList> todoList;

  @override
  void initState() {
    super.initState();
    todoList = [];
    addData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Main View'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return SizedBox(
                height: 100,
                child: GestureDetector(
                  onTap: () {
                    Message.workList = todoList[index].workList;
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const DetailList()),
                    );
                  },
                  child: Card(
                    // 짝수, 홀수 색깔 다르게
                    color: index % 2 == 0
                        ? Colors.lightGreen
                        : Colors.lightBlueAccent,
                    child: Row(children: [
                      Image.asset(
                        todoList[index].imagePath,
                        width: 100,
                        height: 100,
                      ),
                      const SizedBox(width: 20),
                      Text(
                        todoList[index].workList,
                        style: const TextStyle(
                          //color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ]),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  // --- Functions ---
  addData() {
    todoList.add(TodoList(imagePath: "images/cart.png", workList: '책구매'));
    todoList.add(TodoList(imagePath: "images/clock.png", workList: '철수와 약속'));
    todoList
        .add(TodoList(imagePath: "images/pencil.png", workList: '스터디 준비하기'));
  }
} // End
