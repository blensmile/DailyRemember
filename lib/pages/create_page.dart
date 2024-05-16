
import 'package:daily_reminder/tools/route_helper.dart';
import 'package:flutter/cupertino.dart';
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
  int buildTime=0;
  bool isChangeable = true;
  late TextEditingController titleController, contentController, descriptionController;
  late FocusNode titleNode, contentNode,descriptionNode;
  late TextStyle nameStyle,editStyle;

  @override
  void initState() {
    super.initState();
    titleController = TextEditingController();
    contentController = TextEditingController();
    descriptionController = TextEditingController();
    titleNode = FocusNode();
    contentNode = FocusNode();
    descriptionNode = FocusNode();
    nameStyle = TextStyle(fontSize: 16,fontWeight: FontWeight.bold);
    editStyle = TextStyle(fontSize: 16);
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
    buildTime++;
    return PopScope(
        canPop: false,
        child:Scaffold(
            appBar: AppBar(
                title: const Text("Create card"),
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
            body:SingleChildScrollView(child:GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: (){
                FocusScope.of(context).requestFocus(FocusNode());
              },
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Padding(padding:EdgeInsets.only(left:10,top: 5),
                        child:Text("Card Name",style: nameStyle,),
                      ),
                      Container(
                        width: double.infinity,
                        padding: const EdgeInsets.all(10,),
                        child: CupertinoTextField(
                          controller: titleController,focusNode: titleNode,
                          minLines: 1,
                          maxLines: 2,
                          style: editStyle,
                        ),
                      ),
                    Padding(padding:EdgeInsets.only(left:10,),child:Text('anser',style: nameStyle,),),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10,),
                      child:CupertinoTextField(
                        controller: contentController,focusNode:contentNode,
                        minLines: 2,
                        maxLines: 4,
                        style: editStyle,
                      ),
                    ),
                    Padding(padding:EdgeInsets.only(left:10,),
                      child:Text('expain',style: nameStyle,),
                    ),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.all(10),
                      child:CupertinoTextField(
                        controller: descriptionController,focusNode: descriptionNode,
                        minLines: 3,
                        maxLines: 6,
                        style: editStyle,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(width: 10,),
                        Text('可交换',style: nameStyle,),
                        SizedBox(width: 20,),
                        CupertinoSwitch(value: isChangeable, onChanged: (b){isChangeable=b;setState(() {
                        });})
                      ],),
                  ]
              ),
        ),),),
    );
  }
}
