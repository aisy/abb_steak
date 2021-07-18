# Abuba steak app

This is a research project to create application to create Web mobile to handle "order" in "Abuba steak restaurant" with Flutter. because this is a research project i not planning make this application bigger and complex like other "order" apps.

> disclaimer : All product and company names are trademarks or registered of their respective holders. I use of them does not imply any affiliation with or endorsement by them. 



# Why i created this?

Normally before a pandemic, we just spend 5-8 minutes choosing the menu for your information that time also doesn't include calling the waiter, confirm the menu is available, and ask for recommendations menu. Because we can't mark the menu after choosing, we must remember about the size, type, sauce, potato in the steak we order. Glad if we got waiter easily and fast response when we called them. 

What if the waiter serves the other customer? or what if the restaurant is busy and has many customers? You must wait until you served and keep your order in your memory right? if you have strong memory it's doesn't matter, but not everyone has a strong memory.

That does not include confirm the menu is available you can imagine how much we spend the time to order the menu right?

## The solution

From the story, I can conclude that the solution is 
to create "a web mobile-based application" to manage the order with these features :
- Show the List of menus, with the details, options, and price (some options will update the price).
- Order cart, to save the chosen menu and calculate the total price
- Searching menu to find specific menu


# The Features

## List of Menu & Detail Menu

![List Menu & Detail](https://i.ibb.co/WxQ4cPb/List-Detail-Menu.gif)


## Cart Order

![Cart Order](https://i.ibb.co/xhyKRwH/Order-Cart.gif)

## Search Menu

![Search Menu](https://i.ibb.co/9284qxH/Search-Menu.gif)



# Getting Started

This project is a starting point for a Flutter application.

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Clone Project & Fork Project

### Clone or Fork Project

run this command below to clone project :

```bash
git clone project https://github.com/aisy/abb_steak.git
```

### Fork Project 

Forking to contribute, make sure you create PR or issue

after clone or fork,  run this command to install package in this project :

```bash
flutter pub get
```


## Structure Directory

```
.
├── android
├── assets
├── ios
├── lib
│   ├── breakpoint_const.dart
│   ├── generated_plugin_registrant.dart
│   ├── helpers
│   ├── main.dart
│   ├── models
│   ├── router.dart
│   ├── router_const.dart
│   ├── screens
│   │   ├── CategoryScreen.dart
│   │   ├── MainScreen.dart
│   │   ├── PlaygroundScreen.dart
│   │   ├── SearchScreen.dart
│   │   └── playgorund
│   │       ├── AddObjectInProvider.dart
│   │       └── IncrementWithProvider.dart
│   └── widgets
│       ├── common
│       └── modal-bottom
├── test
├── web
├── .gitignore
├── .metadata
├── .packages
├── .abuba_steak_app.iml
├── LICENSE
├── pubspec.lock
├── pubspec.yaml
└── README.md
```

Important Directories :
- `android` : android system (please create PR if you want edit/change something in this directory).
- `assets` : assets collection like images, data etc.
- `ios` : ios system (please create PR if you want edit/change something in this directory).
- `lib` : the main project was here, this also including the directory :
  - `helper` : directory to hold function to helper code or project 
  - `models` : directory to hold the collection data, actually this is was a 'Provider' but i prefer using a model to manage data Provider
  - `screens` : directory to hold all screen in this app
  - `widgets` : directory to hold all Widget in this app, also have a type of Widget :
    - `common` : directory to hold Widgets that are frequently used on multiple pages 
    - `modal-bottom` : directory to hold Widgets contain modal-bottom
- `web` : directory for managing web Flutter

Important files : 
- `lib/main.dart` : main app
- `lib/router_const.dart` : const var to create route with string
- `lib/router.dart` : list route in this app
  
- `.gitignore` : list folder, files etc not push to git
- `pubspec.yaml` : It is the project's configuration file that will use a lot during working with the Flutter project.
- `README.md` : the documentation, (please create PR if you want edit in this file).

# Running Project

Just a reminder, this project is web-mobile based, yes you can run this project in Android too, but better you running in the browser (it is recommended to use Chrome or a browser that uses Chromium).

### Running project with command

```
Flutter run
```

after running the command, Flutter will check the device that is already running, please choose you're browser.

### Running project from vscode

When the project is open with vscode, please press F5 to start debugging, vscode will by default use the device in the first list of devices (in my case it will be debugged with chrome) if you want to change browser or device, please check the status bar (bottom right) and select device/browser.



