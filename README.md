Objective-C wrapper for Uniform Type Identifiers (UTIs)
=======================================================

[![Build Status](https://img.shields.io/travis/macmade/objc-uti.svg?branch=master&style=flat)](https://travis-ci.org/macmade/objc-uti)
[![Issues](http://img.shields.io/github/issues/macmade/objc-uti.svg?style=flat)](https://github.com/macmade/objc-uti/issues)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?style=flat)
![License](https://img.shields.io/badge/license-mit-brightgreen.svg?style=flat)
[![Contact](https://img.shields.io/badge/contact-@macmade-blue.svg?style=flat)](https://twitter.com/macmade)

About
-----

This project consists of an Objective-C wrapper for all the UTI functions available from the `LaunchServices` framework.

The goal is to provide an object-oriented approach to the Uniform Type Identifier system, using Objective-C (Foundation) data types, rather than CoreFoundation types, which may be painful to use, especially with ARC.

### Targets

The following targets are available:

 * OS X static library (`.a`).
 * OS X dynamic library (`.dylib`).
 * OS X framework (`.framework`).
 * iOS static library (`.a`).

All targets are available for both ARC and MRC (see below).

### Supported platforms

 * OS X deployment target: **OS X 10.6** (ARC - see below), **OS X 10.4** (MRC - see below)
 * OS X architectures: **x86_64, i386** (non-ARC - see below)
 * iOS deployment target: **iOS 6.0**
 * iOS architectures: **armv7, armv7s, arm64**

### Automatic Reference Counting (ARC) Note

All project's targets comes in two flavors.  
One using ARC - Automatic Reference Counting, the other using Manual Reference Counting (MRC).

If you're targeting only 64-bits platforms and/or 10.7 deployment targets, you're advised to use the ARC targets.  
Otherwise, if targeting 32-bits platforms and/or deployment targets lower than 10.7, MRC targets are available.

Documentation
-------------

Documentation and API reference can be found at: http://doc.xs-labs.com/objc-uti/

License
-------

The project is released under the terms of the MIT License.

Repository Infos
----------------

    Owner:			Jean-David Gadina - XS-Labs
    Web:			www.xs-labs.com
    Blog:			www.noxeos.com
    Twitter:		@macmade
    GitHub:			github.com/macmade
    LinkedIn:		ch.linkedin.com/in/macmade/
    StackOverflow:	stackoverflow.com/users/182676/macmade


