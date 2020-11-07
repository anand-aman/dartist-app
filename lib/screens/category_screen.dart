import 'package:dartist_app/components/my_button.dart';
import 'package:dartist_app/model/category.dart';
import 'package:dartist_app/services/firebase_user.dart';
import 'package:flutter/material.dart';
import 'package:dartist_app/components/category_card.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CategoriesScreen extends StatefulWidget {
  @override
  _CategoriesScreenState createState() => _CategoriesScreenState();
}

class _CategoriesScreenState extends State<CategoriesScreen> {
  Category category = Category();
  final _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.grey,
          body: Stack(
            children: [
              GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                itemBuilder: (BuildContext context, int index) {
                  bool isSelected = false;
                  return CategoryCard(
                    text: category.categoryList[index],
                    isSelected: category.categoryBool[index],
                    onPress: () {
                      setState(() {
                        category.categoryBool[index] = !category.categoryBool[index];
                      });
                    },
                  );
                },
                itemCount: category.categoryList.length,
              ),
              Positioned(
                left: MediaQuery.of(context).size.width * 0.5 - 50,
                child: MyButton(
                  text: 'Continue..',
                  width: 100.0,
                  onPressed: () async {
                    await FirebaseCurrentUser().addCategory(category);
                    await FirebaseCurrentUser().updateCategory(category);
                  },
                ),
                bottom: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
