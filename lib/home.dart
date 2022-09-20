import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:provider/provider.dart';
import 'package:qualif/login.dart';
import 'package:qualif/market.dart';
import 'package:qualif/theme.dart';

// ignore: must_be_immutable
class HomePage extends StatefulWidget {
  String username;
  HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  var images = [
    "assets/carousel0.jpg",
    "assets/carousel1.jpg",
    "assets/carousel2.jpg",
    "assets/carousel3.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: themeProvider.widgetBgColor(),
          title: Image.asset("assets/logo-white.png", width: 75),
          toolbarHeight: 75,
          actions: [
            IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false).swapTheme();
              },
              icon: Icon(themeProvider.appBarIcon()),
            )
          ],
        ),
        bottomNavigationBar: Container(
          color: Colors.grey.shade300,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
            child: GNav(
              backgroundColor: Colors.grey.shade300,
              activeColor: Colors.white,
              color: Colors.black,
              tabBackgroundColor: Colors.grey.shade600,
              padding: const EdgeInsets.all(16),
              gap: 8,
              tabs: const [
                GButton(
                  icon: Icons.home,
                  text: 'Home',
                ),
                GButton(
                  icon: Icons.shop,
                  text: 'Market',
                ),
                GButton(
                  icon: Icons.logout,
                  text: 'Sign Out',
                )
              ],
              selectedIndex: _selectedIndex,
              onTabChange: (index) {
                setState(() {
                  _selectedIndex = index;
                });

                if (index == 1) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return MarketPage(
                        username: widget.username,
                      );
                    },
                  ));

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return MarketPage(
                        username: widget.username,
                      );
                    },
                  ), (route) => false);
                } else if (index == 2) {
                  Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ));

                  Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                    builder: (context) {
                      return const LoginPage();
                    },
                  ), (route) => false);
                }
              },
            ),
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(10),
          child: Wrap(
            spacing: 10,
            runSpacing: 10,
            children: [
              Text(
                "Welcome to KickAvenue, ${widget.username} !",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: themeProvider.widgetColor()),
              ),
              CarouselSlider(
                items: images.map((e) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
                          width: MediaQuery.of(context).size.width,
                          margin: const EdgeInsets.symmetric(horizontal: 5.0),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade800,
                            borderRadius: const BorderRadius.all(
                              Radius.circular(10.0),
                            ),
                          ),
                          child: Image.asset(
                            e,
                          ));
                    },
                  );
                }).toList(),
                options: CarouselOptions(
                    autoPlay: true,
                    autoPlayAnimationDuration: const Duration(seconds: 3),
                    height: 330),
              ),
              Text(
                "About Us",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: themeProvider.widgetColor()),
              ),
              Text(
                "Kick Avenue is the first authentic collectible online marketplace in Indonesia that was established in 2017. Kick Avenue strives to create a safe and efficient marketplace for buyers and sellers to make transactions. Kick Avenue provides a valid authentication process to ensure the item is 100% authentic as expected by the consumer and an escrow account to guarantee payment will only be received by the seller after both parties reach an agreed price. In addition, Kick Avenue also provides a transparent offer and ask price feature to maintain product price ranges according to market prices.",
                textAlign: TextAlign.justify,
                style: TextStyle(
                    fontSize: 16,
                    wordSpacing: 5,
                    height: 1.5,
                    color: themeProvider.widgetColor()),
              ),
            ],
          ),
        ),
      );
    });
  }
}
