import 'package:flutter/material.dart';
import 'package:hotel_ui/models.dart';

class LikePage2 extends StatefulWidget {
  const LikePage2({Key? key}) : super(key: key);

  static const String id = "like_page2";

  @override
  _LikePage2State createState() => _LikePage2State();
}

class _LikePage2State extends State<LikePage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(" Business hotel Favorites",
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
            return buildContainer(ProductList2.product[index]);
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
