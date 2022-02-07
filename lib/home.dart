// ignore_for_file: empty_catches

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:share_plus/share_plus.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Position? position;

  @override
  void initState() {
    super.initState();
    findPosition();
  }

  Future<void> findPosition() async {
    try {
      var result = await Geolocator.getCurrentPosition();
      setState(() {
        position = result;
      });
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: position == null
          ? const Center(child: CircularProgressIndicator())
          : Center(
              child: Column(
                children: [
                  Text(
                      'lat ==> ${position!.latitude} \n lng ==> ${position!.longitude}'),
                  ElevatedButton(
                      onPressed: () async {
                        await Share.share('Hello Master Ung');
                      },
                      child: const Text('Test Share'))
                ],
              ),
            ),
    );
  }
}
