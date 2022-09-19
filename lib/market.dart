import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:intl/intl.dart';
import 'package:qualif/detail.dart';

String convertToIdr(dynamic number, int decimalDigit) {
  NumberFormat currencyFormatter = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: decimalDigit,
  );
  return currencyFormatter.format(number);
}

class MarketPage extends StatelessWidget {
  const MarketPage({super.key});

  static List<Shoe> shoes = [
    Shoe("Nike", "Dunk Low SE Sail Dark Marina Blue", 2500000, "assets/1.jpg"),
    Shoe("Nike", "Jordan 1 Low UNC", 3000000, "assets/2.jpg"),
    Shoe("Adidas", "Yeezy Boost 350 V2 Beluga Reflective", 6500000,
        "assets/3.jpg"),
    Shoe("New Balance", "White Nightwatch Green", 1000000, "assets/4.jpg"),
    Shoe("Nike", "Dunk Low SE Sail Dark Marina Blue", 2500000, "assets/1.jpg"),
    Shoe("Nike", "Jordan 1 Low UNC", 3000000, "assets/2.jpg"),
    Shoe("Adidas", "Yeezy Boost 350 V2 Beluga Reflective", 6500000,
        "assets/3.jpg"),
    Shoe("New Balance", "White Nightwatch Green", 1000000, "assets/4.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          Expanded(
            child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 0.8,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20),
                physics: const AlwaysScrollableScrollPhysics(),
                itemCount: shoes.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: (() => {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                            return DetailPage(curr: shoes[index]);
                          }))
                        }),
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
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
                            shoes[index].img,
                            width: 125,
                          ),
                          Text(
                            shoes[index].brand,
                          ),
                          Text(
                            shoes[index].name,
                            softWrap: false,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Text(convertToIdr(shoes[index].price, 2).toString()),
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
