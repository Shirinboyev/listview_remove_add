import 'package:flutter/material.dart';

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<String> list = [
    "shirinboyev",
    "Niyozboyev",
    "Otaboyev",
  ];
  List<Widget> listFunc() {
    List<Widget> ans = [];
    for (int a = 0; a < list.length; a++) {
      ans.add(ListTile(
        title: Text('${list[a]}'),
        leading: Text('${a + 1}'),
        subtitle: Text('${list[a]}'),
        trailing: IconButton(
            onPressed: () {
              setState(() {
                list.removeAt(a);
              });
            },
            icon: Icon(Icons.highlight_remove)),
      ));
    }
    return ans;
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            TextField(
              controller: _controller,
              // decoration: InputDecoration(),
            ),
            SizedBox(
              height: 15,
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  if (_controller.text != '') {
                    list.add(_controller.text);
                    _controller.text = '';
                  }
                });
              },
              icon: Icon(Icons.add_circle_sharp),
            ),
            SizedBox(
              height: 15,
            ),
            Expanded(
              child: ListView(children: listFunc()),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: MyApp(),
  ));
}
