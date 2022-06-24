# rotary_list
A plugin that offers a ListView which can be scrolled with the [rotary input](https://developer.android.com/training/wearables/user-input/rotary-input) of Wear OS devices.

![ListView Demo](./example/demo.gif)

*The delay between rotating the rotary input and the list movement, as can be seen in the gif above, is only noticeable on emulators. Not on real devices!*

## Usage

## Requirements 
To use this plugin, the `minSdkVersion` of your android project has to be at least `18`. The `minSdkVersion` can be found in `./android/app/build.gradle` in the root directory of your flutter project.

## Installation
1. To install this plugin depend on it in your pubspec.yaml
    ``` yaml
    dependencies:
      flutter:
        sdk: flutter

      # <other plugins>

      rotary_list:
        git:
          url: git://github.com/sebastianloose/rotary-list.git
          ref: main
    ```
2. Run `flutter pub get` in your terminal