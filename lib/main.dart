import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var _contorllar = TextEditingController();
  List<String> NoteList = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          // This Part was for search but know Not Work
          // actions: [
          //   IconButton(
          //       icon: Icon(Icons.search),
          //       iconSize: 35,
          //       color: Colors.white,
          //       onPressed: () {
          //         NoteList.contains(_contorllar.text)
          //             ? Expanded(
          //           child: ListView.builder(
          //             itemBuilder: (context, index) {
          //               return ListTile(
          //                 title: Text(_contorllar.text),
          //               );
          //             },
          //           ),
          //         )
          //             : ScaffoldMessenger.of(context).showSnackBar(
          //           SnackBar(
          //             content: Text('Not Found!!!'),
          //           ),
          //         );
          //         setState(() {});
          //       })
          // ],
          backgroundColor: Colors.teal,
          title: Text(
            'Note Application',
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 40.0, horizontal: 10),
              child: TextField(
                controller: _contorllar,
                decoration: InputDecoration(
                  label: Text(
                    'Enter Note',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.grey,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      width: 2,
                      color: Colors.teal,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(
                      style: BorderStyle.solid,
                      width: 1,
                      color: Colors.teal,
                    ),
                  ),
                ),
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal.shade200),
              onPressed: () {
                setState(() {
                  //Chick Empty Note
                  _contorllar.text.isEmpty
                      ? ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Cant add empty note 😒'),
                          ),
                        )
                      : NoteList.add(_contorllar.text);
                  _contorllar.clear();
                });
              },
              child: Text('Add Note'),
            ),
            SizedBox(
              height: 50,
            ),
            NoteList.isEmpty
                ? Expanded(
                    child: Center(
                      child: Text(
                        'Empty List 😔',
                        style: TextStyle(
                            fontFamily: 'myFont',
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                        itemCount: NoteList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8.0, vertical: 1.0),
                            child: Card(
                              color: Colors.teal,
                              child: ListTile(
                                textColor: Colors.white,
                                titleTextStyle: TextStyle(fontSize: 20),
                                trailing: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        NoteList.removeAt(index);
                                      });
                                    },
                                    child: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    )),
                                title: Text(NoteList[index]),
                              ),
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
