import 'package:news_app/api/model/Source.dart';


/// source : {"id":null,"name":"Gizmodo.com"}
/// author : "Passant Rabie"
/// title : "Crypto Bro Charters Private SpaceX Mission to Earth’s Poles"
/// description : "Fram2 could fly as early as this year, marking SpaceX's seventh private crew of astronauts."
/// url : "https://gizmodo.com/crypto-bro-charters-private-spacex-mission-to-earths-poles-2000486329"
/// urlToImage : "https://gizmodo.com/app/uploads/2024/08/SpaceX-Private-Mission.jpeg"
/// publishedAt : "2024-08-13T16:05:37Z"
/// content : "A private crew of astronauts that includes a cinematographer and an explorer, and commanded by a wealthy bitcoin entrepreneur, will be the first human spaceflight to go over Earth’s polar region.\r\nSp… [+2136 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}