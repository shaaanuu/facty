import 'package:flutter/material.dart';

import 'apis.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fact = 'facts';
    ValueNotifier<String> valueNotifier = ValueNotifier(fact);

    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: const Text(
          'Random Facts',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ValueListenableBuilder(
                valueListenable: valueNotifier,
                builder: (context, String value, child) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    valueNotifier.value,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  final result = await getFact();
                  valueNotifier.value = result.text.toString();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal[300],
                ),
                child: const Text(
                  'Click Me',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
