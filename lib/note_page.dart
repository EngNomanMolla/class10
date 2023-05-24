import 'package:flutter/material.dart';
import 'package:lesson_9/widgets/alert_dialoge.dart';
class NotePage extends StatefulWidget {
  const NotePage({Key? key}) : super(key: key);

  @override
  State<NotePage> createState() => _NotePageState();
}

class _NotePageState extends State<NotePage> {
  TextEditingController controller=TextEditingController();
  List<String> names=[];

  @override
  Widget build(BuildContext context) {
    print(names);
    return Scaffold(
      appBar: AppBar(
        title: Text('Note App'),
        actions: [
          Padding(padding: EdgeInsets.only(right: 10.0),
          child: InkWell(
            onTap: (){
              showDialog(context: context, builder: (context){

                return CustomAlertDialoge(controller: controller, onPress: (){

                  setState(() {
                    names.add(controller.text);
                    controller.clear();
                    Navigator.pop(context);
                  });


                });

              });


            },
            child: Icon(Icons.add),
          ),
          )
        ],
      ),
      body: Container(
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: names.length,
            itemBuilder: (context,index){
              return ListTile(
                title: Text(names[index]),
                trailing: Container(
                  width: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(onTap: (){
                         controller.text=names[index];
                         showDialog(context: context, builder: (context){

                           return AlertDialog(
                             content: TextField(
                               controller: controller,
                               decoration: InputDecoration(
                                   hintText: 'Enter Name'

                               ),

                             ),
                             actions: [
                               ElevatedButton(onPressed: (){
                                 setState(() {
                                   names[index]=controller.text;
                                   controller.clear();
                                   Navigator.pop(context);
                                 });

                               },
                                   child: Text('Update'))
                             ],

                           );

                         });


                      },
                      child: Icon(Icons.edit),
                      ),


                      InkWell(onTap: (){
                        setState(() {
                          names.removeAt(index);
                        });

                      },
                        child: Icon(Icons.delete),
                      )
                    ],

                  ),
                ),


              );
            }),


      ),

    );
  }
}
