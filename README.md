# FlutterShow⚡️ - Presentations in Flutter

[![style: very good analysis](https://img.shields.io/badge/style-very_good_analysis-B22C89.svg)](https://pub.dev/packages/very_good_analysis)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

Unleash your creativity with presentations like never before! FlutterShow⚡️ is an easy-to-use framework built in Flutter for crafting engaging and interactive presentations.

Check out the full documentation showcasing all slides here: 🚧Coming soon...🚧

![Showcase](docs/images/showcase.png)

## General Information

FlutterShow consists of two main packages: `fluttershow_base` and `fluttershow_keynote`:

- [fluttershow_base](https://pub.dev/packages/fluttershow_base) contains most of the pre-built widgets that are used in `fluttershow_keynote`, but can also be used to make custom slides.
- [fluttershow_keynote](https://pub.dev/packages/fluttershow_keynote) is currently the default package and implements all basic slides with variations of the popular presentation software Keynote.
- The project utilizes riverpod hooks for state management, providing a simple and quick experience for managing your state.
- The project is designed to be easily expandable and customizable according to your preferences. You can switch libraries like `intl` to `easy_localizations` or use `fluttergen` for asset organization.

## Project Setup

To run your show, you can either use the pre-built `launch.json` file or follow these commands:

```bash
# Get dependencies
$ flutter pub get

# If language files were not generated
$ flutter pub run intl_utils:generate

# Run the app (for example on macOS)
$ flutter run -d macos
```

## Getting Started

- When you first explore the project, you'll find some sample slides that demonstrate how slides are built in this project.
- To create a new slide, add a new widget in the [`lib/slides`](lib/slides) directory.
- Once you finish creating your slide, navigate to [`lib/presentation/config/pages_of_presentation.dart`](lib/presentation/config/pages_of_presentation.dart) and add a new member to the enum using your new widget.
- Reload the app, and your slide will appear in all its glory! 🔥

## Awesome features

### Menu

The **Menu** _(Open using M key)_: Toggle dark/light mode depending on the location you are presenting at or quickly jump between your slides.

![Menu](docs/images/menu.png)

### Animations

Most slides and prebuilt widgets can be animated for a smoother experience. Simply pass an `animationIndex` parameter to enable animation on the desired slide or widget.
In addition to animating individual slides and widgets, you can also animate the transitions between slides. An example of slide transition animation can be found in [`lib/slides/03_motivation/view/motivation.dart`](lib/slides/03_motivation/view/motivation.dart) file.

### Rebindable Keys

You can easily rebind your keys for actions like navigating to the next or previous slide and opening the menu. Simply edit the actions in [`lib/presentation/config/key_actions.dart`](lib/presentation/config/key_actions.dart).
