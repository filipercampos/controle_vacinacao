#!bin/bash
flutter clean
flutter pub get
rm -Rf ios/Pods
rm -Rf ios/.symlinks
rm -Rf ios/Flutter/Flutter.framework
rm -Rf ios/Flutter/Flutter.podspec
cd ios
pod install
cd ..