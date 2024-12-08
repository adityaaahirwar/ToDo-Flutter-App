import 'package:flutter/material.dart';
import 'package:todo/Model/todo.dart';
import '../Constants/colors.dart';

class ToDoItem extends StatelessWidget {
  final ToDo todo; // Declare the todo object.
  final Function(String) onToggleDone; // Callback for toggle done/undone
  final Function(String) onDelete; // Callback for delete

  const ToDoItem({
    Key? key,
    required this.todo,
    required this.onToggleDone,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: ListTile(
        onTap: () {
          onToggleDone(todo.id!); // Toggle done/undone when tapped
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone! ? Icons.check_box : Icons.check_box_outline_blank,
          color: tdBlue,
        ),
        title: Text(
          todo.todoText ?? "", // Handle null safety
          style: TextStyle(
            fontSize: 16,
            color: tdBlack,
            decoration: todo.isDone!
                ? TextDecoration.lineThrough // Indicates completed task
                : TextDecoration.none,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: tdRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            padding: EdgeInsets.zero, // Align icon properly
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDelete(todo.id!); // Delete the task when the icon is clicked
            },
          ),
        ),
      ),
    );
  }
}

