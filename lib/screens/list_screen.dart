import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';
import 'package:teste_mobx/screens/login_screen.dart';
import 'package:teste_mobx/stores/list_store.dart';
import 'package:teste_mobx/stores/login_store.dart';
import 'package:teste_mobx/widgets/custom_icon_button.dart';
import 'package:teste_mobx/widgets/custom_text_field.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  ListStore listStore = ListStore();

  final TextEditingController textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.fromLTRB(32, 0, 32, 32),
        child: Column(
          children: <Widget>[
            Padding(
                padding: EdgeInsets.symmetric(vertical: 16, horizontal: 2),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      'Tarefas',
                      style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 32),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Provider.of<LoginStore>(context, listen: false).logout();
                        Navigator.of(context).pushReplacement(MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                      },
                    ),
                  ],
                )),
            Expanded(
                child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
              elevation: 16,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  children: <Widget>[
                    Observer(builder: (_) {
                      return CustomTextField(
                        controller: textController,
                        hint: 'Tarefa',
                        onChanged: listStore.setNewTodoTitle,
                        suffix: listStore.isNewTodoTitleValid ? 
                        CustomIconButton(
                          radius: 12,
                          iconData: Icons.add,
                          onTap: () {
                            listStore.addList();
                            textController.clear();
                          },
                        ) : null,
                      );
                    }),
                    SizedBox(
                      height: 8,
                    ),
                    Expanded(child: Observer(builder: (_) {
                      return ListView.separated(
                        itemBuilder: (_, index) {
                        final todo = listStore.todoList[index];
                          return Observer(builder: (_) {
                            return ListTile(
                              title: Text(
                                todo.title,
                                style: TextStyle(
                                  decoration: todo.done ?
                                  TextDecoration.lineThrough : null,
                                  color: todo.done ? Colors.grey : Colors.black
                                ),
                                ), 
                              onTap: todo.toggleDone
                          );
                          });
                        },
                        separatorBuilder: (_, __) {
                          return Divider();
                        },
                        itemCount: listStore.todoList.length,
                      );
                    })),
                  ],
                ),
              ),
            )),
          ],
        ),
      ),
    ));
  }
}
