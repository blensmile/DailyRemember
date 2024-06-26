
//弹出带确认和取消信息的弹窗
import 'package:flutter/material.dart';

 class Dialogs{

  //flutter 写一个带确认功能的弹窗
  static void showConfirmDialog(BuildContext context,String content,
      {String? title="提示",String? confirmText="确定",String? cancelText="取消",
        VoidCallback? onConfirm,VoidCallback? onCancel}) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: title!=null?Text(title):null,
          content: Text(content),
          actions: [
            cancelText==null?Container(): TextButton(
              child: const Text("取消"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              onPressed: onConfirm??() {
                Navigator.of(context).pop();
              },
              child: const Text("确定"),
            ),
          ],
        );
      },
    );
  }

}