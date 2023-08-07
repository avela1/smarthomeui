import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import './../utils/smart_device_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartDevices = [
    ['Smart Light', 'images/icons/light-bulb.png', true],
    ['Smart AC', 'images/icons/air-conditioner.png', false],
    ['Smart TV', 'images/icons/smart-tv.png', false],
    ['Smart Fan', 'images/icons/fan.png', false],
  ];
  void changeStatus(bool value, int index) {
    setState(() {
      mySmartDevices[index][2] = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image(
                      image: const AssetImage('images/icons/menu.png'),
                      height: horizontalPadding,
                      color: Colors.grey[800],
                    ),
                    Icon(
                      Icons.person,
                      size: horizontalPadding,
                      color: Colors.grey[800],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: horizontalPadding, vertical: verticalPadding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Home,',
                      style: TextStyle(color: Colors.grey[700], fontSize: 16),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'ABEL BIRHANE',
                      style: GoogleFonts.akayaTelivigala(
                          fontSize: 40, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey[500],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: const Text(
                  'SMART DEVICES',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
              Expanded(
                child: GridView.builder(
                    padding: const EdgeInsets.all(25),
                    itemCount: mySmartDevices.length,
                    physics: const NeverScrollableScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                    ),
                    itemBuilder: (context, index) {
                      return SmartDeviceBox(
                        name: mySmartDevices[index][0],
                        path: mySmartDevices[index][1],
                        status: mySmartDevices[index][2],
                        onChanged: (value) => changeStatus(value, index),
                      );
                    }),
              ),
            ],
          ),
        ));
  }
}
