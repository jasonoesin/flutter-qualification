import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_snake_navigationbar/flutter_snake_navigationbar.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:intl/intl.dart';
import 'package:qualif/detail.dart';
import 'package:qualif/home.dart';
import 'package:qualif/login.dart';
// ignore_for_file: prefer_const_constructors

String convertToIdr(dynamic number, int decimalDigit) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: decimalDigit,
  );
  return currencyFormatter.format(number);
}

class MarketPage extends StatefulWidget {
  const MarketPage({super.key});

  static List<Shoe> shoes = [
    Shoe("Nike", "Dunk Low SE Sail Dark", 2500000, "assets/1.jpg"),
    Shoe("Nike", "Jordan 1 Low UNC", 3000000, "assets/2.jpg"),
    Shoe("Adidas", "Yeezy Boost 350 V2", 6500000, "assets/3.jpg"),
    Shoe("New Balance", "White Nightwatch Green", 1000000, "assets/4.jpg"),
    Shoe("Nike", "Dunk Low SE Sail Dark", 2500000, "assets/1.jpg"),
    Shoe("Nike", "Jordan 1 Low UNC", 3000000, "assets/2.jpg"),
    Shoe("Adidas", "Yeezy Boost 350 V2", 6500000, "assets/3.jpg"),
    Shoe("New Balance", "White Nightwatch Green", 1000000, "assets/4.jpg"),
  ];

  @override
  State<MarketPage> createState() => _MarketPageState();
}

class _MarketPageState extends State<MarketPage> {
  int _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Image.asset("assets/logo-white.png", width: 75),
        toolbarHeight: 75,
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
            padding: EdgeInsets.all(16),
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

              if (index == 0) {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return HomePage();
                }));

                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                  builder: (context) {
                    return const HomePage();
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
      body: Container(
        child: Column(children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 250,
                  childAspectRatio: 0.8,
                ),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: MarketPage.shoes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (() => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(curr: MarketPage.shoes[index]);
                          }))
                        }),
                    child: Container(
                      margin: const EdgeInsets.all(10.0),
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                          ),
                        ],
                      ),
                      child: Wrap(
                        direction: Axis.vertical,
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          Image.asset(
                            MarketPage.shoes[index].img,
                            width: 125,
                          ),
                          Text(
                            MarketPage.shoes[index].brand,
                          ),
                          Text(
                            MarketPage.shoes[index].name,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(convertToIdr(MarketPage.shoes[index].price, 2)
                              .toString()),
                        ],
                      ),
                    ),
                  );
                }),
          ),
        ]),
      ),
    );
  }
}

class Shoe {
  String brand;
  String name;
  int price;
  String img;

  Shoe(this.brand, this.name, this.price, this.img);
}
