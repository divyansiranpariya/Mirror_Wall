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


## Screenshorts

![m1](https://github.com/divyansiranpariya/Mirror_Wall/assets/154776848/7f0a148c-0995-4693-85fd-0ca28315c00c)
![m2](https://github.com/divyansiranpariya/Mirror_Wall/assets/154776848/f140a741-0ea9-4e54-8aea-7356380436b2)
![m5](https://github.com/divyansiranpariya/Mirror_Wall/assets/154776848/3755c8b6-82fa-4690-8535-ec9ea605b61b)
![m3](https://github.com/divyansiranpariya/Mirror_Wall/assets/154776848/5377b0c1-b67e-4291-8893-dd68bb6db899)
![m4](https://github.com/divyansiranpariya/Mirror_Wall/assets/154776848/1d7b50b4-e8b2-48e0-b020-ad021cee60d3)
![fm1](https://github.com/divyansiranpariya/Mirror_Wall/assets/154776848/e29bfe6e-ec7d-4bdb-9207-7b926db86f6e)
