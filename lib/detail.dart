import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:qualif/market.dart';
// ignore_for_file: prefer_const_constructors

class DetailPage extends StatefulWidget {
  final Shoe curr;
  const DetailPage({super.key, required this.curr});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class Comment {
  String comment;
  String user;

  Comment(this.comment, this.user);
}

class _DetailPageState extends State<DetailPage> {
  TextEditingController commentController = TextEditingController();

  var comments = [
    Comment("test saje", "Droid"),
    Comment("test dua brody", "Jason"),
  ];

  void _addComment() {
    setState(() {
      comments.add(Comment(commentController.text, "User0"));
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: AppBar(
            bottom: TabBar(
              tabs: const <Tab>[
                Tab(text: 'Shoe Detail'),
                Tab(text: 'Comments'),
              ],
            ),
            backgroundColor: Colors.black,
            title: Image.asset("assets/logo-white.png", width: 75),
            toolbarHeight: 75,
          ),
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: Wrap(
                    direction: Axis.vertical,
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      Image.asset(
                        widget.curr.img,
                        width: 300,
                      ),
                      Text(
                        widget.curr.brand,
                      ),
                      Text(
                        widget.curr.name,
                        softWrap: false,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(convertToIdr(widget.curr.price, 2).toString()),
                      SizedBox(
                        width: 250,
                        child: TextField(
                          controller: commentController,
                          decoration:
                              InputDecoration(hintText: "Input Comment"),
                        ),
                      ),
                      ElevatedButton(
                          onPressed: (() {
                            _addComment();
                          }),
                          child: Text("Comment"))
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                color: Colors.white,
                constraints: const BoxConstraints.expand(),
                child: Column(
                  children: [
                    Text("Comments"),
                    Container(
                      child: Expanded(
                          child: ListView.builder(
                              itemCount: comments.length,
                              itemBuilder: ((context, index) {
                                return Padding(
                                    padding: EdgeInsets.all(8),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(comments[index].comment),
                                        Text("- " + comments[index].user)
                                      ],
                                    ));
                              }))),
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
