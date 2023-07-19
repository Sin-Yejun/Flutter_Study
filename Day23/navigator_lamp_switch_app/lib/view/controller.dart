import 'package:flutter/material.dart';
import 'package:navigator_lamp_switch_app/model/message.dart';

class Controller extends StatefulWidget {
  const Controller({super.key});

  @override
  State<Controller> createState() => _ControllerState();
}

class _ControllerState extends State<Controller> {
  late String redLabel;
  late String onLabel;
  late bool switchRed;
  late bool switchON;

  @override
  void initState() {
    super.initState();
    if (Mesaage.lampon) {
      onLabel = 'ON ';
      switchON = true;
    } else {
      onLabel = 'OFF';
      switchON = false;
    }

    if (Mesaage.lampred) {
      redLabel = 'Red';
      switchRed = true;
    } else {
      redLabel = 'Yellow';
      switchRed = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('수정화면'),
        backgroundColor: Colors.brown,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 60,
                  child: Text(redLabel),
                ),
                Switch(
                  value: switchRed,
                  onChanged: (value) {
                    switchRed = value;
                    if (switchRed) {
                      redLabel = 'Red';
                    } else {
                      redLabel = 'Yellow';
                    }
                    setState(() {});
                  },
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(width: 60, child: Text(onLabel)),
                  Switch(
                    value: switchON,
                    onChanged: (value) {
                      switchON = value;
                      if (switchON) {
                        onLabel = 'ON';
                      } else {
                        onLabel = 'OFF';
                      }
                      setState(() {});
                    },
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightBlue,
                      foregroundColor: Colors.white),
                  onPressed: () {
                    Mesaage.lampon = switchON;
                    Mesaage.lampred = switchRed;
                    Navigator.pop(context);
                  },
                  child: const Text('OK')),
            ),
          ],
        ),
      ),
    );
  }
}
