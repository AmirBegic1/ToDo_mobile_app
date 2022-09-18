import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/model/ToDo_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ChangeNotifierProvider(
        create: (context) => TodoModel(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.lightBlue,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            "Todo App",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
              color: Colors.white70,
            ),
            onPressed: () {},
          ),
        ),
        body: Column(
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                SizedBox(
                  height: 20,
                ),
                Text(
                  "02 : 36 PM",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 45,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "current time",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                  ),
                ),
                SizedBox(
                  height: 20,
                )
              ],
            ),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(50),
                    topLeft: Radius.circular(50),
                  ),
                  color: Colors.white,
                ),
                child: Consumer<TodoModel>(
                  builder: (context, todo, child) {
                    return ListView.builder(
                      itemCount: todo.taskList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(
                              bottom: 8, left: 16, right: 16),
                          child: ListTile(
                            contentPadding: EdgeInsets.only(
                                left: 32, right: 32, top: 8, bottom: 8),
                            title: Text(
                              todo.taskList[index].title,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            subtitle: Text(
                              todo.taskList[index].detail,
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            trailing: Icon(
                              Icons.check_circle,
                              color: Colors.greenAccent,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Provider.of<TodoModel>(context, listen: false).addTaskInList();
          },
        ),
      ),
    );
  }
}
