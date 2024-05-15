
import 'package:daily_reminder/tools/route_helper.dart';
import 'package:flutter/material.dart';

import '../views/dialogs.dart';

class CreatBookPage extends StatefulWidget {
  const CreatBookPage({super.key});
  @override
  State<CreatBookPage> createState() => _CreatBookPageState();
}

class _CreatBookPageState extends State<CreatBookPage> {

  bool isEdited=false;

  @override
  Widget build(BuildContext context) {
    return PopScope(
        canPop: true,
        onPopInvoked: (b)=> b=true,
        child: Scaffold(
          appBar: AppBar(
              title: const Text("Create Book"),
              leading: IconButton(
                icon: const Icon(Icons.arrow_back,size: 12,),
                onPressed: (){
                  if(isEdited){
                    Dialogs.showConfirmDialog(context, "未保存, 是否直接退出?",onConfirm: (){
                      RouteHelper.instance.pop(context);
                      RouteHelper.instance.pop(context);
                    });
                  }else{
                    // RouteHelper.instance.pop(context);
                  }
                },
              )
          ),
          body: Container(
            child: const Text("Hello Cruel World!"),
          ),
        )
    );
  }
}

class CreateCardPage extends StatefulWidget {
  const CreateCardPage({super.key});
  @override
  State<CreateCardPage> createState() => _CreateCardPageState();
}

class _CreateCardPageState extends State<CreateCardPage> {

  bool isEdited=false;
  late TextEditingController titleController, contentController, descriptionController;
  late FocusNode titleNode, contentNode,descriptionNode;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
    descriptionController = TextEditingController();
    titleNode = FocusNode();
    contentNode = FocusNode();
    descriptionNode = FocusNode();
  }

  @override
  void dispose() {
    super.dispose();
    titleController.dispose();
    contentController.dispose();
    descriptionController.dispose();
    titleNode.dispose();
    contentNode.dispose();
    descriptionNode.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  PopScope(
        canPop: false,
        child:Scaffold(
            appBar: AppBar(
                title: const Text("Create Book"),
                leading: IconButton(
                  icon: const Icon(Icons.arrow_back),
                  onPressed: (){
                    if(isEdited){
                      Dialogs.showConfirmDialog(context, "未保存, 是否直接退出?",onConfirm: (){
                        RouteHelper.instance.pop(context);
                        RouteHelper.instance.pop(context);
                      });
                    }else{
                      RouteHelper.instance.pop(context);
                    }
                  },
                )
            ),
            body:Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      const Text("Book Name"),
                      Container(
                        width: 200,
                        // decoration: BoxDecoration(
                        //   border: BoxBorder(
                        //     borderSide: BorderSide(color: Colors.white),
                        //   ),
                        // ),
                        child: TextField(
                         controller: titleController,focusNode: titleNode,
                        ),
                      )
                    ],)
                  ]
              ),
        )
    );
  }
}
