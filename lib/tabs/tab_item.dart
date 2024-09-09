
import 'package:flutter/material.dart';
import 'package:news_app/api/model/Source.dart';

class TabItem extends StatelessWidget {

  final Source source;
  final bool isSelected;
  const TabItem({super.key,required this.source,required this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        border: Border.all(color: Colors.green,width: 2),
          color: isSelected? Colors.green:null
      ),
      margin: EdgeInsets.only(top: 12),
      padding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
      child: Text(source.name??"",
      style: TextStyle(color: isSelected ? Colors.white : null),),
    );
  }
}
