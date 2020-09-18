import 'package:flutter/material.dart';

class TabSelect extends StatefulWidget {
  @override
  _TabSelectState createState() => _TabSelectState();
}

class _TabSelectState extends State<TabSelect> {
  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;

    return Center(
      child: Container(
        height: 50,
        width: _width * 0.8,
        decoration: BoxDecoration(
          color: Color(0xffF6F6F6),
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _button(title: 'Hair',),
            _button(title: 'Body', btnColor: Color(0xff508A7B),txtColor: Colors.white),
            _button(title: 'Face'),
          ],
        ),
      ),
    );
  }

  Widget _button(
      {title, txtColor = Colors.black, btnColor = const Color(0xffF6F6F6)}) {
    return SizedBox(
      height: 40,
      child: FlatButton(
        color: btnColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        onPressed: (){},
        child: Text(
          title,
          style: TextStyle(
            color: txtColor,
          ),
        ),
      ),
    );
  }
}
