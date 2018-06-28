Objective-C wrapper for Uniform Type Identifiers (UTIs)
=======================================================

[![Build Status](https://img.shields.io/travis/macmade/objc-uti.svg?branch=master&style=flat)](https://travis-ci.org/macmade/objc-uti)
[![Coverage Status](https://img.shields.io/coveralls/macmade/objc-uti.svg?branch=master&style=flat)](https://coveralls.io/r/macmade/objc-uti?branch=master)
[![Issues](http://img.shields.io/github/issues/macmade/objc-uti.svg?style=flat)](https://github.com/macmade/objc-uti/issues)
![Status](https://img.shields.io/badge/status-active-brightgreen.svg?style=flat)
![License](https://img.shields.io/badge/license-mit-brightgreen.svg?style=flat)
[![Contact](https://img.shields.io/badge/contact-@macmade-blue.svg?style=flat)](https://twitter.com/macmade)  
[![Donate-Patreon](https://img.shields.io/badge/donate-patreon-yellow.svg?style=flat)](https://patreon.com/macmade)
[![Donate-Gratipay](https://img.shields.io/badge/donate-gratipay-yellow.svg?style=flat)](https://www.gratipay.com/macmade)
[![Donate-Paypal](https://img.shields.io/badge/donate-paypal-yellow.svg?style=flat)](https://paypal.me/xslabs)

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
