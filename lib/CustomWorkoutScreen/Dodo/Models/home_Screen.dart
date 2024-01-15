// ignore_for_file: camel_case_types, file_names

import 'dart:math';
import 'package:fitness/CustomWorkoutScreen/Dodo/Box/boxs.dart';
import 'package:fitness/CustomWorkoutScreen/Dodo/Models/notes_model.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';


class toDo_HomeScreen extends StatefulWidget {
  const toDo_HomeScreen({Key? key}) : super(key: key);

  @override
  State<toDo_HomeScreen> createState() => _toDo_HomeScreenState();
}

class _toDo_HomeScreenState extends State<toDo_HomeScreen> {

  final titleController = TextEditingController();
  final descriptionController = TextEditingController();

  List<Color> colors = [Colors.teal, Colors.green, Colors.pinkAccent, Colors.greenAccent] ;

  Random random = Random(3);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title:RichText(
          text: const TextSpan(
            text: 'Gym',
            style: TextStyle(fontSize: 20, color: Colors.white),
            children: [
              TextSpan(text: 'Notes', style: TextStyle(color: Colors.orange)),
            ],
          ),
        ),
      ),
      body: ValueListenableBuilder<Box<NotesModel>>(
        valueListenable: Boxes.getData().listenable(),
        builder: (context,box ,_){
          var data = box.values.toList().cast<NotesModel>();
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: ListView.builder(
                itemCount: box.length,
                reverse: true,
                shrinkWrap: true,
                itemBuilder: (context, index){
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Card(
                      color: colors[random.nextInt(4)],
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                Text(data[index].title.toString() ,
                                  style: const TextStyle(fontSize: 20 , fontWeight: FontWeight.w500 , color: Colors.white),),
                                const Spacer(),
                                InkWell(
                                    onTap: (){
                                      delete(data[index]);
                                    },
                                    child: const Icon(Icons.delete , color: Colors.white,)),
                                const SizedBox(width: 15,),
                                InkWell(
                                    onTap: (){
                                      _editDialog(data[index], data[index].title.toString(), data[index].description.toString());
                                    },
                                    child: const Icon(Icons.edit, color: Colors.black,)) ,

                              ],
                            ),
                            Text(data[index].description.toString(),
                              style: const TextStyle(fontSize: 18 , fontWeight: FontWeight.w300, color: Colors.white),),
                          ],
                        ),
                      ),
                    ),
                  );
                }
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: ()async{
          _showMyDialog();
        },
        child: const Icon(Icons.add,color: Colors.orange),
      ),
    );
  }

  void delete(NotesModel notesModel)async{
    await notesModel.delete() ;
  }


  Future<void> _editDialog(NotesModel notesModel, String title, String description)async{

    titleController.text = title ;
    descriptionController.text = description ;

    return showDialog(
        context: context,
        builder:(context){
          return AlertDialog(
            backgroundColor: Colors.orange.shade500,
            title: const Text('Edit NOTES'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: 'Week 1',
                        border: OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Enter Exercise, Rap & Sets ',
                        border: OutlineInputBorder()
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('Cancel')),

              TextButton(onPressed: ()async{

                notesModel.title = titleController.text.toString();
                notesModel.description = descriptionController.text.toString();

                notesModel.save();
                descriptionController.clear() ;
                titleController.clear() ;
                // box.

                Navigator.pop(context);
              }, child: const Text('Edit')),
            ],
          );
        }
    ) ;
  }

  Future<void> _showMyDialog()async{

    return showDialog(
        context: context,
        builder:(context){
          return AlertDialog(
            title: const Text('Add NOTES'),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                        hintText: 'Week 1',
                        border: OutlineInputBorder()
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: descriptionController,
                    decoration: const InputDecoration(
                        hintText: 'Enter Exercise, Rap & Sets ',
                        border: OutlineInputBorder()
                    ),
                  )
                ],
              ),
            ),
            actions: [
              TextButton(onPressed: (){
                Navigator.pop(context);
              }, child: const Text('Cancel')),

              TextButton(onPressed: (){
                final data = NotesModel(title: titleController.text,
                    description: descriptionController.text,
                ) ;

                final box = Boxes.getData();
                box.add(data);

                // data.save() ;

                titleController.clear();
                descriptionController.clear();

                // box.

                Navigator.pop(context);
              }, child: const Text('Add')),
            ],
          );
        }
    ) ;
  }


}