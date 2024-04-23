
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HomePage extends StatefulWidget {

  @override
  State<HomePage> createState() => _HomePageState();
}

//create 3 home pages,

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 2, vsync: this, );
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _tabController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: TabBarView(
          controller: _tabController,
          children: [
            MyHomePage(title: "Home"),
            MinePage(),
          ]
      ),
      bottomNavigationBar: BottomAppBar(
          notchMargin :0,
          child: TabBar(
              controller: _tabController,
              tabs: [
                Tab(text: "Home",icon: Icon(Icons.home),iconMargin: EdgeInsets.all(1),),
                Tab(text: "Mine",icon: Icon(Icons.account_box_outlined),iconMargin: EdgeInsets.all(1),),
              ]
          )
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello Cruel World!"),
    );
  }
}

class MinePage extends StatelessWidget {
  const MinePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("Hello Cruel World!"),
    );
  }
}