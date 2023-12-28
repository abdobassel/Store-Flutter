import 'package:flutter/material.dart';

class UpdatePage extends StatelessWidget {
  const UpdatePage({super.key});
  static String id = 'updateScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0, backgroundColor: Colors.white, title: Text('Update')),
    );
  }
}
