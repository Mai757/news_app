
import 'package:flutter/material.dart';

class LoadingStateWidget extends StatelessWidget {
 final String? message;
  const LoadingStateWidget(this.message);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Text(message??''),
          CircularProgressIndicator(),
        ],
      ),);

  }
}
