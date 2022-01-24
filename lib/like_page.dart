import 'package:flutter/material.dart';
import 'package:hotel_ui/models.dart';

class LikePage extends StatefulWidget {
  const LikePage({Key? key}) : super(key: key);

  static const String id = "like_page";

  @override
  _LikePageState createState() => _LikePageState();
}

class _LikePageState extends State<LikePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(" Best Hotel Favorites",
        style: TextStyle(color: Colors.white,fontSize: 25),),
        backgroundColor: Colors.black,
      ),
      body: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
          padding: const EdgeInsets.all(20),
          gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20),
          itemCount: ProductList2.likedList.length,
          itemBuilder:(context, index){
          return buildContainer(ProductList.products[index]);
    }),
    );
  }

  Container buildContainer(Product e) => Container(
    alignment: Alignment.bottomCenter,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(25),
      image: DecorationImage(
        image: AssetImage(e.image),fit: BoxFit.cover,
      )
    ),
  );
}
