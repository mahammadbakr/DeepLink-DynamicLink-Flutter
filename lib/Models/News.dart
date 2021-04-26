import 'package:flutter/cupertino.dart';

class News {
  final String id;
  final String title;
  final String link;
  final String type;
  final String imageURL;

  News({
    @required this.id,
    @required this.title,
    @required this.link,
    @required this.type,
    @required this.imageURL,
  });

  factory News.fromJson(Map<String, dynamic> data) => News(
        id: data["id"],
        title: data["title"],
        link: data["link"],
        type: data["type"],
        imageURL: data["imageURL"],
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'id': id,
        'title': title,
        'link': link,
        'type': type,
        'imageURL': imageURL
      };
}
