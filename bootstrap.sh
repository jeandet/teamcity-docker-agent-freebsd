#!/usr/bin/env bash

sudo pkg update
sudo pkg upgrade
sudo pkg install -y openjdk8 doxygen python python3 py27-numpy py27-scipy py36-numpy py36-scipy cmake ninja lcov cppcheck gcc
sudo pkg install -y wx30-gtk2 qt5-buildtools qt5-linguisttools qt5-qmake qt5-widgets qt4-gui libwmf pkgconf qt4-moc qt4-uic qt4-rcc qt4-linguisttools qt4-qmake

