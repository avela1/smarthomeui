import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class SmartDeviceBox extends StatelessWidget {
  final String name;
  final String path;
  final bool status;
  void Function(bool)? onChanged;

  SmartDeviceBox({
    super.key,
    required this.name,
    required this.path,
    required this.status,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Container(
        decoration: BoxDecoration(
          color: status ? Colors.grey[900] : Colors.grey[200],
          borderRadius: BorderRadius.circular(24),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image(
                image: AssetImage(path),
                color: status ? Colors.white : Colors.black,
                height: 65,
              ),
              Row(
                children: [
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 25),
                    child: Text(
                      name,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: status ? Colors.white : Colors.black),
                    ),
                  )),
                  Transform.rotate(
                    angle: pi / 2,
                    child: CupertinoSwitch(
                      value: status,
                      onChanged: onChanged,
                    ),
                  ),
                ],
              )
            ]),
      ),
    );
  }
}
