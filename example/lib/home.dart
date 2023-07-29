import 'package:countrycodes_field/countrycodes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Country Codes'),
      ),
      body: Center(
        child: CountryField(
          onSelect: (c) {
            if (kDebugMode) {
              print('Selected country: $c');
            }
          },
        ),
      ),
    );
  }
}
