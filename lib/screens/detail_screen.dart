import 'package:cosmetic_app/widgets/btn_bag.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  @override
  _DetailScreenState createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(
        milliseconds: 750,
      ),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeIn,
    );
    _controller.addListener(() {
      setState(() {});
    });
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
    double _height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Color(0xffD59066),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.favorite,
            ),
            onPressed: () {},
          ),
        ],
        iconTheme: IconThemeData(color: Colors.white),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [
            Color(0xff508A7B),
            Color(0xffD59066),
          ], begin: Alignment.bottomCenter, end: Alignment.center),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Stack(
                      children: [
                        Image.asset(
                          'assets/images/Lavender_bg.png',
                          width: _width * 0.7,
                        ),
                        Image.asset(
                          'assets/images/Lavender15.png',
                          width: _width * 0.8,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: _height * 0.05),
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, snapshot) {
                        return Transform.translate(
                          offset: Offset(-100 * (1 - _animation.value), 0),
                          child: Text(
                            'Bath & Shower Gel',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        );
                      }),
                  SizedBox(height: _height * 0.02),
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, snapshot) {
                        return Transform.translate(
                          offset: Offset(-50 * (1 - _animation.value), 0),
                          child: Text(
                            'Nourishing Lavender',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        );
                      }),
                  SizedBox(height: _height * 0.02),
                  AnimatedBuilder(
                      animation: _animation,
                      builder: (context, snapshot) {
                        return Transform.translate(
                          offset: Offset(0, _height * (1 - _animation.value)),
                          child: Text(
                            'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s. , when an unknown printer took a galley of type and scrambled it to make a type specimen book...',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              height: 1.5,
                            ),
                          ),
                        );
                      }),
                ],
              ),
              BtnBag(),
            ],
          ),
        ),
      ),
    );
  }
}
