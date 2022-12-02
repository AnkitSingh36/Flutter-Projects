import 'package:flutter/material.dart';
import 'package:recipe_app/components/search_bar.dart';
import 'package:recipe_app/screens/list/list_screen.dart';
import 'dart:math';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
    );
  }
}

AppBar buildAppBar() {
  return AppBar(
    title: const Text('Recipe App'),
  );
}

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SafeArea(
                child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16, top: 0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        const Text(
                          "Menu",
                          style: TextStyle(
                              fontSize: 26, fontWeight: FontWeight.normal),
                        ),
                        Container(
                            padding: const EdgeInsets.only(
                                left: 8, right: 8, top: 2, bottom: 2),
                            height: 30,
                            child: Row(
                              children: const <Widget>[
                                Icon(Icons.shopping_cart,
                                    color: Colors.black, size: 25),
                                SizedBox(
                                  width: 3,
                                ),
                              ],
                            ))
                      ],
                    ))),
            const SearchBar(),
            Container(
              margin: const EdgeInsets.only(top: 40),
              child: Stack(
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 400,
                    decoration: BoxDecoration(
                        color: Colors.red[900],
                        shape: BoxShape.rectangle,
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(25.0),
                            bottomRight: Radius.circular(25.0))),
                  ),
                  Column(
                    children: const <Widget>[
                      CardShapeMenu('Foods',
                          'assets/Images/monstruo-estudio-lQy6mHZ7fYk-unsplash.jpg'),
                      CardShapeMenu('Beverages',
                          'assets/Images/drew-taylor-7liDpl93wt4-unsplash.jpg'),
                    ],
                  ),
                ],
              ),
            )
          ]),
    ));
  }
}

class CardShapeMenu extends StatelessWidget {
  const CardShapeMenu(this.temp_name, this.itemName, {super.key});

  // ignore: non_constant_identifier_names
  final String temp_name;
  final String itemName;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.only(top: 25),
      child: Stack(children: <Widget>[
        Container(
          margin: const EdgeInsets.only(left: 70),
          width: 300,
          height: 80,
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10.0),
              bottomRight: Radius.circular(10.0),
              topLeft: Radius.circular(35.0),
              bottomLeft: Radius.circular(35.0),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                offset: Offset(
                  5.0,
                  5.0,
                ),
                blurRadius: 10.0,
                spreadRadius: 2.0,
              ), //BoxShadow
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.0, 0.0),
                blurRadius: 0.0,
                spreadRadius: 0.0,
              ), //BoxShadow
            ],
            // border: Border.all(color: Colors.black),
          ),
          child: TextDecor(temp_name),
        ),
        Container(
          margin: const EdgeInsets.only(left: 10),
          width: 80,
          height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              image: DecorationImage(
                  image: AssetImage(itemName), fit: BoxFit.cover)),
        ),
        Container(
          margin: const EdgeInsets.only(left: 350, top: 17),
          width: 40,
          height: 40,
          decoration: const BoxDecoration(
              color: Colors.white30,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  offset: Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 2.0,
                ), //BoxShadow
                BoxShadow(
                  color: Colors.white,
                  offset: Offset(0.0, 0.0),
                  blurRadius: 0.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ]),
          child: IconButton(
            onPressed: () => Navigator.push(context,
                MaterialPageRoute(builder: (context) => const ListScreen())),
            icon: Icon(
              Icons.arrow_forward_ios,
              color: Colors.red[900],
            ),
          ),
        )
      ]),
    );
  }
}

class TextDecor extends StatelessWidget {
  TextDecor(this.temp_name, {super.key});

  // ignore: non_constant_identifier_names
  final String temp_name;
  final int random = Random().nextInt(200);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Stack(
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(top: 25, left: 30),
          child: Text(
            temp_name,
            style: const TextStyle(fontWeight: FontWeight.w900, fontSize: 18),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(top: 50, left: 30),
          child: Text(
            '$random Items',
            style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: Colors.black38),
          ),
        ),
      ],
    ));
  }
}
