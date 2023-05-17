import 'package:ecommerce_app/models/model.dart';

abstract class BaseCategoryRepository{
  Stream<List<Category>> getAllCategories();
}