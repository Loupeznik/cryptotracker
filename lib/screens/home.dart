import 'package:cryptotracker/screens/all_coins.dart';
import 'package:cryptotracker/screens/my_coins.dart';
import 'package:cryptotracker/screens/popular_coins.dart';
import 'package:cryptotracker/services/local_database_service.dart';
import 'package:cryptotracker/ui/colorscheme.dart';
import 'package:cryptotracker/widgets/disclaimer.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  HomeScreenState createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController controller;
  late LocalDatabaseService dbService = LocalDatabaseService();

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
        actions: const [
          Disclaimer(),
        ],
      ),
      body: TabBarView(
        children: <Widget>[
          PopularCoinsScreen(
            dbService: dbService,
          ),
          AllCoinsScreen(
            dbService: dbService,
          ),
          MyCoinsScreen(
            dbService: dbService,
          )
        ],
        controller: controller,
      ),
      backgroundColor: Colorscheme.darkCornflowerBlue,
      bottomNavigationBar: Material(
        color: Colorscheme.darkCornflowerBlue,
        child: TabBar(
          tabs: const <Tab>[
            Tab(
              icon: Icon(Icons.calendar_today),
              text: "Popular today",
            ),
            Tab(
              icon: Icon(Icons.bar_chart),
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
