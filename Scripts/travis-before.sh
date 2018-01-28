#!/bin/bash

# Installs XSDocgen
git clone --recursive git://github.com/macmade/XSDocgen
cd XSDocgen && make && sudo make install && cd ..
