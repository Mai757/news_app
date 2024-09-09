
import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManager.dart';
import 'package:news_app/api/model/Source.dart';
import 'package:news_app/news/NewsWidget.dart';

class NewsListWidget extends StatelessWidget {
  Source? source;
   NewsListWidget(this.source ,{super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12),
      child:
      FutureBuilder(future: ApiManager.getNewsBySourceId(
         sourceId:  source?.id??""),
          builder: (context, snapshot) {
            if(snapshot.hasError){
              return Center(
                child:Column(
                  children: [
                    Text("Something went wrong"),
                    ElevatedButton(onPressed: (){},
                        child: Text("try again"))
                  ],
                ) ,
              );
            }
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            var newsList = snapshot.data?.articles;
             return ListView.separated(
                itemBuilder: (context, index) {
                  return Newswidget(newsList?[index]);
                },
                separatorBuilder: (context, index) =>
                SizedBox(height: 12,),
                itemCount: newsList?.length??0);
          },),
    );
  }
}
