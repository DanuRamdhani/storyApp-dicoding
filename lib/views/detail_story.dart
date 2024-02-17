import 'package:flutter/material.dart';

class DetailStoryScreen extends StatelessWidget {
  const DetailStoryScreen({super.key});

  static const routeName = 'detail-story';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detail Story')),
      body: Text('detail-story'),
    );
  }
}
