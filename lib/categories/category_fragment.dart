import 'package:flutter/material.dart';
import 'package:news_app/categories/category_item.dart';
import 'package:news_app/model/category.dart';

typedef OnCategoryClickCallBack = void Function(Category);

class CategoryFragment extends StatelessWidget {
  //VoidCallback onClickSideMenu;
  //final OnCategoryClickCallBack onCategoryClickCallBack;
  final void Function(Category) onCategoryClickCallBack;
   CategoryFragment({super.key,
   required this.onCategoryClickCallBack
   });
  var categoryList = Category.getCategories();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Pick Your Category \nOf Interest',
          style:
          Theme.of(context).textTheme.titleMedium,
          ),
          SizedBox(height: 15,),
          Expanded(
            child: GridView.builder(gridDelegate:SliverGridDelegateWithFixedCrossAxisCount
              (crossAxisCount: 2,
              mainAxisSpacing: 15,
              crossAxisSpacing: 15,

            ),
                itemBuilder: (context,index){
              return InkWell(
                onTap: (){
                  onCategoryClickCallBack(categoryList[index]);
                },
                child: CategoryItem(
                    index: index,
                    category:categoryList[index] ),
              );

                },
              itemCount:categoryList.length ,
            ),
          )
        ],
      ),
    );
  }
}
