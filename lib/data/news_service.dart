import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:newsapp/models/article.dart';
import 'package:newsapp/models/news.dart';

class NewsService {
  static final NewsService _singleton = NewsService._internal();
  NewsService._internal();

  factory NewsService() {
    return _singleton;
  }

  static Future<List<Articles>?> getNews() async {
    var url = Uri.parse(
        'http://newsapi.org/v2/top-headlines?country=tr&category=business&apiKey=f58b94449b4f45b9844a296497a93747');

    final response = await http.get(url);

    if (response.body.isNotEmpty) {
      final responseJson = json.decode(response.body);
      News news = News.fromJson(responseJson);
      return news.articles;
    }
    return null;
  }
}