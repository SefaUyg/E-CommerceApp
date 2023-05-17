import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Product extends Equatable{
  final String name;
  final String category;
  final String imageURL;
  final double price;
  final bool isRecommended;
  final bool isPopular;
  final String? description;

  const Product({
    required this.name,
    required this.category,
    required this.imageURL,
    required this.price,
    required this.isRecommended,
    required this.isPopular,
    this.description}
  );

  static Product fromSnapshot(DocumentSnapshot snap){
    Product product = Product(
    name: snap['name'], 
    category: snap['category'], 
    imageURL: snap['imageUrl'], 
    price: snap['price'], 
    isRecommended: snap['isRecommended'], 
    isPopular: snap['isPopular'],
    description: snap['description']
    );
    return product;
  }
  
  @override
  List<Object?> get props => [name, category, imageURL, price, isPopular, isRecommended, description];

  static List<Product> products = [
    Product(name: 'Fanta', category: 'Soft Drinks', imageURL: 'https://images.unsplash.com/photo-1632818924360-68d4994cfdb2?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8ZmFudGF8ZW58MHx8MHx8&w=1000&q=80', price: 3.99, isRecommended: true, isPopular: false, description: 'CARBONATED WATER, HIGH FRUCTOSE CORN SYRUP, CITRIC ACID, SODIUM BENZOATE (TO PROTECT TASTE), NATURAL FLAVORS, MODIFIED FOOD STARCH, SODIUM POLYPHOSPHATES, GLYCEROL ESTER OF ROSIN, YELLOW 6, RED 40.'),
    Product(name: 'Coca Cola', category: 'Soft Drinks', imageURL: 'https://images.unsplash.com/photo-1629230151522-467018bde918?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Nnx8Y29jYSUyMGNvbGF8ZW58MHx8MHx8&w=1000&q=80', price: 1.79, isRecommended: false, isPopular: true, description: 'CARBONATED WATER, HIGH FRUCTOSE CORN SYRUP, CARAMEL COLOR, PHOSPHORIC ACID, NATURAL FLAVORS, CAFFEINE.'),
    Product(name: 'Sprite', category: 'Soft Drinks', imageURL: 'https://images.unsplash.com/photo-1680404005217-a441afdefe83?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3ByaXRlJTIwYm90dGxlfGVufDB8fDB8fA%3D%3D&w=1000&q=80', price: 2.99, isRecommended: true, isPopular: true, description: 'CARBONATED WATER, HIGH FRUCTOSE CORN SYRUP, CITRIC ACID, NATURAL FLAVORS, SODIUM CITRATE, SODIUM BENZOATE (TO PROTECT TASTE).'),
    
    Product(name: 'Blue Machine', category: 'Smoothies', imageURL: 'https://i5.walmartimages.com/asr/32add68e-504d-448f-88ee-b6cc8174d6e4_1.4f8a7462a35e5254486e980771d0cd38.jpeg', price: 2.89, isRecommended:true , isPopular: true, description: 'APPLE JUICE, BANANA PUREE, BLUEBERRY PUREE, BLACKBERRY PUREE, CHICORY ROOT FIBER, NATURAL FLAVORS, FRUIT AND VEGETABLE JUICE FOR COLOR, ASCORBIC ACID (VITAMIN C), VITAMIN E (AS ACETATE), NIACINAMIDE, D-CALCIUM PANTOTHENATE (VITAMIN B5), PYRIDOXINE HYDROCHLORIDE (VITAMIN B6), CYANOCOBALAMIN (VITAMIN B12).'),
    Product(name: 'Green Machine', category: 'Smoothies', imageURL: 'https://i5.walmartimages.com/asr/aa23b805-b08f-48f5-a92e-937c477c2fd9_1.14993b9c3f802e9c8e1c47b9e7f94d56.jpeg', price: 2.89, isRecommended: true, isPopular: true, description: 'Apple Juice, Mango Puree, Pineapple Juice, Banana Puree, Kiwi Puree, Spirulina, Natural Flavors, Alfalfa, Broccoli, Spinach, Barley Grass, Wheat Grass, Parsley, Ginger Root, Kale, Odorless Garlic.'),
    Product(name: 'Fruit Juice', category: 'Smoothies', imageURL: 'https://i5.walmartimages.com/asr/3b4fb54a-fe7c-41e3-b341-d996aa33176f.2ca54585e23a82c52f2007a462f8c749.jpeg', price: 2.89, isRecommended: true, isPopular: false, description: 'Pineapple Juice From Concentrate (Water, Pineapple Juice Concentrate), Apple Juice From Concentrate (Water, Apple Juice Concentrate), Mango Puree From Concentrate (Water, Mango Puree Concentrate), Banana Puree, Kiwi Puree, Spirulina Powder, Natural Flavor, Green Tea Extract, Spinach Powder, Broccoli Powder, Barley Grass Powder, Wheat Grass Powder, Garlic Powder, Jerusalem Artichoke Powder, Nova Scotia Dulse Powder.'),
    Product(name: 'Strawberry Banana', category: 'Smoothies', imageURL: 'https://i5.walmartimages.com/asr/439b18f2-73ee-47a3-b10a-69af727648a2.e307aec509603f579fc909f36dc06246.jpeg', price: 2.89, isRecommended: false, isPopular: false, description: 'STRAWBERRY PUREE, APPLE JUICE, BANANA PUREE , ORANGE JUICE, NATURAL FLAVORS.'),
    Product(name: 'Berry Boost', category: 'Smoothies', imageURL: 'https://i5.walmartimages.com/asr/1cccf35d-b6f1-4365-a9bd-4cf77001925e.7a44d637e22e3436a7da5a65344cfea8.jpeg', price: 2.89, isRecommended: false, isPopular: false, description: 'Apple Puree From Concentrate (Water, Apple Puree Concentrate), Apple Juice From Concentrate (Water, Apple Juice Concentrate), Blackberry Puree, Banana Puree, Raspberry Puree, Strawberry Puree, Blueberry Puree, Lemon Juice, Natural Flavor.'),
    
    Product(name: 'Doritos Nacho', category: 'Chips', imageURL: 'https://i5.walmartimages.com/asr/af780c28-d0c0-4fe3-aaa1-61c104098b11.38a97b15d730e88e9c2f3e75ff50a017.jpeg', price: 2.09, isRecommended: false, isPopular: true, description: 'Corn, Vegetable Oil (Sunflower, Canola and/or Corn Oil), Maltodextrin (Made from Corn), Salt, Cheddar Cheese (Milk, Cheese Cultures, Salt, Enzymes), Whey, Monosodium Glutamate, Buttermilk, Romano Cheese (Part-Skim Cow\'s Milk, Cheese Cultures, Salt, Enzymes), Whey Protein Concentrate, Onion Powder, Corn Flour, Natural and Artificial Flavor, Dextrose, Tomato Powder, Lactose, Spices, Artificial Color (Including Yellow 6, Yellow 5, and Red 40), Lactic Acid, Citric Acid, Sugar, Garlic Powder, Skim Milk, Red and Green Bell Pepper Powder, Disodium Inosinate, and Disodium Guanylate.'),
    Product(name: 'Doritos Salsa', category: 'Chips', imageURL: 'https://i5.walmartimages.com/asr/87625939-a6c7-49d4-ab4e-9dac009b8408_1.fc2b778d6ab9ae0aa17542cc9f87d332.jpeg', price: 2.09, isRecommended: false, isPopular: false, description: 'Corn, Vegetable Oil (Corn, Canola, and/or Sunflower Oil), Maltodextrin (Made From Corn), Salt, Monosodium Glutamate, Dextrose, Jalapeno Pepper Powder, Tomato Powder, Paprika, Onion, Citric Acid, Modified Corn Starch, Natural and Artificial Flavors (Including Natural Chicken Flavor), Spices, Garlic, Spice Extractives, Vinegar, Corn Syrup Solids, Artificial Color (Including Yellow 6 Lake, Red 40 Lake, Blue 1 Lake), Parsley, and Lemon Juice.'),
    Product(name: 'Ruffles', category: 'Chips', imageURL: 'https://i5.walmartimages.com/asr/5903dede-4358-4f9e-9af4-6b5b279a0a22.2b60b7bfc03d9799bfd048e5f115c3b0.jpeg', price: 1.99, isRecommended: true, isPopular: true, description: 'Potatoes, Vegetable Oil (Canola, Corn, Soybean, and/or Sunflower Oil), Salt.'),
    Product(name: 'Lays', category: 'Chips', imageURL: 'https://i5.walmartimages.com/asr/6899fc7b-7a12-4ada-b35c-79d82777c3a3.0d4d8e191bb03429c235c7181d64432f.jpeg', price: 1.99, isRecommended: true, isPopular: true, description: 'Potatoes, Vegetable Oil (Sunflower, Corn and/or Canola Oil), and Salt.'),
    Product(name: 'Cheetos Puffs', category: 'Chips', imageURL: 'https://i5.walmartimages.com/asr/f138775e-c50b-4bf8-9f7b-babbe5c3e043_1.12c5d4bed30b6945838596f4a8be0af4.jpeg', price: 1.89, isRecommended: false, isPopular: false, description: 'Enriched Corn Meal (Corn Meal, Ferrous Sulfate, Niacin, Thiamin Mononitrate, Riboflavin, Folic Acid), Vegetable Oil (Corn, Canola, and/or Sunflower Oil), Cheese Seasoning (Whey, Cheddar Cheese [Milk, Cheese Cultures, Salt, Enzymes], Canola Oil, Maltodextrin [Made from Corn], Natural and Artificial Flavors, Salt, Whey Protein Concentrate, Monosodium Glutamate, Lactic Acid, Citric Acid, Artificial Color [Yellow 6]), and Salt.'),
    
    Product(name: 'Fiji Water x6', category: 'Water', imageURL: 'https://i5.walmartimages.com/asr/71d74daa-17ee-44a2-ac7d-c383576c4671_2.4bf354eb67964f543c873ddafeb7c4c7.jpeg', price: 7.68, isRecommended: true, isPopular: true, description: 'Natural Artesian Water.'),
    Product(name: 'ARROWHEAD x35', category: 'Water', imageURL: 'https://i5.walmartimages.com/asr/5a9b8ce5-0e61-40d5-90b0-3910dfa07341.3538031d0951fe3795c145c25039a303.jpeg', price: 7.33, isRecommended: true, isPopular: false, description: '100% mountain spring water.'),
    Product(name: 'DASANI x32', category: 'Water', imageURL: 'https://i5.walmartimages.com/asr/a0c8be36-823e-4063-948c-bbd78eb52458.681cb4fccdc227de7c8a0a4df5ba71cd.jpeg', price: 7.33, isRecommended: true, isPopular: true, description: ' PURIFIED WATER, MAGNESIUM SULFATE, POTASSIUM CHLORIDE, SALT.**MINERALS ADDED FOR TASTE.'),

    Product(name: 'Ferrero Rocher x12', category: 'Chocolates', imageURL: 'https://i5.walmartimages.com/asr/edc83e24-2d80-4c94-af26-c627c3d3611c.59cd3fea6f3d5005d9c5a95e71adcf66.jpeg', price: 4.28, isRecommended: true, isPopular: false, description: 'MILK CHOCOLATE (SUGAR, COCOA BUTTER, COCOA MASS, SKIM MILK POWDER, BUTTEROIL, LECITHIN AS EMULSIFIER (SOY), VANILLIN: AN ARTIFICIAL FLAVOR), HAZELNUTS,SUGAR,PALM OIL,WHEAT FLOUR,WHEY (MILK),LOWFAT COCOA POWDER,LECITHIN AS EMULSIFIER (SOY),SODIUM BICARBONATE AS LEAVENING AGENT, SALT,VANILLIN: AN ARTIFICIAL FLAVOR.'),
    Product(name: 'Hershey\'s Miniatures', category: 'Chocolates', imageURL: 'https://i5.walmartimages.com/asr/0f373284-caf7-4150-9fab-36a3c91f5b83.1a40d137d884cfc83e8fdee6abbe3e17.png', price: 12.58, isRecommended: true, isPopular: true, description: 'SUGAR, CHOCOLATE, VEGETABLE OIL (PALM OIL, PALM KERNEL OIL, SHEA OIL, SUNFLOWER OIL, &/OR SAFFLOWER OIL), PEANUTS, COCOA BUTTER, MILK, LACTOSE (MILK), SKIM MILK, REDUCED PROTEIN WHEY (MILK), RICE FLOUR, CONTAINS 2% OR LESS OF: COCOA PROCESSED WITH ALKALI, MILK FAT, COCOA, LECITHIN (SOY), PGPR, MALT EXTRACT, MONOGLYCERIDES, SALT, NATURAL & ARTIFICIAL FLAVOR.'),
    Product(name: 'Hershey\'s Symphony', category: 'Chocolates', imageURL: 'https://i5.walmartimages.com/asr/fccdc71c-866e-4720-8ffe-46de986b60f6.b2132574459601fc3469eaa83d23fe00.jpeg', price: 2.98, isRecommended: false, isPopular: false, description: 'MILK CHOCOLATE (SUGAR, SKIM MILK, COCOA BUTTER, CHOCOLATE, MILK FAT, LECITHIN (SOY), PGPR, NATURAL FLAVOR), SUGAR, ALMONDS, VEGETABLE OIL (PALM OIL, SUNFLOWER OIL), DAIRY BUTTER (MILK), SALT, LECITHIN (SOY), CHOCOLATE.'),
    Product(name: 'Lindt Lindor', category: 'Chocolates', imageURL: 'https://i5.walmartimages.com/asr/f364cec1-db2c-4b96-8b1b-c82e92971df8.1473f28b1f2eca6faf87473e4e65370a.jpeg', price: 7.18, isRecommended: true, isPopular: true, description: 'Sugar, Vegetable Oil (Coconut, Palm Kernel), Cocoa Butter, Milk, Chocolate, Skim Milk, Milkfat, Soya Lecithin (Emulsifier), Barley Malt Powder, Artificial Flavors.'),

    Product(name: 'fairlife Lactose Free', category: 'Milk', imageURL: 'https://i5.walmartimages.com/asr/1425c34d-9d74-4495-942e-258026ee0c8d.e8266db97604ae00db19e3e963bdf7e0.jpeg', price: 4.38, isRecommended: true, isPopular: true, description: 'REDUCED FAT ULTRA-FILTERED MILK, LACTASE ENZYME, VITAMIN A PALMITATE, VITAMIN D3.'),
    Product(name: 'Lactaid Milk', category: 'Milk', imageURL: 'https://i5.walmartimages.com/asr/a86d74b0-ec45-430d-9479-482679892533_1.8ff9c1fd7992ea711f6163e6aa959a9b.jpeg', price: 6.24, isRecommended: true, isPopular: false, description: 'Milk, Lactase Enzyme* and Vitamin D3 *Ingredient not in regular Milk.'),
    Product(name: 'Horizon Organic', category: 'Milk', imageURL: 'https://i5.walmartimages.com/asr/e599dec8-893e-43e2-bb38-9fe0b65b32c6.addee30187462d600c37ff063a37514e.jpeg', price: 5.44, isRecommended: false, isPopular: false, description: 'INGREDIENTS: Grade A GRASSFED Organic Milk; Vitamin D3.'),

    Product(name: 'PLANTERS Deluxe', category: 'Nuts', imageURL: 'https://i5.walmartimages.com/asr/56546416-da37-463b-b5a7-1768301a2c9b.04051dd82be01be0c7adebb7f19cddf1.jpeg', price: 8.98, isRecommended: true, isPopular: true, description: 'INGREDIENTS: CASHEWS, ALMONDS, BRAZIL NUTS, PISTACHIOS, PECANS, PEANUT OIL, SEA SALT.CONTAINS: CASHEW, ALMOND, BRAZIL NUT, PISTACHIO, PECAN.MAY CONTAIN: PEANUT. OTHER TREE NUTS.'),
    Product(name: 'PLANTERS Pistachio', category: 'Nuts', imageURL: 'https://i5.walmartimages.com/asr/cf1706cd-22f2-4937-99e7-6d1db3b62a1a.6b38403dd79b76cadfecde501326394d.jpeg', price: 11.50, isRecommended: false, isPopular: false, description: 'PISTACHIOS, ALMONDS, CASHEWS, PEANUT OIL, SEA SALT.'),
    Product(name: 'PLANTERS Honey Roasted', category: 'Nuts', imageURL: 'https://i5.walmartimages.com/asr/410a5dce-9f9a-4285-9b38-159054235476.f57f093e7fada0b124e92cdd3d3d156d.jpeg', price: 5.48, isRecommended: true, isPopular: false, description: 'PEANUTS, CASHEWS, ALMONDS, SUGAR, HAZELNUTS (FILBERTS), PECANS, HONEY, CORN SYRUP, SEA SALT, PEANUT OIL, XANTHAN GUM.'),
    Product(name: 'PLANTERS Regular', category: 'Nuts', imageURL: 'https://i5.walmartimages.com/asr/0d8f75fa-a4fc-47e6-883e-596f305c49d7.7365949dbc9382a6ec5105178d5c563f.jpeg', price: 5.48, isRecommended: true, isPopular: true, description: 'INGREDIENTS: PEANUTS, ALMONDS, CASHEWS, BRAZIL NUTS, PECANS, PEANUT OIL, SEA SALT.CONTAINS: PEANUT, ALMOND, CASHEW, BRAZIL NUT, PECAN.MAY CONTAIN: OTHER TREE NUTS.'),
  ];

}