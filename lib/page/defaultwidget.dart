import 'package:flutter/material.dart';

class DefaultWidget extends StatelessWidget {
  const DefaultWidget({super.key, required this.title});
  //khi dùng tham số truyền vào -> khai báo biến trùng tên required
  final String title;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: const TextStyle(fontSize: 30),
          ),
        ],
      ),
    );
  }
}