import 'package:flutter/material.dart';
import 'package:insta_flutter/feed_screen.dart';
import 'package:insta_flutter/profile_screen.dart';

main() {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Dashboard(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class Dashboard extends StatefulWidget {
  Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List bodys = [
    FeedScreen(),
    Container(),
    Container(),
    Container(),
    ProfileScreen()
  ];
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(1),
        child: AppBar(),
      ),
      bottomNavigationBar: NavigationBar(
        height: 60,
        selectedIndex: currentIndex,
        destinations: const [
          Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: NavigationDestination(
              icon: Icon(
                Icons.home,
                // size: 10,
              ),
              selectedIcon: Icon(
                Icons.home,
                // size: 10,
              ),
              label: '',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: NavigationDestination(
              icon: Icon(
                Icons.search,
                // size: 10,
              ),
              selectedIcon: Icon(
                Icons.search,
                // size: 10,
              ),
              label: '',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: NavigationDestination(
              icon: Icon(
                Icons.add_box_outlined,
                // size: 10,
              ),
              selectedIcon: Icon(
                Icons.add_box_outlined,
                // size: 10,
              ),
              label: '',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: NavigationDestination(
              icon: Icon(
                Icons.video_library,
                // size: 10,
              ),
              selectedIcon: Icon(
                Icons.video_library,
                // size: 10,
              ),
              label: '',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 22.0),
            child: NavigationDestination(
              icon: Icon(Icons.person),
              selectedIcon: Icon(Icons.person),
              label: '',
            ),
          ),
        ],
        onDestinationSelected: (index) async {
          currentIndex = index;
          bodys = [
            FeedScreen(),
            Container(),
            Container(),
            Container(),
            ProfileScreen()
          ];

          setState(() {});
        },
      ),
      body: bodys[currentIndex],
    );
  }
}
