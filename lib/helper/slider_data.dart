import 'dart:convert';

import 'package:stock_news/models/slider_model.dart';
import 'package:http/http.dart' as http;


//fetching data from NewsOrg API using article model class and saving them in news list inorder to use
class Sliders{

  //storing news data
  List<SliderModel> sliders = [];

  //getting response from api
  Future<void> getSlider() async {

    //making API call for techCruch headlines for slider section
    String url = "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=8432dc7378284aca95cccb5667422063";
    var response = await http.get(Uri.parse(url));

    //parsing json data into dart objects format
    var jsonData = jsonDecode(response.body);

    //validating data received and required parameters are not null
    if(jsonData["status"]=="ok"){
      jsonData["articles"].forEach((element){
        if(element["urlToImage"] != null && element ["description"] != null){
          SliderModel sliderModel = SliderModel(
              author: element["author"],
              title: element["title"],
              description: element["description"],
              url: element["url"],
              urlToImage: element["urlToImage"],
              content: element["content"]
          );
          sliders.add(sliderModel);
        }
      });
    }

  }


}