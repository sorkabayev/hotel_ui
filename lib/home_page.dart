import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hotel_ui/like_page.dart';
import 'package:hotel_ui/models.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  static const String id = "home_page";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 4), () {
      setState(() {
        count == ProductList.products.length - 1 ? count = 0 : count++;
      });
    });

    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
        children: [
          AnimatedContainer(
            height: 300,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage(ProductList.products[count].image),
              fit: BoxFit.cover,
            )),
            duration: const Duration(seconds: 5),
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.5),
                      Colors.black.withOpacity(0.2),
                    ]),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "What kind of hotel you need ?",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10, right: 5),
                    height: 45,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(22),
                        color: Colors.white),
                    child: const TextField(
                      cursorColor: Colors.black,
                      decoration: InputDecoration(
                          hintText: "Search for hotels...",
                          hintStyle: TextStyle(
                            color: Colors.grey,
                          ),
                          suffixIcon: Icon(
                            Icons.search,
                            color: Colors.grey,
                          ),
                          border: InputBorder.none),
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LikePage.id);
                        },
                        icon: const Icon(Icons.favorite, size: 25,)),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LikePage.id);
                        },
                        icon: const Icon(Icons.favorite, size: 25,)),
                    IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, LikePage.id);
                        },
                        icon: const Icon(Icons.favorite, size: 25,)),
                  ],
                ),
                const SizedBox(
                  width: 30,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("Best Hotels",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 10,
                  ),
                  //#Listview
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: ProductList.products.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return elemOfList(ProductList.products[index]);
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  const Text("Business hotel",style: TextStyle(fontWeight: FontWeight.bold),),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 200,
                    child: ListView.builder(
                      itemCount: ProductList2.product.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return elemOfList(ProductList2.product[index]);
                      },
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Card elemOfList(Product e) => Card(
        margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          height: 200,
          width: 260,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(e.image), fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(20)),
          child: Container(
            padding: const EdgeInsets.all(10),
            height: 200,
            width: 260,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.9),
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.0),
                      Colors.black.withOpacity(0.0),
                    ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Hotel ${e.num}",
                    style: const TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                Center(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: IconButton(
                        onPressed: () {
                          setState(() {
                            e.icon = !e.icon;
                            e.icon
                                ? ProductList2.likedList.add(e.image)
                                : ProductList2.likedList.remove(e.image);
                          });
                        },
                        icon: e.icon ? const Icon(Icons.favorite, color: Colors.red,): const Icon(Icons.favorite_border, color: Colors.white,)),
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
