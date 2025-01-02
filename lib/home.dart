import 'package:flutter/material.dart';

import 'apis.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fact = 'facts';
    ValueNotifier<String> valueNotifier = ValueNotifier(fact);

    return Scaffold(
      backgroundColor: Color(0xFFD5D8DC),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Facty',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF2E4053),
          ),
        ),
      ),
      body: Center(
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
                    color: Color(0xFF2E4053),
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
                backgroundColor: const Color(0xFFAAB7B8),
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
    );
  }
}
