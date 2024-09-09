
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Extenstion.dart';
import 'package:news_app/api/model/News.dart';
import 'package:news_app/news/NewsDetails.dart';

class Newswidget extends StatelessWidget {
  News? news;
   Newswidget(this.news,{super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Navigator.pushNamed(context, NewsDetails.routeName,arguments: news);
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: CachedNetworkImage(
              width: double.infinity,
              height: 230,
              fit: BoxFit.cover,
              imageUrl: news?.urlToImage??"",
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
          ),
          Text(news?.author??""),
          Text("${news?.title}",
          style: TextStyle(
            fontSize: 18,
          ),),
          Text("${news?.publishedAt?.formatNewsDate()}",
          textAlign: TextAlign.end,),

        ],
      ),
    );
  }
}
