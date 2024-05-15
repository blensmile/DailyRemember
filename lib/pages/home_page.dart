
import 'package:daily_reminder/pages/create_page.dart';
import 'package:daily_reminder/tools/route_helper.dart';
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
      body:SafeArea(
          child: TabBarView(
            // physics: const NeverScrollableScrollPhysics(), // 禁止滑动
              physics: const NeverScrollableScrollPhysics(),
              // physics: const ClampingScrollPhysics(),
              controller: _tabController,
              children: const [
                MyHomePage(title: "Home"),
                MinePage(),
              ]
          )),
      bottomNavigationBar: Container(
          child: TabBar(
              controller: _tabController,
              indicator: const UnderlineTabIndicator(),
              tabs: const [
                Tab(text: "Home",
                  icon: Icon(Icons.home),
                  iconMargin: EdgeInsets.all(1),),
                Tab(text: "Mine",
                  icon: Icon(Icons.account_box_outlined),
                  iconMargin: EdgeInsets.all(1),),
              ]
          )
      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: const Text("Hello Cruel World!"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 获取+按钮的位置
          RenderBox button = context.findRenderObject() as RenderBox;
          Offset offset = button.localToGlobal(Offset.zero);

          // 显示弹出菜单
          _showPopupMenu(context,offset);
        },
        shape: const CircleBorder(),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showPopupMenu(BuildContext context, Offset offset) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(offset.dx, offset.dy, offset.dx, offset.dy),
      items: [
        PopupMenuItem(
          child: const Icon(Icons.book_outlined),
          onTap: () {
            RouteHelper.instance.routeWithAnimation(context, const CreateCardPage());
          },
        ),
        PopupMenuItem(
          child:  const Icon(Icons.wordpress),
          onTap: () {
            RouteHelper.instance.routeWithAnimation(context, const CreateCardPage());
          },
        ),
      ],
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