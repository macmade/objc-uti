#!/bin/bash

# Installs XSDocgen
git clone --recursive git://github.com/macmade/XSDocgen
cd XSDocgen && make && sudo make install && cd ..

# Installs xcode-coveralls
git clone --recursive https://github.com/macmade/xcode-coveralls.git /tmp/xcode-coveralls
sudo xctool --project /tmp/xcode-coveralls/xcode-coveralls.xcodeproj --scheme xcode-coveralls DSTROOT=/ install
