import 'package:flutter/material.dart';
import 'package:teste_mobx/screens/login_screen.dart';
import 'package:teste_mobx/widgets/custom_icon_button.dart';
import 'package:teste_mobx/widgets/custom_text_field.dart';

class ListScreen extends StatefulWidget {
  ListScreen({Key key}) : super(key: key);

  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
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
                        fontSize: 32
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.exit_to_app),
                      color: Colors.white,
                      onPressed: () {
                        Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context)=>LoginScreen())
                        );
                      },
                    ),
                  ],
                )
              ),
              Expanded(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16) 
                    ),
                    elevation: 16,
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        children: <Widget>[
                          CustomTextField(
                            hint: 'Tarefa',
                            onChanged: (todo) {

                            },
                            suffix: CustomIconButton(
                              radius: 12,
                              iconData: Icons.add,
                              onTap: () {

                              },
                            ),
                          ),
                          SizedBox(height: 8,),
                          Expanded(
                            child: ListView.separated(
                              itemBuilder: (_, index) {
                                return ListTile(
                                  title: Text(
                                    'item $index'
                                  ),
                                  onTap: () {

                                  }
                                );
                              }, 
                              separatorBuilder: (_, __) {
                                return Divider();
                              }, 
                              itemCount: 10,
                            ) 
                          ),
                        ],
                      ),
                    ),
                )
              ),
            ],
          ),
        ),
    ));
  }
}