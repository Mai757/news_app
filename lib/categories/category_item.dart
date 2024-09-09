import 'package:flutter/material.dart';
import 'package:news_app/model/category.dart';

class CategoryItem extends StatelessWidget {
   final Category category;
   final int index;
  const CategoryItem({super.key,required this.category,required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: category.color,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(25),
          topLeft: Radius.circular(25),
          bottomLeft: Radius.circular(index % 2 ==0?25 : 0),
          bottomRight: Radius.circular(index % 2 ==0 ? 0 :25)


        ),
      ),
      child: Column(
        children: [
          Image.asset(category.imgPath,height: MediaQuery.of(context).size.height*.15,
          ),
          Text(category.title,
          style: Theme.of(context).textTheme.titleMedium,),
        ],
      ),
    );
  }
}
