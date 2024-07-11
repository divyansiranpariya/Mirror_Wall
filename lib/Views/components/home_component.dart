import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:mirror_wall/Views/components/searchengine_provider.dart';
import 'package:provider/provider.dart';

import '../../utils/globaldata.dart';

class Homecomponent extends StatefulWidget {
  const Homecomponent({super.key});

  @override
  State<Homecomponent> createState() => _HomecomponentState();
}

class _HomecomponentState extends State<Homecomponent> {
  InAppWebViewController? inAppWebViewController;
  PullToRefreshController? pullToRefreshController;

  late var url;
  var urlcontroller = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    pullToRefreshController = PullToRefreshController(
        settings: PullToRefreshSettings(color: Colors.teal),
        onRefresh: () async {
          if (Platform.isAndroid) {
            await inAppWebViewController!.reload();
          }
          if (Platform.isIOS) {
            await inAppWebViewController!.loadUrl(
                urlRequest:
                    URLRequest(url: await inAppWebViewController!.getUrl()));
          }
        });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF1A1D24),
          title: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "My Browser",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
          actions: [
            IconButton(
                iconSize: 20,
                onPressed: () async {
                  if (inAppWebViewController != null) {
                    if (await inAppWebViewController!.canGoBack()) {
                      inAppWebViewController!.goBack();
                    }
                  }
                },
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                )),
            IconButton(
                iconSize: 20,
                onPressed: () async {
                  if (inAppWebViewController != null) {
                    if (await inAppWebViewController!.canGoForward()) {
                      inAppWebViewController!.goForward();
                    }
                  }
                },
                icon: Icon(Icons.arrow_forward_ios, color: Colors.white)),
            IconButton(
                iconSize: 20,
                onPressed: () {
                  if (inAppWebViewController != null) {
                    inAppWebViewController!.reload();
                  }
                },
                icon: Icon(Icons.refresh_sharp, color: Colors.white)),
            IconButton(
                iconSize: 20,
                onPressed: () async {
                  WebUri? bk = await inAppWebViewController!.getUrl();
                  Book.urls.add(bk.toString());
                  Book.convertData();
                  print(Book.urldata.length.toString());
                },
                icon: Icon(Icons.bookmark_add_outlined, color: Colors.white)),
          ],
        ),
        body: Center(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              InAppWebView(
                pullToRefreshController: pullToRefreshController,
                initialUrlRequest: URLRequest(
                  url: WebUri(
                      "${Provider.of<Searcheneprovider>(context, listen: false).strMainURL}"),
                ),
                onWebViewCreated: (controller) {
                  inAppWebViewController = controller;
                },
                onLoadStart: (controller, url) {
                  inAppWebViewController = controller;
                },
                onLoadStop: (controller, url) async {
                  await pullToRefreshController!.endRefreshing();
                },
              ),
              Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(left: 25, right: 25),
                    height: 70,
                    width: 305,
                    decoration: BoxDecoration(
                        color: Colors.white60,
                        border: Border.all(color: Colors.black)),
                    child: TextField(
                      onSubmitted: (query) {
                        String searchurl;
                        if (Uri.tryParse(query)?.hasAbsolutePath ?? false) {
                          searchurl = query;
                        } else {
                          searchurl = "https://www.google.com/search?q=$query";
                        }
                        inAppWebViewController?.loadUrl(
                          urlRequest: URLRequest(url: WebUri(searchurl)),
                        );
                      },
                      controller: urlcontroller,
                      decoration: InputDecoration(
                          hintText: "Search or type web address",
                          prefixIcon: Icon(Icons.search_sharp)),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}
