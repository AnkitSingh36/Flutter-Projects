import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:recipe_app/components/search_bar.dart';
import 'package:recipe_app/components/foodcategory.dart';

import '../../bloc/category_bloc.dart';
import '../../data/repositories/recipe.dart';

void main() => runApp(const ListScreen());

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ListPage(),
    );
  }
}

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          SafeArea(
              child: Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      const Text(
                        "Good Morning Akila!",
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
          Padding(
            padding: const EdgeInsets.only(top: 20, left: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text(
                  "Delivering to",
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(top: 8),
                      child: const Text(
                        'Current Location',
                        style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'RobotoMono',
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 8, right: 230),
                      child: Icon(Icons.keyboard_arrow_down,
                          color: Colors.red[900]),
                    )
                  ],
                )
              ],
            ),
          ),
          const SearchBar(),
          BlocProvider(
            create: ((context) =>
                CategoryBloc(repository: CategoryRepositoryImpl())),
            child: const FoodCategory(),
          )
        ],
      ),
    ));
  }
}
