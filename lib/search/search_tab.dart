import 'package:flutter/material.dart';
import 'package:news_app/api/ApiManager.dart';
import 'package:news_app/news/NewsWidget.dart';

class SearchTab extends SearchDelegate{
  @override
  List<Widget>? buildActions(BuildContext context) {
    
    return [
      IconButton(onPressed: (){
        query = "";
        showSuggestions(context);


      },
          icon:Icon(Icons.clear) ),
      
      IconButton(onPressed: (){
        showResults(context);
        
      },
          icon:Icon(Icons.search) ),
      
          
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
        onPressed: (){
          Navigator.pop(context);
        }, 
        icon: Icon(Icons.arrow_back));
  }

  @override
  
  Widget buildResults(BuildContext context) {
    return buildSearchData();
    
  }
  
   
  @override
  Widget buildSuggestions(BuildContext context) {
    if(query.isEmpty){
      return Center(
        child: Text("please enter text to search"),
      );
    }
    return  buildSearchData();
    
  }
  Widget buildSearchData(){
    return FutureBuilder(future: ApiManager.getNewsBySourceId(
        query: query),
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
      },);
  }


}