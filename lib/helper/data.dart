import 'package:stock_news/models/category_model.dart';


//data for categories layout section
List<CategoryModel> getCategories(){
  List<CategoryModel> category = [];
  CategoryModel categoryModel = CategoryModel();

  categoryModel.categoryName = "Business";
  categoryModel.img = "https://media.istockphoto.com/id/1463681745/photo/businessman-use-electronic-pen-writing-rising-colorful-graph-from-2023-to-2024-year-of.jpg?s=1024x1024&w=is&k=20&c=jXzSmKowNJBuHD6jF6ckbpnHQfnbRXLuIX2b3vyD3rY=";
  category.add(categoryModel);
  categoryModel = CategoryModel();


  //2
  categoryModel.categoryName = "Entertainment";
  categoryModel.img = "https://images.unsplash.com/photo-1522869635100-9f4c5e86aa37?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  //3
  categoryModel = CategoryModel();
  categoryModel.categoryName = "General";
  categoryModel.img = "https://images.unsplash.com/photo-1495020689067-958852a7765e?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=800&q=60";
  category.add(categoryModel);

  //4
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Health";
  categoryModel.img = "https://images.unsplash.com/photo-1494390248081-4e521a5940db?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1595&q=80";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Science";
  categoryModel.img = "https://images.unsplash.com/photo-1554475901-4538ddfbccc2?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1504&q=80";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Sports";
  categoryModel.img = "https://images.unsplash.com/photo-1495563923587-bdc4282494d0?ixlib=rb-1.2.1&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  //5
  categoryModel = CategoryModel();
  categoryModel.categoryName = "Technology";
  categoryModel.img = "https://images.unsplash.com/photo-1519389950473-47ba0277781c?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1500&q=80";
  category.add(categoryModel);

  return category;
}