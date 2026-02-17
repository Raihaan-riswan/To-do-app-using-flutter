import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  String displayText = "NO TEXT DATA";
  TextEditingController textController = TextEditingController();
  List<String> taskList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("To do app"),
          backgroundColor: Colors.blue,
          centerTitle: true,
        ),
        body: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    width: 40,
                    padding: EdgeInsets.all(5),
                    child: TextField(
                        controller: textController,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            label: Text("Enter the task"))),
                  ),
                ),
                Container(
                    child: MaterialButton(
                  height: 50,
                  textColor: Colors.black,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      taskList.add(textController.text);
                      textController.clear();
                    });
                  },
                  child: Text("Click"),
                  minWidth: 5,
                )),
              ],
            ),

            Flexible(
              child: ListView.builder(
                itemCount: taskList.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          child: Text(taskList[index]),
                        ),
                      ),
                      MaterialButton(
                        child: Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          setState(() {
                            taskList.removeAt(index);
                          });
                        },
                      )
                    ],
                  );
                },
              ),
            ),
            // ListView.builder(itemBuilder: (context, index) {

            // })
          ],
        ),
      ),
    );
  }
}
