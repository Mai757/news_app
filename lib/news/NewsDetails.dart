import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/api/model/News.dart';
import 'package:news_app/Extenstion.dart';
import 'package:url_launcher/url_launcher.dart';


class NewsDetails extends StatelessWidget {
  static const String routeName = "NewsDetails";
  const NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)!.settings.arguments as News;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.green,
        centerTitle: true,
        shape: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20)
          )
        ),
        title: Text("News Details",
        style: TextStyle(
          color: Colors.white,fontWeight: FontWeight.bold
        ),),
      ),
      body:  Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 20,
        ),
        CachedNetworkImage(
          width: double.infinity,
          height: 230,
          fit: BoxFit.cover,
          imageUrl: news.urlToImage??"",
          progressIndicatorBuilder: (context, url, downloadProgress) =>
              Center(child: CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => Icon(Icons.error),
        ),
        Text(news.author??""),
        Text("${news.title}",
          style: TextStyle(
            fontSize: 18,
          ),),
        Text("${news.publishedAt?.formatNewsDate()}",
          textAlign: TextAlign.end,),
        SizedBox(
          height: 50,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: (){
                _launchUrl(news.url??"");

              },
              child: Text("View Full Article",
              style: TextStyle(
                fontWeight: FontWeight.w300,color: Colors.black
              ),),
            ),
            Icon(Icons.arrow_forward_ios),
          ],
        ),

      ],
    ),
    );
  }
  Future<void> _launchUrl(String url) async {

    final Uri _url = Uri.parse(url);

    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }
}
