import 'dart:convert';

import '../models/article_model.dart';
import 'package:http/http.dart' as http;


//fetching data from NewsOrg API using article model class and saving them in news list inorder to use
class News{

  //storing news data
  List<ArticleModel> news = [];

  //getting response from api
  Future<void> getNews() async {

    //making API call
    String url = "https://newsapi.org/v2/everything?q=tesla&from=2024-02-08&sortBy=publishedAt&apiKey=8432dc7378284aca95cccb5667422063";
    var response = await http.get(Uri.parse(url));

    //parsing json data into dart objects format
    var jsonData = jsonDecode(response.body);

    //validating data received and required parameters are not null
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element ["description"] != null){
          ArticleModel articleModel = ArticleModel(
            author: element["author"],
            title: element["title"],
            description: element["description"],
            url: element["url"],
            urlToImage: element["urlToImage"],
            content: element["content"]
          );
          news.add(articleModel);
        }
      });
    }

  }


}