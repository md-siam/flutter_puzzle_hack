<img src="screenshots/images/full_width.png" />

# Flutter Puzzle Hack

<img src="screenshots/badges/built-with-love.svg" height="28px"/>&nbsp;&nbsp;
<img src="screenshots/badges/flutter-dart.svg" height="28px" />&nbsp;&nbsp;
<a href="https://choosealicense.com/licenses/mit/" target="_blank"><img src="screenshots/badges/license-MIT.svg" height="28px" /></a>&nbsp;&nbsp;
<img src="screenshots/badges/dart-null_safety-blue.svg" height="28px"/>

<img align="right" src="assets/images/icons/playstore.png" height="190"></img>

<p align="justify">
  This game is for the "Flutter Puzzle Hack" contest, 2022. It is a simple slide puzzle game, where the player has to arrange the squares into sorted order. This game is built using the Flutter framework, which is a cross-platform framework for developing apps for multiple devices.
  Right now, this app has been tested on iOS, Android, and Google Chrome browsers.
</p>
<p align="justify">
  In addition, it is using some other third-party packages from the open-source community. Thanks to those open-source developers for their amazing packages. Those packages are: 
</p>

```yaml
  audioplayers: ^0.20.1          // for playing sound
  clay_containers: ^0.3.2        // for neumorphic design
  day_night_switcher: ^0.2.0+1   // for animated switch
  font_awesome_flutter: ^9.2.0   // for icons
  google_fonts: ^2.3.1           // for fonts
  provider: ^6.0.2               // for app state-management
  responsive_framework: ^0.1.7   // for responsive UI
  responsive_sizer: ^3.0.5+1     // for responsive container
  rive: ^0.8.1                   // for controlling rive animation file
```

## Playing Guide

  <table align="center" style="margin: 0px auto;">
    <tr>
      <td>
        <img  src="screenshots/images/appintro_half.png" width="800" ></img>
      </td>
    </tr>
  </table>

  <p align="justify">
   The above picture is showing the "Puzzle Hack" game running on an android device. It's also presenting all the functionality of the game. Like: 
  </p>

1. Dark/Light mode switch
2. Sample image of a sorted board
3. Total number of 'Moves'
4. 'Reset' button
5. Dropdown menu for 'Mute' & and 'Info' functionality
6. Animated 'Dash'. Click it for the magic!
7. Timer

<p align="Center">
    <a href="https://md-siam.github.io/puzzle_hack/" target="_blank"><img src="screenshots/images/PlayNow.png"/></a>
</p>
## Puzzle Hack Demo

<table align="center" style="margin: 0px auto;">
  <tr>
    <th>Light Mode (iPhone 8 Simulator)</th>
    <th>Dark Mode (iPhone 8 Simulator)</th>
  </tr>
  <tr>
    <td><img align="right" src="screenshots/gifs/lightMode.gif" height="500"></img></td>
    <td><img align="right" src="screenshots/gifs/darkMode.gif" height="500"></img></td>
  </tr>
  </table>
  <br>
<table align="center" style="margin: 0px auto;">
  <tr>
    <th>Google Chrome</th>
  </tr>
  <tr>
    <td><img align="right" src="screenshots/gifs/google_chrome.gif"></img></td>
  </tr>
  </table>

## File Pattern Inside The `'lib'` Folder

```
lib/
├── app/
│   ├── provider/
│   │   ├── appinfo_provider.dart
│   │   ├── sound_provider.dart
│   │   └── theme_provider.dart
│   ├── view/
│   │   └── puzzle_game.dart
│   └── widget/
│       ├── util/
│       │   ├── design/
│       │   │   ├── arrow_clipper.dart
│       │   │   └── neumorphic_button.dart
│       │   ├── dropdown_menu.dart
│       │   ├── grid_container.dart
│       │   ├── move.dart
│       │   ├── reset_button.dart
│       │   └── timer.dart
│       ├── grid.dart
│       ├── menu_items.dart
│       ├── picture_and_animation_row.dart
│       ├── top_appbar.dart
│       └── winning_card.dart
├── generated_plugin_registrant.dart
└── main.dart
```
