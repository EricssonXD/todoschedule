import 'package:flutter/material.dart';
import 'package:todoschedule/todolist/index.dart';
import 'package:todoschedule/utils/responsive_layout.dart';

class TodolistScreen extends StatelessWidget {
  const TodolistScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const ResponsivePlatform(
      webScreen: _Web(),
      windowsScreen: _Windows(),
      androidScreen: _Android(),
    );
  }
}

class _Web extends StatelessWidget {
  const _Web();

  @override
  Widget build(BuildContext context) {
    return const Text("Lol WebView");
  }
}

class _Windows extends StatelessWidget {
  const _Windows();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Text("Weendowws"),
        _Content(),
      ],
    );
  }
}

class _Android extends StatelessWidget {
  const _Android();

  @override
  Widget build(BuildContext context) {
    return const Text("Ahhhndroid");
  }
}

class _Content extends StatefulWidget {
  const _Content();

  @override
  State<_Content> createState() => _ContentState();
}

class _ContentState extends State<_Content> {
  List<TodolistModel> _todoList = [];

  Future _openDialog(String action,
          [TodolistModel? item, TextEditingController? controller]) =>
      showDialog(
        context: context,
        builder: (_) {
          controller ??= TextEditingController();
          submit() async {
            if (item != null) {
              item.task = controller!.text;
              _saveData();
            } else {
              context.read<TodolistProvider>().addTodo(task: controller!.text);
            }
            Navigator.of(context).pop();
          }

          return AlertDialog(
            title: Text("$action Task"),
            content: TextField(
              controller: controller,
              autofocus: true,
              onSubmitted: ((value) => submit()),
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    submit();
                    controller?.dispose();
                  },
                  child: const Text("Done"))
            ],
          );
        },
      );

  @override
  void initState() {
    initTodoList();
    super.initState();
  }

  void initTodoList() async {
    _todoList = context.read<TodolistProvider>().todoList;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    _todoList = context
        .watch<TodolistProvider>()
        .todoList; //Auto Refresh and update TodoList
    return Expanded(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        floatingActionButton: FloatingActionButton(
          onPressed: () => _openDialog("Create"),
          child: const Icon(Icons.add),
        ),
        body: _todoList.isEmpty ? emptyListView() : buildListView(),
      ),
    );
  }

  Widget emptyListView() {
    return const Center(
      child: Text("Wow! Such Empty"),
    );
  }

  Widget buildListView() {
    // print(_todoList.length);
    return ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: ((context, index) => buildItem(_todoList[index], index)));
  }

  Widget buildItem(TodolistModel item, index) {
    return Column(
      children: [
        Dismissible(
          key: Key("${item.hashCode}"),
          confirmDismiss: (direction) async {
            if (item.completed) return true;
            return await confirmDismiss(item);
            //Only ask for confirmation when Task is not completed
          },
          onDismissed: ((direction) => removeTodo(item)),
          background: Container(
            color: Colors.red,
          ),
          child: buildListTile(item, index),
        ),
        // const Divider(
        //   color: Colors.black,
        // )
      ],
    );
  }

  Widget buildListTile(TodolistModel item, index) {
    TextEditingController controller = TextEditingController();

    return ListTile(
      onLongPress: () => _openDialog("Edit", item, controller),
      onTap: () => changeItemCompletion(item),
      title: Text(item.task),
      // onTap: changeItemCompletion(item),
      trailing: Checkbox(
        onChanged: (_) => changeItemCompletion(item),
        value: item.completed,
      ),
    );
  }

  removeTodo(item) {
    context.read<TodolistProvider>().deleteTodo(item);
  }

  changeItemCompletion(TodolistModel item) {
    item.completed = !item.completed;
    _saveData();
  }

  _saveData() {
    context.read<TodolistProvider>().saveData();
  }

  Future<bool?> confirmDismiss(TodolistModel item) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: true,
      builder: (_) {
        return AlertDialog(
          title: const Text(
              'You have not finished this task yet\nAre you sure you want to delete it?'),
          actions: <Widget>[
            TextButton(
                onPressed: () => {Navigator.pop(context, false)},
                child: const Icon(Icons.close)),
            TextButton(
                onPressed: () => {Navigator.pop(context, true)},
                child: const Icon(Icons.check))
          ],
        );
      },
    );
  }
}
