import 'package:flutter/rendering.dart';
import 'package:news_app/mytheme.dart';

class Category{
  String id;
  String title;
  String imgPath;
  Color color;

  Category({ required this.id,required this.title,
    required this.imgPath,required this.color});

    static List<Category> getCategories(){
      return[
        Category(id: 'sports',
            title:'Sports',
            imgPath: 'lib/assets/images/ball.png',
            color: MyTheme.redColor),

        Category(id: 'general',
            title:'General',
            imgPath: 'lib/assets/images/Politics.png',
            color: MyTheme.darkBlueColor),

        Category(id: 'health',
            title:'Health',
            imgPath: 'lib/assets/images/health.png',
            color: MyTheme.pinkColor),

        Category(id: 'business',
            title:'Business',
            imgPath: 'lib/assets/images/bussines.png',
            color: MyTheme.brownColor),

        Category(id: 'entertainment',
            title:'Entertainment',
            imgPath: 'lib/assets/images/environment.png',
            color: MyTheme.blueColor),

        Category(id: 'science',
            title:'Science',
            imgPath: 'lib/assets/images/science.png',
            color: MyTheme.yellowColor),
      ];
    }




}