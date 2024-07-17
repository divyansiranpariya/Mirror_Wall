## Mirror Wall

MirrorWall is a Flutter-based application that provides a seamless web browsing experience using a WebView. It features a curved bottom navigation bar for easy navigation between home and bookmark pages, a custom search engine selection, and comprehensive bookmark management.

* For Mobile:

## Folder Structure
'''
lib
├── main.dart
├── Provider
│   ├── bottom_provider.dart
│   └── searchengine_provider.dart
└── Screens
└── homepage.dart
└── components
├── bookmark_components.dart
├── home_component.dart
└── searchengine_provider.dart
'''

## State Management

This app uses the Provider package for state management.

- **BottomProvider**: Manages the state of the bottom navigation bar.
- **earchengineProvider**: Manages the state of the search engine selection in the dialog.

## Features
- **Curved Navigation Bar**: Smooth navigation between pages.
- **Custom Web Browser**: In-app browser with forward, back, reload, and bookmark functionalities.
- **Search Engine Selector**: Select from multiple search engines (Google, Yahoo, Bing, DuckDuckGo).
- **Pull to Refresh**: Pull down to refresh the current webpage.
- **Connectivity Check**: Check and display internet connectivity status.
- **Bookmark Management**: Save and delete bookmarks.

## Dependencies

* flutter
* flutter_inappwebview
* provider
* curved_navigation_bar


