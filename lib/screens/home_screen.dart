import 'dart:ui';

import 'package:cosmetic_app/widgets/featured_products.dart';
import 'package:cosmetic_app/widgets/item_product.dart';
import 'package:cosmetic_app/widgets/see_all.dart';
import 'package:cosmetic_app/widgets/tab_select.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  var selectedIndex = 1;

  List<String> _listImage = [
    'assets/images/eczemaRelief.png',
    'assets/images/Peppermint.png',
    'assets/images/Lavender.png',
  ];

  List<String> _listLeaf = [
    'assets/images/oatmeal.png',
    'assets/images/ment.png',
    'assets/images/oatmeal.png',
  ];

  List<String> _listName = [
    'Intensive Cream',
    'Bath & Shower Gel',
    'Eczema Cream',
  ];

  List<String> _listImageFeat = [
    'assets/images/vitamin-c.png',
    'assets/images/eczemareliefbodycream.png',
  ];

  List<String> _listDecFeat = [
    'Vitamin C',
    'Therapy',
  ];

  List<String> _listNameFeat = [
    'Moisturizer',
    'Eczema Cream',
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffEFEFEF),
      appBar: AppBar(
        backgroundColor: Color(0xffEFEFEF),
        title: Text(
          'Avalon',
          style:
              TextStyle(color: Color(0xff508A7B), fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          )
        ],
        elevation: 0.0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      drawer: Drawer(),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          buildBottomNav(Icons.home,1),
          buildBottomNav(Icons.shopping_basket,2),
          buildBottomNav(Icons.person,3),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: _height * 0.02),
            TabSelect(),
            SizedBox(height: _height * 0.05),
            Container(
              padding: EdgeInsets.only(left: 8),
              height: _height * 0.45,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listImage.length,
                itemBuilder: (context, index) {
                  return ItemProduct(
                    image: _listImage[index],
                    name: _listName[index],
                    leaf: _listLeaf[index],
                  );
                },
              ),
            ),
            SizedBox(height: _height * 0.05),
            SeeAll(),
            SizedBox(height: _height * 0.05),
            Container(
              height: _height * 0.18,
              padding: EdgeInsets.only(left: 8),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: _listImageFeat.length,
                itemBuilder: (context, index) {
                  return FeaturedProducts(
                    image: _listImageFeat[index],
                    name: _listNameFeat[index],
                    dec: _listDecFeat[index],
                  );
                },
              ),
            ),
            SizedBox(height: _height * 0.01),
          ],
        ),
      ),
    );
  }

  Widget buildBottomNav(IconData icon, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: Container(
        height: 55,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(
              icon,
              color: index == selectedIndex ? Color(0xff508A7B) : Color(0xffA5C1B9),
              size: 30,
            ),
          ],
        ),
      ),
    );
  }
}
