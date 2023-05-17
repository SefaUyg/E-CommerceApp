import 'package:ecommerce_app/models/model.dart';

abstract class BaseProductRepository{
  Stream<List<Product>> getAllProducts();
}