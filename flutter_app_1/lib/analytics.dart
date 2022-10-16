import 'package:flutter/material.dart';

class OutlinedCardTop extends StatelessWidget {
  const OutlinedCardTop({super.key});
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
          height: 100,
          // \n == newline
          // \u2022 == bullet
          child: Center(
              child: Text('Risk:\n\u2022 23% 10Y - Heart Disease\n\u2022 Blood Pressure Percentile: 71% \n\u2022 Blood Glucose Percentile: 43%')),
        ),
      ),
    );
  }
}

class OutlinedCardBottom extends StatelessWidget {
  const OutlinedCardBottom({super.key});

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
          child: Column(children: <Widget>[
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('Blood Pressure')),
                ),
                const Spacer(),
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(image: AssetImage('images/status/9.jpg')),
                ),
                const Spacer(),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('LDL')),
                ),
                const Spacer(),
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(image: AssetImage('images/status/7.jpg')),
                ),
                const Spacer(),
              ],
            ),
            Row(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Center(child: Text('HDL')),
                ),
                const Spacer(),
                const Spacer(),
                const SizedBox(
                  width: 100,
                  height: 100,
                  child: Image(image: AssetImage('images/status/12.jpg')),
                ),
                const Spacer(),
              ],
            ),
          ])),
    );
  }
}
