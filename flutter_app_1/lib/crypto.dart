import 'package:flutter/material.dart';

class Crypto extends StatelessWidget {
  const Crypto({super.key});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Card(
        elevation: 0,
        shape: RoundedRectangleBorder(
          side: BorderSide(
            color: Theme.of(context).colorScheme.outline,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        child: const SizedBox(
          width: 300,
          height: 500,
          // \n == newline
          // \u2022 == bullet
          child: Center(
              child: Image(image: AssetImage('images/crypto.png'))),
        ),
      ),
    );
  }
}

