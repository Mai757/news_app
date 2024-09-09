import 'package:flutter/material.dart';
import 'package:news_app/home/home_screen.dart';


typedef OnClickSideMenu = void Function(SideMenuItemsEnum);
class HomeDrawer extends StatelessWidget {
  final OnClickSideMenu onClickSideMenu;
  const HomeDrawer({super.key,required this.onClickSideMenu});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.green,
            padding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height*.07),
            width: double.infinity,
            child: Text('News App',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),
              textAlign: TextAlign.center,),
          ),
          InkWell(
            onTap: (){
              onClickSideMenu(SideMenuItemsEnum.categories);
            },
            child: Padding(
              padding:  EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.list,size: 40,
                  ),
                  SizedBox(width: 10,),
                  Text('Categories',style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: (){
              onClickSideMenu(SideMenuItemsEnum.settings);
            },
            child: Padding(
              padding:  EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Icon(Icons.settings,size: 40,
                  ),
                  SizedBox(width: 10,),
                  Text('Settings',style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
