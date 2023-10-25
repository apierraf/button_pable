import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: SizedBox(
            height: 60,
            width: 250,
            //child stack with two widgets inside it (MyButtonFill and MyBorderContainer)
            child: Stack(
              children: [
                Positioned.fill(
                  child: MyButtonFill(text: 'Rutas'),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: MyBorderContainer(number: 20),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// this a contaniner with a border
class MyBorderContainer extends StatelessWidget {
  final int number;
  const MyBorderContainer({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          width: 3,
        ),
        shape: BoxShape.circle,
        color: Colors.redAccent,
      ),
      child: Center(
        child: Text(
          number.toString(),
          style: const TextStyle(
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }
}

// this is a button with a fill color
class MyButtonFill extends StatelessWidget {
  final String text;
  const MyButtonFill({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      shape: const StadiumBorder(),
      onPressed: () {
        debugPrint('clicked');
      },
      color: Colors.redAccent,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
    );
  }
}
