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
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
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
              SizedBox(
                height: 20,
              ),
              CardExample(
                address: 'Marianao',
                phone: '53192002',
                distance: '12km',
              ),
            ],
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
      child: Center(
        child: Text(
          text,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}

class HeaderCard extends StatelessWidget {
  final String name;
  const HeaderCard({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      padding: const EdgeInsets.only(
        bottom: 3,
        top: 3,
        left: 15,
        right: 5,
      ),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(60),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            name,
            style: const TextStyle(fontSize: 20, color: Colors.white),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.red,
              border: Border.all(
                color: Colors.white,
                width: 3,
              ),
              shape: BoxShape.circle,
            ),
            child: const Center(
              child: Icon(
                Icons.call,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CardExample extends StatelessWidget {
  final String address;
  final String phone;
  final String distance;
  const CardExample(
      {super.key,
      required this.address,
      required this.phone,
      required this.distance});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
          horizontal: MediaQuery.sizeOf(context).width * 0.1),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          topRight: Radius.circular(40),
          bottomLeft: Radius.circular(10),
          bottomRight: Radius.circular(10),
        ),
      ),
      elevation: 3,
      child: Container(
        padding: const EdgeInsets.only(bottom: 10),
        width: MediaQuery.sizeOf(context).width,
        child: Column(
          children: [
            const HeaderCard(
              name: 'Pacho',
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.sizeOf(context).width * 0.05,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(address),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.phone_android_outlined,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(phone),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.alt_route_sharp,
                        color: Colors.red,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(distance),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            MaterialButton(
              minWidth: MediaQuery.sizeOf(context).width * 0.7,
              onPressed: () {},
              color: Colors.grey.shade200,
              shape: const StadiumBorder(),
              child: const Text('Boton'),
            ),
          ],
        ),
      ),
    );
  }
}
