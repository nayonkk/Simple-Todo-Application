import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  List TodoList = [];
  String Singlevalue = "";

  removeString() {
    controller.clear();
  }

  RemoveList(index) {
    setState(() {
      TodoList.removeAt(index);
    });
  }

  addList() {
    TodoList.add(Singlevalue);
  }

  addString(value) {
    Singlevalue = value;
  }

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        elevation: 0,
        backgroundColor: Colors.blueGrey,
        child: DrawerHeader(
            child: Container(
          height: 100,
          width: 200,
          color: Colors.amber,
        )),
      ),
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text(
            "Todo Application",
          )),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
                flex: 15,
                child: ListView.builder(
                    itemCount: TodoList.length,
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.blueGrey,
                        child: ListTile(
                          title: Text(
                            TodoList[index].toString(),
                            style: const TextStyle(
                                fontSize: 18, fontStyle: FontStyle.italic),
                          ),
                          trailing: GestureDetector(
                            onTap: () {
                              RemoveList(index);
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(5)),
                                height: 40,
                                width: 30,
                                child: const Icon(
                                  Icons.delete_forever,
                                )),
                          ),
                        ),
                      );
                    })),
            Expanded(
              flex: 3,
              child: Row(
                children: [
                  Expanded(
                      flex: 5,
                      child: TextField(
                        cursorColor: Colors.white,
                        style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontStyle: FontStyle.italic),
                        controller: controller,
                        // ignore: non_constant_identifier_names
                        onChanged: (Value) {
                          setState(() {
                            addString(Value);
                          });
                        },
                        decoration: const InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20),
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20)),
                            ),
                            labelText: "Create here...",
                            labelStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                            fillColor: Colors.blueGrey,
                            filled: true,
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20),
                                    bottomLeft: Radius.circular(20),
                                    topLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20)),
                                borderSide: BorderSide(color: Colors.white))),
                      )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      flex: 1,
                      child: SizedBox(
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {
                                setState(() {
                                  removeString();
                                });
                              },
                              child: Center(child: Icon(Icons.remove_done))))),
                  const SizedBox(
                    width: 3,
                  ),
                  Center(
                    child: Expanded(
                        flex: 2,
                        child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    addList();
                                  });
                                },
                                child: Icon(Icons.add)))),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
