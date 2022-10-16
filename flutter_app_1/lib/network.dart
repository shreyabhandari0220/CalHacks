import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_app_1/main.dart';

/*
  Carousel Slider
*/
class DemoItem extends StatelessWidget {
  final String title;
  final String route;
  const DemoItem(this.title, this.route, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      onTap: () {
        Navigator.pushNamed(context, route);
      },
    );
  }
}

final List<String> imgList = [
  "images/healthy_food.jpg",
  "images/meditation.jpeg",
  "images/running.jpg",
  "images/swimming.jpg",
  "images/talking_to_friends.jpg",
  "images/yoga.jpg",
];

final List<String> descriptions = [
  "Eat healthy food",
  "Meditate",
  "Go for a run",
  "Go for a swim",
  "Talk to friends",
  "Do yoga",
];

final List<Widget> imageSliders = imgList
    .map((item) => Container(
          margin: const EdgeInsets.all(5.0),
          child: ClipRRect(
              borderRadius: const BorderRadius.all(Radius.circular(5.0)),
              child: Stack(
                children: <Widget>[
                  Image.asset(item, fit: BoxFit.cover, width: 1000.0),
                  Positioned(
                    bottom: 0.0,
                    left: 0.0,
                    right: 0.0,
                    child: Container(
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color.fromARGB(200, 0, 0, 0),
                            Color.fromARGB(0, 0, 0, 0)
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter,
                        ),
                      ),
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: Text(
                        descriptions[imgList.indexOf(item)].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ))
    .toList();

class CarouselWithIndicatorDemo extends StatefulWidget {
  var themeMode;

  CarouselWithIndicatorDemo({super.key, this.themeMode});

  @override
  State<StatefulWidget> createState() {
    return _CarouselWithIndicatorState();
  }
}

class _CarouselWithIndicatorState extends State<CarouselWithIndicatorDemo> {
  final CarouselController _controller = CarouselController();

  @override
  Widget build(BuildContext context) {
    //dictionary map of acronym to full name
    const networkUpdates = [
      "Nancy had 3 healthy meals today",
      "Ivy beat their goal of 100 steps",
      "Yi beat Barbara Garcia last week",
    ];

    // horizontal line
    var horizontalLine = Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
      height: 2.0,
      width: 500.0,
      color: themeMode.value == 0 ? Colors.white : Colors.black,
    );

    Container getUpdate(int i) => Container(
      margin: const EdgeInsets.only(top: 10.0, bottom: 10.0),
      child: Text(
        networkUpdates[i],
        style: TextStyle(
          color: themeMode.value == 0 ? Colors.white : Colors.black,
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );

    return Scaffold(
      body: Column(children: [
        Expanded(
          child: CarouselSlider(
            items: imageSliders,
            carouselController: _controller,
            options: CarouselOptions(
                autoPlay: false,
                enlargeCenterPage: true,
                aspectRatio: 2.0,
                onPageChanged: (index, reason) {
                  setState(() {});
                }),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: imgList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => _controller.animateToPage(entry.key),
              child: Container(
                width: 12.0,
                height: 12.0,
                margin: const EdgeInsets.symmetric(
                    vertical: 100.0, horizontal: 4.0),
              ),
            );
          }).toList(),
        ),
        horizontalLine,
        getUpdate(0),
        horizontalLine,
        getUpdate(1),
        horizontalLine,
        getUpdate(2),
        horizontalLine,
        const SizedBox(
          height: 20,
          child: Text("Scroll down to see more updates"),
        ),
      ]),
    );
  }
}
