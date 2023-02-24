Objective-C wrapper for Uniform Type Identifiers (UTIs)
=======================================================

[![Build Status](https://img.shields.io/github/actions/workflow/status/macmade/objc-uti/ci-mac.yaml?label=macOS&logo=apple)](https://github.com/macmade/objc-uti/actions/workflows/ci-mac.yaml)
[![Issues](http://img.shields.io/github/issues/macmade/objc-uti.svg?logo=github)](https://github.com/macmade/objc-uti/issues)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?logo=git)
![License](https://img.shields.io/badge/license-mit-brightgreen.svg?logo=open-source-initiative)  
[![Contact](https://img.shields.io/badge/follow-@macmade-blue.svg?logo=twitter&style=social)](https://twitter.com/macmade)
[![Sponsor](https://img.shields.io/badge/sponsor-macmade-pink.svg?logo=github-sponsors&style=social)](https://github.com/sponsors/macmade)

About
-----

This project consists of an Objective-C wrapper for all the UTI functions available from the `LaunchServices` framework.

The goal is to provide an object-oriented approach to the Uniform Type Identifier system, using Objective-C (Foundation) data types, rather than CoreFoundation types, which may be painful to use, especially with ARC.

### Swift support

This project is fully compatible with Swift.

In order to use the `UTI` class from Swift, simply link with `UTI.framework` and:

    import UTI

### Targets

The following targets are available:

 * OS X static library (`.a`).
 * OS X framework (`.framework`).
 * iOS static library (`.a`).

### Supported platforms

 * OS X deployment target: **OS X 10.6**
 * iOS deployment target: **iOS 6.0**

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
