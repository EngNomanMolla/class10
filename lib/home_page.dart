import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> names = [];
  TextEditingController textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          InkWell(
            onTap: () {
              showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: TextField(
                        controller: textEditingController,
                        decoration: InputDecoration(hintText: 'Enter name'),
                      ),
                      actions: [
                        ElevatedButton(
                            onPressed: () {
                              setState(() {
                                names.add(textEditingController.text);
                                textEditingController.clear();
                                Navigator.pop(context);
                              });
                            },
                            child: Text('Save'))
                      ],
                    );
                  });
            },
            child: Icon(Icons.add),
          )
        ],
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: ListView.builder(
            shrinkWrap: true,
            itemCount: names.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(names[index],style: TextStyle(color: Colors.deepPurple),),
                trailing: SizedBox(
                  width: 100.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            textEditingController.text = names[index];
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    content: TextField(
                                      controller: textEditingController,
                                      decoration:
                                          InputDecoration(hintText: 'Enter name'),
                                    ),
                                    actions: [
                                      ElevatedButton(
                                          onPressed: () {
                                            setState(() {
                                              names[index] = textEditingController.text;
                                              textEditingController.clear();
                                              Navigator.pop(context);
                                            });
                                          },
                                          child: Text('Update'))
                                    ],
                                  );
                                });
                          },
                          child: const Icon(Icons.edit)),
                      InkWell(
                          onTap: () {
                            setState(() {
                              names.removeAt(index);
                            });
                          },
                          child: const Icon(Icons.delete))
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
}
