import 'package:flutter/material.dart';
import 'package:navigator_lamp_app/model/mesaage.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  // Property
  late TextEditingController textController;
  late String switchLabel;
  late bool switchValue;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
    textController.text = Message.contents;
    if (Message.lampStatus == true) {
      switchLabel = 'ON';
      switchValue = true;
    } else {
      switchLabel = 'OFF';
      switchValue = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting 화면'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: textController,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(switchLabel),
                  const SizedBox(
                    width: 15,
                  ),
                  Switch(
                    value: switchValue,
                    onChanged: (value) {
                      switchValue = value;
                      if (switchValue) {
                        switchLabel = 'ON';
                      } else {
                        switchLabel = 'OFF';
                      }
                      setState(() {});
                    },
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Message.contents = textController.text;
                    Message.lampStatus = switchValue;
                    Navigator.pop(context);
                  },
                  child: const Text('OK')),
            ],
          ),
        ),
      ),
    );
  }
} // End
