import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

//create 3 home pages,

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(
      length: 2,
      vsync: this,
    );
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
      body: SafeArea(
        child: TabBarView(controller: _tabController, children: const [
          MyHomePage(title: "Home"),
          MinePage(),
        ]),
      ),
      bottomNavigationBar: Container(
          child: TabBar(
              controller: _tabController,
              indicatorColor: Colors.white,
              tabs: const [
            Tab(
              text: "Home",
              icon: Icon(Icons.home),
              iconMargin: EdgeInsets.all(1),
            ),
            Tab(
              text: "Mine",
              icon: Icon(Icons.account_box_outlined),
              iconMargin: EdgeInsets.all(1),
            ),
          ])),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: const Text("Hello Cruel World!"),
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
