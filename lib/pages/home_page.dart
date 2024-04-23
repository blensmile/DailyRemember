
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//create 3 home pages,

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, );
  }
  @override
  void dispose() {
    super.dispose();
    _tabController?.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body:TabBarView(
            // physics: const NeverScrollableScrollPhysics(), // 禁止滑动
            physics: const NeverScrollableScrollPhysics(),
            // physics: const ClampingScrollPhysics(),
            controller: _tabController,
            children: const [
              MyHomePage(title: "Home"),
              MinePage(),
            ]
        ),
        bottomNavigationBar:Container(
            child: TabBar(
                controller: _tabController,
                indicator: null,
                tabs: const [
                  Tab(text: "Home",icon: Icon(Icons.home),iconMargin: EdgeInsets.all(1),),
                  Tab(text: "Mine",icon: Icon(Icons.account_box_outlined),iconMargin: EdgeInsets.all(1),),
                ]
            )
        ),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("Hello Cruel World!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class MinePage extends StatelessWidget {
  const MinePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello Cruel World!"),
    );
  }
}