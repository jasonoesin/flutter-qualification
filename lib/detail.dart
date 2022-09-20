import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:qualif/market.dart';
import 'package:qualif/theme.dart';
// ignore_for_file: prefer_const_constructors

// ignore: must_be_immutable
class DetailPage extends StatefulWidget {
  final Shoe curr;
  String username;
  DetailPage({super.key, required this.curr, required this.username});

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

  void _addComment() {
    setState(() {
      widget.curr.comments
          .add(Comment(commentController.text, widget.username));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
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
              backgroundColor: themeProvider.widgetBgColor(),
              title: Image.asset("assets/logo-white.png", width: 75),
              toolbarHeight: 75,
              actions: [
                IconButton(
                  onPressed: () {
                    Provider.of<ThemeProvider>(context, listen: false)
                        .swapTheme();
                  },
                  icon: Icon(themeProvider.appBarIcon()),
                )
              ],
            ),
            body: TabBarView(
              children: [
                SingleChildScrollView(
                  child: Container(
                    padding: const EdgeInsets.all(20.0),
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
                          style: TextStyle(color: themeProvider.widgetColor()),
                        ),
                        Text(
                          widget.curr.name,
                          softWrap: false,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: themeProvider.widgetColor()),
                        ),
                        Text(convertToIdr(widget.curr.price, 2).toString(),
                            style:
                                TextStyle(color: themeProvider.widgetColor())),
                        SizedBox(
                          width: 250,
                          child: TextField(
                            style:
                                TextStyle(color: themeProvider.widgetColor()),
                            controller: commentController,
                            decoration: InputDecoration(
                              enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(
                                      color: themeProvider.widgetColor())),
                              hintStyle:
                                  TextStyle(color: themeProvider.widgetColor()),
                              hintText: "Input Comment",
                            ),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: (() {
                              if (commentController.text.isEmpty) {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                        content: Text(
                                            'Your comment cannot be empty !')));
                                return;
                              }

                              _addComment();
                            }),
                            child: Text("Comment"))
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  constraints: const BoxConstraints.expand(),
                  child: Column(
                    children: [
                      Text("Comments",
                          style: TextStyle(color: themeProvider.widgetColor())),
                      Container(
                        child: Expanded(
                            child: ListView.builder(
                                itemCount: widget.curr.comments.length,
                                itemBuilder: ((context, index) {
                                  return Padding(
                                      padding: EdgeInsets.all(8),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                              widget
                                                  .curr.comments[index].comment,
                                              style: TextStyle(
                                                  color: themeProvider
                                                      .widgetColor())),
                                          Text(
                                              "- " +
                                                  widget.curr.comments[index]
                                                      .user,
                                              style: TextStyle(
                                                  color: themeProvider
                                                      .widgetColor()))
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
    });
  }
}
