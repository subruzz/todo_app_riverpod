import 'package:flutter/material.dart';

class GradientScaffold extends StatelessWidget {
  final Widget body;
  final PreferredSizeWidget? appBar;  
  final Widget? floatingActionButton; 
  final Widget? drawer;              
  final Widget? bottomNavigationBar;  

  const GradientScaffold({
    super.key,
    required this.body,
    this.appBar,
    this.floatingActionButton,
    this.drawer,
    this.bottomNavigationBar,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar,                   
      drawer: drawer,                   
      floatingActionButton: floatingActionButton, 
      bottomNavigationBar: bottomNavigationBar,   
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue[50]!, Colors.white],
          ),
        ),
        child: SafeArea(child: body),     
      ),
    );
  }
}
