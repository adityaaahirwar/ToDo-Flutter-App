import 'dart:convert'; // For JSON encoding/decoding
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo/Model/todo.dart';
import '../Widgets/todo_item.dart';
import '../Constants/colors.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ToDo> todoList = [];
  final TextEditingController _todoController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadToDoList(); // Load tasks when the app starts
  }

  // Function to save tasks to shared preferences
  Future<void> _saveToDoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> todoJsonList = todoList.map((todo) => jsonEncode({
      'id': todo.id,
      'todoText': todo.todoText,
      'isDone': todo.isDone,
    })).toList();
    await prefs.setStringList('todoList', todoJsonList);
  }

  // Function to load tasks from shared preferences
  Future<void> _loadToDoList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? todoJsonList = prefs.getStringList('todoList');
    if (todoJsonList != null) {
      setState(() {
        todoList = todoJsonList.map((todoJson) {
          Map<String, dynamic> todoMap = jsonDecode(todoJson);
          return ToDo(
            id: todoMap['id'],
            todoText: todoMap['todoText'],
            isDone: todoMap['isDone'],
          );
        }).toList();
      });
    }
  }

  // Function to add a new task
  void _addToDoItem(String task) {
    if (task.isNotEmpty) {
      setState(() {
        todoList.add(ToDo(
          id: DateTime.now().toString(),
          todoText: task,
          isDone: false,
        ));
      });
      _todoController.clear();
      _saveToDoList(); // Save updated list to shared preferences
    }
  }

  // Function to toggle the done/undone status
  void _toggleTodoStatus(String id) {
    setState(() {
      todoList.firstWhere((todo) => todo.id == id).isDone =
      !todoList.firstWhere((todo) => todo.id == id).isDone!;
    });
    _saveToDoList(); // Save updated list to shared preferences
  }

  // Function to delete a task
  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((todo) => todo.id == id);
    });
    _saveToDoList(); // Save updated list to shared preferences
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              searchBox(),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Tasks",
                  style: TextStyle(
                    color: tdBlack,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: todoList.length,
                  itemBuilder: (context, index) {
                    return ToDoItem(
                      todo: todoList[index],
                      onToggleDone: _toggleTodoStatus,
                      onDelete: _deleteTodoItem,
                    );
                  },
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    blurRadius: 10,
                    offset: const Offset(0, 5),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _todoController,
                      decoration: InputDecoration(
                        hintText: "Add a new task...",
                        border: InputBorder.none,
                        hintStyle: TextStyle(color: Colors.grey[400]),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      _addToDoItem(_todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: tdBlue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    ),
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: tdBGColor,
      elevation: 0,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(
            Icons.menu,
            color: tdBlack,
            size: 30,
          ),
          Container(
            height: 40,
            width: 40,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.asset(
                'assets/images/avatar.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget searchBox() {
    return Container(
      margin: const EdgeInsets.all(16.0),
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(50),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: const TextField(
        decoration: InputDecoration(
          hintText: "Search...",
          border: InputBorder.none,
          icon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
      ),
    );
  }
}
