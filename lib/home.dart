import 'package:flutter/material.dart';

import 'apis.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String fact = 'Ready to blow your mind?';
    ValueNotifier<String> valueNotifier = ValueNotifier(fact);

    return Scaffold(
      backgroundColor: const Color(0xFFD5D8DC),
      appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: const Text(
          'Facty',
          style: TextStyle(
            fontSize: 20,
            color: Color(0xFF2E4053),
            fontWeight: FontWeight.bold,
            letterSpacing: 1.5,
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
                padding: const EdgeInsets.all(10),
                child: Text(
                  valueNotifier.value,
                  textAlign: TextAlign.center,
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
                'Hit me with a fact!',
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
