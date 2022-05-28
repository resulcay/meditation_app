import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';
import 'package:meditation_app/widgets/search_bar.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(children: [
        Container(
          height: size.height * .48,
          decoration: const BoxDecoration(
            color: kBlueColor,
            image: DecorationImage(
                image: AssetImage("assets/images/meditation_bg.png"),
                fit: BoxFit.fitWidth),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: size.height * 0.05,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headline4!
                          .copyWith(fontWeight: FontWeight.w900),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      "3-10 MIN Course",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: size.width * .6,
                      child: const Text(
                          "Live happier and helathier by learning fundamentals of meditation and mindfulness"),
                    ),
                    SizedBox(width: size.width * .5, child: const SearchBar()),
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                        SessionCard(sessionNum: 1, isDone: true, press: () {}),
                        SessionCard(sessionNum: 2, isDone: true, press: () {}),
                        SessionCard(sessionNum: 3, isDone: true, press: () {}),
                        SessionCard(sessionNum: 4, isDone: true, press: () {}),
                        SessionCard(sessionNum: 5, isDone: true, press: () {}),
                        SessionCard(sessionNum: 6, isDone: true, press: () {}),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Meditation",
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      padding: const EdgeInsets.all(10),
                      height: 75,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(13),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, 17),
                                blurRadius: 23,
                                spreadRadius: -13,
                                color: kShadowColor),
                          ]),
                      child: Row(children: [
                        SvgPicture.asset(
                            "assets/icons/Meditation_women_small.svg"),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Basic 02",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const Text(
                                "Start your deepen you practise",
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: SvgPicture.asset("assets/icons/Lock.svg"),
                        ),
                      ]),
                    )
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}

class SessionCard extends StatelessWidget {
  final int sessionNum;
  final bool isDone;
  final void Function() press;
  const SessionCard({
    Key? key,
    required this.sessionNum,
    this.isDone = false,
    required this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraint) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(13),
        child: Container(
          width: constraint.maxWidth / 2 - 10,
          //padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(13),
              boxShadow: const [
                BoxShadow(
                    offset: Offset(0, 17),
                    blurRadius: 23,
                    spreadRadius: -13,
                    color: kShadowColor),
              ]),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: press,
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Row(
                  children: [
                    Container(
                      height: 42,
                      width: 43,
                      decoration: BoxDecoration(
                        color: isDone ? kBlueColor : Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: kBlueColor),
                      ),
                      child: Icon(
                        Icons.play_arrow,
                        color: isDone ? Colors.white : kBlueColor,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Session $sessionNum",
                      style: Theme.of(context).textTheme.subtitle1,
                    )
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
