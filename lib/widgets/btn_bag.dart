import 'package:flutter/material.dart';

class BtnBag extends StatefulWidget {
  @override
  _BtnBagState createState() => _BtnBagState();
}

class _BtnBagState extends State<BtnBag> with TickerProviderStateMixin{

  AnimationController _controller;
  Animation<double> _animation;
  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(seconds: 1));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.ease);
    _controller.addListener(() {setState(() {
    });});
    _controller.forward();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Align(
      alignment: Alignment.bottomCenter,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, snapshot) {
          return Transform.translate(
            offset: Offset(0,200*(1-_animation.value)),
            child: SizedBox(
              height: 60,
              width: _width * 0.8,
              child: FlatButton(
                shape:
                    RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Colors.white,
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'ADD TO BAG',
                      style: TextStyle(
                        color: Color(0xff508A7B),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Icon(
                      Icons.shopping_basket,
                      color: Color(0xff508A7B),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}
