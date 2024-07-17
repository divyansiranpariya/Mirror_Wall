import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Provider/bookmark_provider.dart';
import 'Provider/bottom_provider.dart';
import 'Provider/connectivity_provider.dart';
import 'Views/components/searchengine_provider.dart';
import 'Views/screens/bookmark_page.dart';
import 'Views/screens/homepage.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => BottomProvider()),
      ChangeNotifierProvider(create: (context) => Deleteprovider()),
      ChangeNotifierProvider(create: (context) => Searcheneprovider()),
      ChangeNotifierProvider(create: (context) => CheckedProvider())
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Homepage(),
        'Bookmark': (context) => Bookmark(),
      },
    ),
  ));
}
