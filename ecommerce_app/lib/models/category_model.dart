import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

class Category extends Equatable{
  final String name;
  final String imageURL;

  const Category({
    required this.name,
    required this.imageURL,
  });

  @override
  List<Object?> get props => [name, imageURL];

  static Category fromSnapshot(DocumentSnapshot snap){
    Category category = Category(name: snap['name'], imageURL: snap['imageUrl']);
    return category;
  }

  static List<Category> categories = [
    Category(
      name: 'Soft Drinks',
      imageURL: 'https://media.istockphoto.com/id/1282672553/photo/glass-of-cold-cola-soft-drink-with-ice-on-wooden-background.jpg?b=1&s=170667a&w=0&k=20&c=MbKkpWJ_mG-grwt0DEHwwbBLcIKdEQdtiIk81rgnYHU=',
    ),
    Category(
      name: 'Smoothies',
      imageURL: 'https://images.unsplash.com/photo-1610970881699-44a5587cabec?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8c21vb3RoaWVzfGVufDB8fDB8fA%3D%3D&w=1000&q=80',
    ),
    Category(
      name: 'Water',
      imageURL: 'https://media.istockphoto.com/id/1312346703/photo/water-pouring-into-glass-on-blue-background.jpg?b=1&s=170667a&w=0&k=20&c=_0Bs2H_qOG6k0r5hIMZrxLKkgAXSiHF5_g7xehGYFGY=',
    ),
    Category(
      name: 'Chips',
      imageURL: 'https://media.istockphoto.com/id/167439679/photo/potato-chips.jpg?b=1&s=170667a&w=0&k=20&c=Su9WSgub6DXwh8eXEOlZOdqSeYX8M7_ykfI5dffDTQ0=',
    ),
    Category(
      name: 'Chocolates',
      imageURL: 'https://media.istockphoto.com/id/463813283/photo/dark-chocolate-bar-on-rustic-wood-table.jpg?b=1&s=170667a&w=0&k=20&c=9ctRNlJ5lT50VakZJV9hn2bJUuRI7oRh226DlOWf-Vk=',
    ),
    Category(
      name: 'Milk',
      imageURL: 'https://images.unsplash.com/photo-1634141510639-d691d86f47be?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fG1pbGt8ZW58MHx8MHx8&w=1000&q=80',
    ),
    Category(
      name: 'Nuts',
      imageURL: 'https://media.istockphoto.com/id/1218693828/photo/wooden-bowl-with-mixed-nuts-on-rustic-table-top-view-healthy-food-and-snack.jpg?b=1&s=170667a&w=0&k=20&c=z0M4nKUBHtFFcU-7IswAl5M64MRVnNzzgvIY0AJsw9I=',
    ),
  ];
  }