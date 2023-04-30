import 'package:cloud_firestore/cloud_firestore.dart';

class NewsListModel {
  final List<NewsModel>? newsList;

  NewsListModel({this.newsList});

  factory NewsListModel.fromFirestore(DocumentSnapshot<Object?> snapshot) {
    final data = snapshot.data() as Map<String, dynamic>?;
    final newsList = data?['newsList'] as List<dynamic>?;

    List<NewsModel>? convertedNewsList;
    if (newsList != null) {
      convertedNewsList = newsList.map((newsData) {
        return NewsModel(
          title: newsData['title'],
          subtitle: newsData['subtitle'],
          text: newsData['text'],
          image: newsData['image'],
        );
      }).toList();
    }

    return NewsListModel(
      newsList: convertedNewsList,
    );
  }
}

class NewsModel {
  final String? title;
  final String? subtitle;
  final String? text;
  final String? image;

  NewsModel({
    this.title,
    this.subtitle,
    this.text,
    this.image,
  });
}
