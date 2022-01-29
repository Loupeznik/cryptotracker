import 'package:cryptotracker/screens/all_coins.dart';
import 'package:cryptotracker/screens/my_coins.dart';
import 'package:cryptotracker/screens/popular_coins.dart';
import 'package:cryptotracker/ui/colorscheme.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CryptoTracker"),
        backgroundColor: Colorscheme.darkCornflowerBlue,
      ),
      body: TabBarView(
        children: const <Widget>[
          AllCoinsScreen(),
          MyCoinsScreen(),
          PopularCoinsScreen()
        ],
        controller: controller,
      ),
      bottomNavigationBar: Material(
        color: Colorscheme.darkCornflowerBlue,
        child: TabBar(
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.bar_chart),
              text: "Popular coins",
            ),
            Tab(
              icon: Icon(Icons.view_list),
              text: "All coins",
            ),
            Tab(
              icon: Icon(Icons.person),
              text: "My coins",
            ),
          ],
          controller: controller,
        ),
      ),
    );
  }
}
