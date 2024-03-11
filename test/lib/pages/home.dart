import 'package:flutter/material.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/layouts/base.dart';

/*
  Home Screen ----------------
 */
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  HomeScreenState createState() => HomeScreenState();
}

/*
  State Component ----------------
 */
class HomeScreenState extends State<HomeScreen> {
  // Variables ----------------

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Center(
        child: CText('Home Screen'),
      ),
    );
  }
}
