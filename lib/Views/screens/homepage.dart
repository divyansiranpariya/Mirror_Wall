import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:provider/provider.dart';

import '../../Provider/bottom_provider.dart';
import '../components/bookmark_components.dart';
import '../components/home_component.dart';
import '../components/searchengine_provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  PageController pageviewcontoller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageviewcontoller,
        onPageChanged: (val) {
          Provider.of<BottomProvider>(context, listen: false).bottomindex = val;
        },
        children: [
          Homecomponent(),
          Bookcomponents()
          // ...allcomponents.map((e) => e['widget']),
        ],
      ),
      bottomNavigationBar: Consumer<BottomProvider>(
        builder: (context, bottom, _) {
          return CurvedNavigationBar(
            onTap: (val) {
              bottom.bottomNavigateration(val);
              pageviewcontoller.animateToPage(val,
                  duration: Duration(milliseconds: 200),
                  curve: Curves.bounceInOut);
            },
            backgroundColor: Colors.grey,
            color: Color(0xFF1A1D24),
            animationDuration: Duration(milliseconds: 300),
            items: [
              Icon(
                Icons.home,
                color: Color(0xffC70039),
              ),
              Icon(
                Icons.bookmark,
                color: Color(0xffC70039),
              ),
              GestureDetector(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return Consumer<Searcheneprovider>(
                          builder: (context, search, _) {
                            return Consumer<Searcheneprovider>(
                              builder: (context, search, _) {
                                return AlertDialog(
                                  title: Text("Search Engine"),
                                  actions: [
                                    Row(
                                      children: [
                                        Radio(
                                          onChanged: (val) {
                                            search.Changeengine(val!, context);
                                          },
                                          value: "Google",
                                          groupValue: search.webcho,
                                        ),
                                        Text("Googel")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          onChanged: (val) {
                                            search.Changeengine(val!, context);
                                          },
                                          value: "Yahoo",
                                          groupValue: search.webcho,
                                        ),
                                        Text("Yahoo")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          onChanged: (val) {
                                            search.Changeengine(val!, context);
                                            ;
                                          },
                                          value: "Bing",
                                          groupValue: search.webcho,
                                        ),
                                        Text("Bing")
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Radio(
                                          onChanged: (val) {
                                            search.Changeengine(val!, context);
                                          },
                                          value: "Duck Duck Go",
                                          groupValue: search.webcho,
                                        ),
                                        Text("Duck Duck Go"),
                                      ],
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                        );
                      });
                },
                child: Icon(
                  Icons.screen_search_desktop_rounded,
                  color: Color(0xffC70039),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
