import 'package:flutter/material.dart';

import '../widget/drawercontent.dart';

class FilterScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filter'),
      ),
      drawer: DrawerContent(),
      body: Center(
        child: Text("filter"),
      ),
    );
  }
}
