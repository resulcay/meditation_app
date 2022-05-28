import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meditation_app/constants.dart';
import 'package:meditation_app/screens/details_screens.dart';
import 'package:meditation_app/widgets/bottom_nav_bar.dart';
import 'package:meditation_app/widgets/category_card.dart';
import 'package:meditation_app/widgets/search_bar.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Meditation App',
      theme: ThemeData(
        fontFamily: "Cairo",
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme:
            Theme.of(context).textTheme.apply(decorationColor: kTextColor),
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: const BottomNavBar(),
      body: Stack(children: [
        Container(
          height: size.height * .45,
          decoration: const BoxDecoration(
            color: Color(0xFFF5CEB8),
            image: DecorationImage(
              alignment: Alignment.centerLeft,
              image: AssetImage('assets/images/undraw_pilates_gpdb.png'),
            ),
          ),
        ),
        SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  alignment: Alignment.center,
                  height: 52,
                  width: 52,
                  decoration: const BoxDecoration(
                    color: Color(0xFFF2B2A1),
                    shape: BoxShape.circle,
                  ),
                  child: SvgPicture.asset(
                    "assets/icons/menu.svg",
                  ),
                ),
              ),
              Text(
                "Good Morning \nJenny",
                style: Theme.of(context)
                    .textTheme
                    .headline4!
                    .copyWith(fontWeight: FontWeight.w900),
              ),
              const SearchBar(),
              Expanded(
                child: GridView.count(
                  childAspectRatio: .85,
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  children: [
                    CategoryCard(
                      title: "Diet Recommendation",
                      svgSrc: "assets/icons/Hamburger.svg",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Kegal Exercices",
                      svgSrc: "assets/icons/Excrecises.svg",
                      press: () {},
                    ),
                    CategoryCard(
                      title: "Meditation",
                      svgSrc: "assets/icons/Meditation.svg",
                      press: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return const DetailsScreen();
                        }));
                      },
                    ),
                    CategoryCard(
                      title: "Yoga",
                      svgSrc: "assets/icons/yoga.svg",
                      press: () {},
                    ),
                  ],
                ),
              )
            ]),
          ),
        )
      ]),
    );
  }
}
