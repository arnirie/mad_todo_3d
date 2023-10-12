import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  List<String> todoItems = [];

  var item = TextEditingController();

  void addItem() {
    setState(() {
      todoItems.add(item.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: TextField(
                      controller: item,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('ToDo Item'),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 1,
                    child: ElevatedButton.icon(
                        onPressed: addItem,
                        icon: const Icon(Icons.add),
                        label: const Text('ADD')),
                  ),
                  // ElevatedButton(
                  //   onPressed: () {},
                  //   child: Row(
                  //     children: [
                  //       Icon(Icons.add),
                  //       SizedBox(
                  //         width: 2,
                  //       ),
                  //       Text('Add'),
                  //     ],
                  //   ),
                  // )
                ],
              ),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (_, index) {
                    return TodoItem(index + 1, '${todoItems[index]}');
                  },
                  itemCount: todoItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TodoItem extends StatelessWidget {
  TodoItem(this.index, this.item, {super.key});

  int index;
  String item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: ListTile(
        leading: CircleAvatar(
          child: Text('$index'),
        ),
        title: Text(item),
        // subtitle: Text('something'),
        trailing: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.delete_forever,
            color: Colors.red,
          ),
        ),
      ),
    );
  }
}
