
import 'package:flutter/material.dart';
import 'package:news_app/categories/category_details.dart';
import 'package:news_app/categories/category_fragment.dart';
import 'package:news_app/home/home_drawer.dart';
import 'package:news_app/model/category.dart';
import 'package:news_app/search/search_tab.dart';
import 'package:news_app/settings/settings_fragment.dart';
import 'package:news_app/ui/utils.dart';


class HomeScreen extends StatefulWidget {
  static const String routeName = 'homeScreen';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.white,
          child: ImageIcon(AssetImage(
            getImagePath('main_background'),

          ),),
          //width: double.infinity,
          //height: double.infinity,
          //fit: BoxFit.cover


        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          drawer: HomeDrawer(onClickSideMenu: onSideMenuClick,),
          appBar: AppBar(
            title: Text('Home Screen'),
            centerTitle: true,
            backgroundColor: Colors.green,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(50),
              ),
            ),
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(context: context,
                        delegate: SearchTab());
                  },
                  icon: Icon(Icons.search,size: 30,))
            ],
          ),
          body:selectedSideMenu == SideMenuItemsEnum.settings?
              const SettingsFragment():selectedCategory == null?
              CategoryFragment(onCategoryClickCallBack: onCategoryClick)

              : CategoryDetails(selectedCategory!),
        ),
      ],
    );
  }

 SideMenuItemsEnum selectedSideMenu= SideMenuItemsEnum.categories;

  void onSideMenuClick(SideMenuItemsEnum newSideMenuItems){
    selectedSideMenu = newSideMenuItems;
    Navigator.pop(context);
    selectedCategory = null;
    setState(() {

    });
  }
  Category? selectedCategory;
    void onCategoryClick(Category category){
    selectedCategory = category;
    setState(() {

    });

  }
}

enum SideMenuItemsEnum{
  categories,
  settings
}
