class ToDo {
  String? id;
  String? todoText;
  bool? isDone;

  ToDo({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<ToDo> todoList() {
    return [
      ToDo(id: '01', todoText: 'Morning Exercise', isDone: true),
      ToDo(id: '02', todoText: 'Read a Book', isDone: true),
      ToDo(id: '03', todoText: 'Buy Groceries'),
      ToDo(id: '04', todoText: 'Plan for the Day'),
      ToDo(id: '05', todoText: 'Call Family'),
      ToDo(id: '06', todoText: 'Work on Project'),
    ];
  }
}
