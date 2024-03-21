import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/bloc/todo_bloc.dart';
import 'package:todo_app/models/todoModel.dart';
import 'package:todo_app/pages/add_todo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (_) => const AddTodoPage()));
        },
        child: const Icon(Icons.navigate_next),
      ),
      body: BlocBuilder<TodoBloc, List<Todo>>(
        builder: (context, todo) {
          return ListView.builder(
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFF6F6F6F),
                          borderRadius: BorderRadius.all(Radius.circular(12))
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: ListTile(
                                title: Text(todo[index].text),
                              ),
                            ),
                            Expanded(
                              child: ListTile(
                                title: Text(todo[index].date),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,),
                  ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
