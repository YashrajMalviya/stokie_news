import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../helper/news.dart';
import '../helper/slider_data.dart';
import 'article_view.dart';

class AllNews extends StatefulWidget {
  String news;
  AllNews({super.key, required this.news});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  List<dynamic> sliders = []; //saving slider data for slider from slider_data.dart
  List<dynamic> articles = []; //saving news data received from news.dart

  @override
  void initState() {
    // assigning different categories from dart file get categories to categories
    getSlider();
    getNews();
    super.initState();
  }

  //getting news articles data from news.dart
  getNews() async {
    //getting news data and saving in articles
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {

    });
  }

  //for slider news
  getSlider() async {
    //getting news data and saving in articles
    Sliders slider = Sliders();
    await slider.getSlider();
    sliders = slider.sliders;
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${widget.news} News",
            style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w500)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0),
        child: ListView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            itemCount: widget.news == "Breaking"? sliders.length: articles.length,
            itemBuilder: (context, index) {
              return AllNewsSection(
                image: widget.news == "Breaking"? sliders[index].urlToImage! : articles[index].urlToImage!,
                title: widget.news == "Breaking"? sliders[index].title! : articles[index].title!,
                desc: widget.news == "Breaking"? sliders[index].description! : articles[index].description!,
                url: widget.news == "Breaking"? sliders[index].url! : articles[index].url!,
              );
            }),
      ),
    );
  }
}

class AllNewsSection extends StatelessWidget {
  String image, desc, title, url;
  AllNewsSection(
      {super.key,
        required this.image,
        required this.desc,
        required this.title,
        required this.url});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context) => ArticleView(blogUrl: url)));
      },
      child: Container(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: CachedNetworkImage(
                  imageUrl: image,
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  fit: BoxFit.cover),
            ),
            SizedBox(height: 5),
            Text(
              title,
              maxLines: 2,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold),
            ),
            Text(desc, maxLines: 3),
            SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
