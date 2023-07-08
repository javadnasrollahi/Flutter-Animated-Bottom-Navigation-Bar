import 'package:flutter/material.dart';
import 'package:flutter_animated_bottom_navigation_bar/models/tabIcon.dart';
import 'package:flutter_animated_bottom_navigation_bar/pages/help_screen.dart';
import 'package:flutter_animated_bottom_navigation_bar/pages/home_screen.dart';
import 'package:flutter_animated_bottom_navigation_bar/pages/order_screen.dart';
import 'package:flutter_animated_bottom_navigation_bar/pages/profile_screen.dart';
import 'package:flutter_animated_bottom_navigation_bar/pages/shop_screen.dart';
import 'package:flutter_animated_bottom_navigation_bar/widgets/bottom_bar_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Animated Bottom Navigation Bar'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{

  AnimationController? animationController;

  List<TabIconData> tabIconsList = TabIconData.tabIconsList;
  Widget tabBody = const HomeScreen();
  @override
  void initState() {
    for (var tab in tabIconsList) {
      tab.isSelected = false;
    }
    animationController = AnimationController(
        duration: const Duration(milliseconds: 600), vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    animationController?.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF2F3F8),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Animated Bottom Navigation Bar",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.transparent,
        body: FutureBuilder<bool>(
          future: getData(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (!snapshot.hasData) {
              return const SizedBox();
            } else {
              return Stack(
                children: <Widget>[
                  tabBody,
                  bottomBar(),
                ],
              );
            }
          },
        ),
      ),
    );
  }

  Future<bool> getData() async {
    await Future<dynamic>.delayed(const Duration(milliseconds: 200));
    return true;
  }

  Widget bottomBar() {
    return Column(
      children: <Widget>[
        const Expanded(
          child: SizedBox(),
        ),
        BottomBarView(
          tabIconsList: tabIconsList,
          addClick: () {
            setState(() {
              tabBody = const HomeScreen();
              for (var tab in tabIconsList) {
                tab.isSelected = false;
              }
            });
          },
          changeIndex: (int index) {
              animationController?.reverse().then<dynamic>((data) {
                if (!mounted) {
                  return;
                }
                setState(() {
                  if(index == 0){
                    tabBody = const HelpScreen();
                  }else if(index == 1){
                    tabBody = const OrderScreen();
                  }else if(index == 2){
                    tabBody = const ShopScreen();
                  }else if(index == 3){
                    tabBody = const ProfileScreen();
                  }
                });
              });
            }
        ),
      ],
    );
  }
}
