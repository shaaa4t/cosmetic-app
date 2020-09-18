import 'package:cosmetic_app/screens/detail_screen.dart';
import 'package:flutter/material.dart';

class ItemProduct extends StatefulWidget {
  final String image;
  final String leaf;
  final String name;

  ItemProduct({
    @required this.image,
    @required this.leaf,
    @required this.name,
  });

  @override
  _ItemProductState createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> with TickerProviderStateMixin {
  AnimationController _controllerLeaf;
  Animation<double> _animationLeaf;

  @override
  void initState() {
    _controllerLeaf = AnimationController(vsync: this,duration: Duration(milliseconds: 500),);
    _animationLeaf = CurvedAnimation(parent: _controllerLeaf,curve: Curves.easeIn,);
    _controllerLeaf.addListener(() {setState(() {});});
    _controllerLeaf.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controllerLeaf.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    double _height = MediaQuery.of(context).size.height;

    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(),
          ),
        );
      },
      child: Container(
        height: _height * 0.45,
        width: _width * 0.6,
        margin: EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            stops: [0.5, 1],
            colors: [
              Color(0xffFDFDFD),
              Color(0xffEFEFEF),
            ],
          ),
        ),
        child: Stack(
          children: [
            Positioned(
              top: _height * 0.18,
              left: _width * 0.19,
              child: AnimatedBuilder(
                animation: _animationLeaf,
                builder: (context, snapshot) {
                  return Transform.translate(
                    offset: Offset(-100*(1-_animationLeaf.value),0),
                    child: Image.asset(
                      widget.leaf,
                      width: 50,
                    ),
                  );
                }
              ),
            ),
            Positioned(
              left: 4,
              top: 4,
              child: Image.asset(
                widget.image,
                width: _width * 0.3,
              ),
            ),
            Positioned(
              top: _height * 0.29,
              left: 24,
              child: Text(
                widget.name,
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
            Positioned(
              top: _height * 0.32,
              left: 24,
              child: Text(
                'Eczema Relief with\nColloidal Oatmeal',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Positioned(
              top: _height * 0.39,
              left: 24,
              child: Text(
                '₹1,999',
                style: TextStyle(
                  color: Color(0xffD59066),
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
