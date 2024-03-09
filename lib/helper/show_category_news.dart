import 'dart:convert';
import 'package:http/http.dart' as http;

import '../models/show_category.dart';


//fetching data from NewsOrg API using article model class and saving them in news list inorder to use
class ShowCategoryNews{

  //storing news data
  List<ShowCategoryModel> categories = [];

  //getting response from api
  Future<void> getCategoryNews(String category) async {

    //making API call for categoryNewsSection headlines for slider section
    String url = "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=8432dc7378284aca95cccb5667422063";
    var response = await http.get(Uri.parse(url));

    //parsing json data into dart objects format
    var jsonData = jsonDecode(response.body);

    //validating data received and required parameters are not null
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element ["description"] != null){
          ShowCategoryModel categoryModel = ShowCategoryModel(
              author: element["author"],
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]
          );
          categories.add(categoryModel);
        }
      });
    }

  }


}