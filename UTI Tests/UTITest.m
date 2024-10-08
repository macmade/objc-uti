/*******************************************************************************
 * The MIT License (MIT)
 * 
 * Copyright (c) 2014 Jean-David Gadina - www-xs-labs.com
 * 
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 * 
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 * 
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 ******************************************************************************/

/*!
 * @file        UTITest.m
 * @copyright   (c) 2014 - Jean-David Gadina - www.xs-labs.com
 * @abstract    Test class for UTI
 */

#ifdef __clang__
#pragma clang diagnostic ignored "-Wvariadic-macros"
#pragma clang diagnostic ignored "-Wgnu-statement-expression"
#pragma clang diagnostic ignored "-Wgnu-zero-variadic-macro-arguments"
#endif

#import <XCTest/XCTest.h>

@import UTI;
@import AppKit; /* For NSVCardPboardType */

@interface UTITest: XCTestCase
{}

@end

@implementation UTITest

- ( void )setUp
{
    [ super setUp ];
}

- ( void )tearDown
{
    [ super tearDown ];
}

- ( void )test_isDynamic
{
    UTI * uti;
    
    uti = [ UTI UTIWithFileExtension: @"txt" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertFalse( uti.isDynamic );
    
    uti = [ UTI UTIWithFileExtension: @"xyz" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_preferredFilenameExtension
{
    UTI * uti;
    
    uti = [ UTI plainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.preferredFilenameExtension, @"txt" );
}

- ( void )test_preferredMIMEType
{
    UTI * uti;
    
    uti = [ UTI plainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.preferredMIMEType, @"text/plain" );
}

- ( void )test_preferredNSPboardType
{
    UTI * uti;
    
    uti = [ UTI vCardTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.preferredNSPboardType, NSVCardPboardType );
}

- ( void )test_preferredOSType
{
    UTI * uti;
    
    uti = [ UTI vCardTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.preferredOSType, @"vCrd" );
}

- ( void )test_description
{
    UTI * uti;
    
    uti = [ UTI plainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.description, @"text" );
    
    uti = [ UTI UTIWithFileExtension: @"xyz" allowDynamic: YES ];
    
    XCTAssertNotNil( uti.description );
}

- ( void )test_declaration
{
    UTI * uti;
    
    uti = [ UTI plainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertNotNil( uti.declaration );
    XCTAssertGreaterThan( uti.declaration.count, ( NSUInteger )0 );
}

- ( void )test_declaringBundleURL
{
    UTI * uti;
    
    uti = [ UTI plainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertNotNil( uti.declaringBundleURL.path );
    XCTAssertTrue( [ [ NSFileManager defaultManager ] fileExistsAtPath: ( NSString * _Nonnull )( uti.declaringBundleURL.path ) ] );
}

- ( void )test_identifier
{
    UTI * uti;
    
    uti = [ UTI dataTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.data" );
}

- ( void )test_tagSpecifications
{
    UTI * uti;
    
    uti = [ UTI dataTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertNotNil( uti.tagSpecifications );
    XCTAssertGreaterThan( uti.tagSpecifications.count, ( NSUInteger )0 );
}

- ( void )test_conformsTo
{
    UTI * uti;
    
    uti = [ UTI dataTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertNotNil( uti.conformsTo );
}

- ( void )test_UTIWithString
{
    UTI * uti;
    
    uti = [ UTI UTIWithString: @"public.objective-c-source" ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )test_UTIWithCFString
{
    UTI       * uti;
    CFStringRef s;
    
    s   = CFStringCreateWithCString( NULL, "public.objective-c-source", kCFStringEncodingASCII );
    uti = [ UTI UTIWithCFString: s ];
    
    CFRelease( s );
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )test_UTIWithFileExtension
{
    UTI * uti;
    
    uti = [ UTI UTIWithFileExtension: @"txt" ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI plainTextTypeUTI ] ] );
}

- ( void )test_UTIWithFileExtension_allowDynamic
{
    UTI * uti;
    
    uti = [ UTI UTIWithFileExtension: @"xyz" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ UTI UTIWithFileExtension: @"xyz" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_UTIWithFileExtension_conformingTo
{
    UTI * uti;
    
    uti = [ UTI UTIWithFileExtension: @"txt" conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ UTI UTIWithFileExtension: @"txt" conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_UTIWithMIMEType
{
    UTI * uti;
    
    uti = [ UTI UTIWithMIMEType: @"text/plain" ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI plainTextTypeUTI ] ] );
}

- ( void )test_UTIWithMIMEType_allowDynamic
{
    UTI * uti;
    
    uti = [ UTI UTIWithMIMEType: @"xyz/xyz" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ UTI UTIWithMIMEType: @"xyz/xyz" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_UTIWithMIMEType_conformingTo
{
    UTI * uti;
    
    uti = [ UTI UTIWithMIMEType: @"text/plain" conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ UTI UTIWithMIMEType: @"text/plain" conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_UTIWithNSPboardType
{
    UTI * uti;
    
    uti = [ UTI UTIWithNSPboardType: NSVCardPboardType ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI vCardTypeUTI ] ] );
}

- ( void )test_UTIWithNSPboardType_allowDynamic
{
    UTI * uti;
    
    uti = [ UTI UTIWithNSPboardType: @"Unknown pasteboard type" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ UTI UTIWithNSPboardType: @"Unknown pasteboard type" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_UTIWithNSPboardType_conformingTo
{
    UTI * uti;
    
    uti = [ UTI UTIWithNSPboardType: NSVCardPboardType conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ UTI UTIWithNSPboardType: NSVCardPboardType conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_UTIWithOSType
{
    UTI * uti;
    
    uti = [ UTI UTIWithOSType: @"vCrd" ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI vCardTypeUTI ] ] );
}

- ( void )test_UTIWithOSType_allowDynamic
{
    UTI * uti;
    
    uti = [ UTI UTIWithOSType: @"ABCD" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ UTI UTIWithOSType: @"ABCD" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_UTIWithOSType_conformingTo
{
    UTI * uti;
    
    uti = [ UTI UTIWithOSType: @"vCrd" conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ UTI UTIWithOSType: @"vCrd" conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_abstractTypes
{
    NSArray * types;
    
    types = [ UTI abstractTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
    }
}

- ( void )test_concreteTypes
{
    NSArray * types;
    
    types = [ UTI concreteTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
    }
}

- ( void )test_textTypes
{
    NSArray * types;
    
    types = [ UTI textTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
        XCTAssertTrue( [ uti conformsToUTI: [ UTI textTypeUTI ] ] );
    }
}

- ( void )test_compositeContentTypes
{
    NSArray * types;
    
    types = [ UTI compositeContentTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
        XCTAssertTrue( [ uti conformsToUTI: [ UTI compositeContentTypeUTI ] ] );
    }
}

- ( void )test_imageContentTypes
{
    NSArray * types;
    
    types = [ UTI imageContentTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
        XCTAssertTrue( [ uti conformsToUTI: [ UTI imageTypeUTI ] ] );
    }
}

- ( void )test_audioVisualContentTypes
{
    NSArray * types;
    
    types = [ UTI audioVisualContentTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
        XCTAssertTrue( [ uti conformsToUTI: [ UTI audiovisualContentTypeUTI ] ] );
    }
}

- ( void )test_directoryTypes
{
    NSArray * types;
    
    types = [ UTI directoryTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
        XCTAssertTrue( [ uti conformsToUTI: [ UTI directoryTypeUTI ] ] );
    }
}

- ( void )test_applicationTypes
{
    NSArray * types;
    
    types = [ UTI applicationTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
        XCTAssertTrue( [ uti conformsToUTI: [ UTI applicationTypeUTI ] ] );
    }
}

- ( void )test_contactTypes
{
    NSArray * types;
    
    types = [ UTI contactTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
        XCTAssertTrue( [ uti conformsToUTI: [ UTI contactTypeUTI ] ] );
    }
}

- ( void )test_miscellaneousTypes
{
    NSArray * types;
    
    types = [ UTI miscellaneousTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
    }
}

- ( void )test_itemTypeUTI
{
    UTI * uti;
    
    uti = [ UTI itemTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.item" );
}

- ( void )test_contentTypeUTI
{
    UTI * uti;
    
    uti = [ UTI contentTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.content" );
}

- ( void )test_CompositeContentTypeUTI
{
    UTI * uti;
    
    uti = [ UTI compositeContentTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.composite-content" );
}

- ( void )test_applicationTypeUTI
{
    UTI * uti;
    
    uti = [ UTI applicationTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.application" );
}

- ( void )test_messageTypeUTI
{
    UTI * uti;
    
    uti = [ UTI messageTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.message" );
}

- ( void )test_contactTypeUTI
{
    UTI * uti;
    
    uti = [ UTI contactTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.contact" );
}

- ( void )test_archiveTypeUTI
{
    UTI * uti;
    
    uti = [ UTI archiveTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.archive" );
}

- ( void )test_diskImageTypeUTI
{
    UTI * uti;
    
    uti = [ UTI diskImageTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.disk-image" );
}

- ( void )test_dataTypeUTI
{
    UTI * uti;
    
    uti = [ UTI aliasFileTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.alias-file" );
}

- ( void )test_aliasRecordTypeUTI
{
    UTI * uti;
    
    uti = [ UTI aliasRecordTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.alias-record" );
}

- ( void )test_URLTypeUTI
{
    UTI * uti;
    
    uti = [ UTI URLTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.url" );
}

- ( void )test_fileURLTypeUTI
{
    UTI * uti;
    
    uti = [ UTI fileURLTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.file-url" );
}

- ( void )test_textTypeUTI
{
    UTI * uti;
    
    uti = [ UTI textTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.text" );
}

- ( void )test_plainTextTypeUTI
{
    UTI * uti;
    
    uti = [ UTI plainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.plain-text" );
}

- ( void )test_UTF8PlainTextTypeUTI
{
    UTI * uti;
    
    uti = [ UTI UTF8PlainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.utf8-plain-text" );
}

- ( void )test_UTF16ExternalPlainTextTypeUTI
{
    UTI * uti;
    
    uti = [ UTI UTF16ExternalPlainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.utf16-external-plain-text" );
}

- ( void )test_UTF16PlainTextTypeUTI
{
    UTI * uti;
    
    uti = [ UTI UTF16PlainTextTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.utf16-plain-text" );
}

- ( void )test_RTFTypeUTI
{
    UTI * uti;
    
    uti = [ UTI RTFTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.rtf" );
}

- ( void )test_HTMLTypeUTI
{
    UTI * uti;
    
    uti = [ UTI HTMLTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.html" );
}

- ( void )test_XMLTypeUTI
{
    UTI * uti;
    
    uti = [ UTI XMLTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.xml" );
}

- ( void )test_sourceCodeTypeUTI
{
    UTI * uti;
    
    uti = [ UTI sourceCodeTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.source-code" );
}

- ( void )test_CSourceTypeUTI
{
    UTI * uti;
    
    uti = [ UTI CSourceTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.c-source" );
}

- ( void )test_objectiveCSourceTypeUTI
{
    UTI * uti;
    
    uti = [ UTI objectiveCSourceTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )test_CPlusPlusSourceTypeUTI
{
    UTI * uti;
    
    uti = [ UTI CPlusPlusSourceTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.c-plus-plus-source" );
}

- ( void )test_objectiveCPlusPlusSourceTypeUTI
{
    UTI * uti;
    
    uti = [ UTI objectiveCPlusPlusSourceTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-plus-plus-source" );
}

- ( void )test_CHeaderTypeUTI
{
    UTI * uti;
    
    uti = [ UTI CHeaderTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.c-header" );
}

- ( void )test_CPlusPlusHeaderTypeUTI
{
    UTI * uti;
    
    uti = [ UTI CPlusPlusHeaderTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.c-plus-plus-header" );
}

- ( void )test_javaSourceTypeUTI
{
    UTI * uti;
    
    uti = [ UTI javaSourceTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.sun.java-source" );
}

- ( void )test_PDFTypeUTI
{
    UTI * uti;
    
    uti = [ UTI PDFTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.adobe.pdf" );
}

- ( void )test_RTFDTypeUTI
{
    UTI * uti;
    
    uti = [ UTI RTFDTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.rtfd" );
}

- ( void )test_flatRTFDTypeUTI
{
    UTI * uti;
    
    uti = [ UTI flatRTFDTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.flat-rtfd" );
}

- ( void )test_TXNTextAndMultimediaDataTypeUTI
{
    UTI * uti;
    
    uti = [ UTI TXNTextAndMultimediaDataTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.txn.text-multimedia-data" );
}

- ( void )test_webArchiveTypeUTI
{
    UTI * uti;
    
    uti = [ UTI webArchiveTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.webarchive" );
}

- ( void )test_imageTypeUTI
{
    UTI * uti;
    
    uti = [ UTI imageTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.image" );
}

- ( void )test_JPEGTypeUTI
{
    UTI * uti;
    
    uti = [ UTI JPEGTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.jpeg" );
}

- ( void )test_JPEG2000TypeUTI
{
    UTI * uti;
    
    uti = [ UTI JPEG2000TypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.jpeg-2000" );
}

- ( void )test_TIFFTypeUTI
{
    UTI * uti;
    
    uti = [ UTI TIFFTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.tiff" );
}

- ( void )test_PICTTypeUTI
{
    UTI * uti;
    
    uti = [ UTI PICTTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.pict" );
}

- ( void )test_GIFTypeUTI
{
    UTI * uti;
    
    uti = [ UTI GIFTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.compuserve.gif" );
}

- ( void )test_PNGTypeUTI
{
    UTI * uti;
    
    uti = [ UTI PNGTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.png" );
}

- ( void )test_quickTimeImageTypeUTI
{
    UTI * uti;
    
    uti = [ UTI quickTimeImageTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.quicktime-image" );
}

- ( void )test_appleICNSTypeUTI
{
    UTI * uti;
    
    uti = [ UTI appleICNSTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.icns" );
}

- ( void )test_BMPTypeUTI
{
    UTI * uti;
    
    uti = [ UTI BMPTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.microsoft.bmp" );
}

- ( void )test_ICOTypeUTI
{
    UTI * uti;
    
    uti = [ UTI ICOTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.microsoft.ico" );
}

- ( void )test_audiovisualContentTypeUTI
{
    UTI * uti;
    
    uti = [ UTI audiovisualContentTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.audiovisual-content" );
}

- ( void )test_movieTypeUTI
{
    UTI * uti;
    
    uti = [ UTI movieTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.movie" );
}

- ( void )test_videoTypeUTI
{
    UTI * uti;
    
    uti = [ UTI videoTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.video" );
}

- ( void )test_audioTypeUTI
{
    UTI * uti;
    
    uti = [ UTI audioTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.audio" );
}

- ( void )test_quickTimeMovieTypeUTI
{
    UTI * uti;
    
    uti = [ UTI quickTimeMovieTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.quicktime-movie" );
}

- ( void )test_MPEGTypeUTI
{
    UTI * uti;
    
    uti = [ UTI MPEGTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.mpeg" );
}

- ( void )test_MPEG4TypeUTI
{
    UTI * uti;
    
    uti = [ UTI MPEG4TypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.mpeg-4" );
}

- ( void )test_MP3TypeUTI
{
    UTI * uti;
    
    uti = [ UTI MP3TypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.mp3" );
}

- ( void )test_MPEG4AudioTypeUTI
{
    UTI * uti;
    
    uti = [ UTI MPEG4AudioTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.mpeg-4-audio" );
}

- ( void )test_appleProtectedMPEG4AudioTypeUTI
{
    UTI * uti;
    
    uti = [ UTI appleProtectedMPEG4AudioTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.protected-mpeg-4-audio" );
}

- ( void )test_folderTypeUTI
{
    UTI * uti;
    
    uti = [ UTI folderTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.folder" );
}

- ( void )test_volumeTypeUTI
{
    UTI * uti;
    
    uti = [ UTI volumeTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.volume" );
}

- ( void )test_packageTypeUTI
{
    UTI * uti;
    
    uti = [ UTI packageTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.package" );
}

- ( void )test_bundleTypeUTI
{
    UTI * uti;
    
    uti = [ UTI bundleTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.bundle" );
}

- ( void )test_frameworkTypeUTI
{
    UTI * uti;
    
    uti = [ UTI frameworkTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.framework" );
}

- ( void )test_applicationBundleTypeUTI
{
    UTI * uti;
    
    uti = [ UTI applicationBundleTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.application-bundle" );
}

- ( void )test_applicationFileTypeUTI
{
    UTI * uti;
    
    uti = [ UTI applicationFileTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.application-file" );
}

- ( void )test_vCardTypeUTI
{
    UTI * uti;
    
    uti = [ UTI vCardTypeUTI ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.vcard" );
}

- ( void )test_inkTextTypeUTI
{
    UTI * uti;
    
    uti = [ UTI inkTextTypeUTI ];
    
    XCTAssertNotNil( [ UTI inkTextTypeUTI ] );
    XCTAssertEqualObjects( uti.identifier, @"com.apple.ink.inktext" );
}

- ( void )test_allUTIsWithFileExtension
{
    XCTAssertGreaterThan( [ UTI allUTIsWithFileExtension: @"mp4" ].count, ( NSUInteger )1 );
    XCTAssertEqual(       [ UTI allUTIsWithFileExtension: @"xyz" ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithFileExtension_allowDynamic
{
    XCTAssertGreaterThan( [ UTI allUTIsWithFileExtension: @"xyz" allowDynamic: YES ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithFileExtension: @"xyz" allowDynamic: NO  ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithFileExtension_conformingTo
{
    XCTAssertGreaterThan( [ UTI allUTIsWithFileExtension: @"mp4" conformingTo: [ UTI audioTypeUTI ] ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithFileExtension: @"mp4" conformingTo: [ UTI textTypeUTI  ] ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithMIMEType
{
    XCTAssertGreaterThan( [ UTI allUTIsWithMIMEType: @"audio/mpeg" ].count, ( NSUInteger )1 );
    XCTAssertEqual(       [ UTI allUTIsWithMIMEType: @"xyz/xyz"    ].count, ( NSUInteger )0 );
}

- ( void )test_AllUTIsWithMIMEType_allowDynamic
{
    XCTAssertGreaterThan( [ UTI allUTIsWithMIMEType: @"xyz/xyz" allowDynamic: YES ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithMIMEType: @"xyz/xyz" allowDynamic: NO  ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithMIMEType_conformingTo
{
    XCTAssertGreaterThan( [ UTI allUTIsWithMIMEType: @"audio/mpeg" conformingTo: [ UTI audioTypeUTI ] ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithMIMEType: @"audio/mpeg" conformingTo: [ UTI textTypeUTI  ] ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithNSPboardType
{
    XCTAssertGreaterThan( [ UTI allUTIsWithNSPboardType: NSVCardPboardType          ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithNSPboardType: @"Unknown pasteboard type" ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithNSPboardType_allowDynamic
{
    XCTAssertGreaterThan( [ UTI allUTIsWithNSPboardType: @"Unknown pasteboard type" allowDynamic: YES ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithNSPboardType: @"Unknown pasteboard type" allowDynamic: NO  ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithNSPboardType_conformingTo
{
    XCTAssertGreaterThan( [ UTI allUTIsWithNSPboardType: NSVCardPboardType conformingTo: [ UTI contactTypeUTI ] ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithNSPboardType: NSVCardPboardType conformingTo: [ UTI audioTypeUTI   ] ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithOSType
{
    XCTAssertGreaterThan( [ UTI allUTIsWithOSType: @"mpg4" ].count, ( NSUInteger )1 );
    XCTAssertEqual(       [ UTI allUTIsWithOSType: @"ABCD" ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithOSType_allowDynamic
{
    XCTAssertGreaterThan( [ UTI allUTIsWithOSType: @"mpg4" allowDynamic: YES ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithOSType: @"ABCD" allowDynamic: NO  ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithOSType_conformingTo
{
    XCTAssertGreaterThan( [ UTI allUTIsWithOSType: @"mpg4" conformingTo: [ UTI audioTypeUTI ] ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithOSType: @"ABCD" conformingTo: [ UTI textTypeUTI  ] ].count, ( NSUInteger )0 );
}

- ( void )test_stringForOSType
{
    OSType t;
    
    #pragma clang diagnostic push
    #pragma clang diagnostic ignored "-Wfour-char-constants"
    t = 'ABCD';
    #pragma clang diagnostic pop
    
    XCTAssertEqualObjects( [ UTI stringForOSType: t ], @"ABCD" );
}

- ( void )test_OSTypeForString
{
    OSType t;
    
    t = [ UTI OSTypeForString: @"ABCD" ];
    
    XCTAssertEqual( ( t >> 24 ) & 0xFF, ( unsigned int )'A' );
    XCTAssertEqual( ( t >> 16 ) & 0xFF, ( unsigned int )'B' );
    XCTAssertEqual( ( t >>  8 ) & 0xFF, ( unsigned int )'C' );
    XCTAssertEqual( ( t >>  0 ) & 0xFF, ( unsigned int )'D' );
}

- ( void )test_init
{
    XCTAssertNotNil( [ [ UTI alloc ] init ] );
}

- ( void )test_initWithString
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithString: @"public.objective-c-source" ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )test_initWithCFString
{
    UTI       * uti;
    CFStringRef s;
    
    s   = CFStringCreateWithCString( NULL, "public.objective-c-source", kCFStringEncodingASCII );
    uti = [ [ UTI alloc ] initWithCFString: s ];
    
    CFRelease( s );
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )test_initWithFileExtension
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithFileExtension: @"txt" ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI plainTextTypeUTI ] ] );
}

- ( void )test_initWithFileExtension_allowDynamic
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithFileExtension: @"xyz" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ [ UTI alloc ] initWithFileExtension: @"xyz" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_initWithFileExtension_conformingTo
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithFileExtension: @"txt" conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ [ UTI alloc ] initWithFileExtension: @"txt" conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_initWithMIMEType
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithMIMEType: @"text/plain" ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI plainTextTypeUTI ] ] );
}

- ( void )test_initWithMIMEType_allowDynamic
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithMIMEType: @"xyz/xyz" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ [ UTI alloc ] initWithMIMEType: @"xyz/xyz" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_initWithMIMEType_conformingTo
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithMIMEType: @"text/plain" conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ [ UTI alloc ] initWithMIMEType: @"text/plain" conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_initWithNSPboardType
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithNSPboardType: NSVCardPboardType ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI vCardTypeUTI ] ] );
}

- ( void )test_initWithNSPboardType_allowDynamic
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithNSPboardType: @"Unknown pasteboard type" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ [ UTI alloc ] initWithNSPboardType: @"Unknown pasteboard type" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_initWithNSPboardType_conformingTo
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithNSPboardType: NSVCardPboardType conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ [ UTI alloc ] initWithNSPboardType: NSVCardPboardType conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_initWithOSType
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithOSType: @"vCrd" ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI vCardTypeUTI ] ] );
}

- ( void )test_initWithOSType_allowDynamic
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithOSType: @"ABCD" allowDynamic: NO ];
    
    XCTAssertNil( uti );
    
    uti = [ [ UTI alloc ] initWithOSType: @"ABCD" allowDynamic: YES ];
    
    XCTAssertNotNil( uti );
    XCTAssertTrue( uti.isDynamic );
}

- ( void )test_initWithOSType_conformingTo
{
    UTI * uti;
    
    uti = [ [ UTI alloc ] initWithOSType: @"vCrd" conformingTo: [ UTI textTypeUTI ] ];
    
    XCTAssertNotNil( uti );
    
    uti = [ [ UTI alloc ] initWithOSType: @"vCrd" conformingTo: [ UTI imageTypeUTI ] ];
    
    XCTAssertNil( uti );
}

- ( void )test_preferredTagForTagClass
{
    UTI * uti;
    
    uti = [ UTI HTMLTypeUTI ];
    
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassFilenameExtension ], @"html" );
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassMIMEType ],          @"text/html" );
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassNSPboardType ],      NSHTMLPboardType );
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassOSType ],            @"HTML" );
}

- ( void )test_isEqualToUTI
{
    UTI * uti;
    
    uti = [ UTI UTIWithString: @"public.plain-text" ];
    
    XCTAssertTrue(  [ uti isEqualToUTI: [ UTI plainTextTypeUTI ] ] );
    XCTAssertFalse( [ uti isEqualToUTI: [ UTI JPEGTypeUTI ] ] );
}

- ( void )test_conformsToUTI
{
    UTI * uti;
    
    uti = [ UTI UTIWithString: @"public.plain-text" ];
    
    XCTAssertTrue(  [ uti conformsToUTI: [ UTI textTypeUTI ] ] );
    XCTAssertFalse( [ uti conformsToUTI: [ UTI imageTypeUTI ] ] );
}

- ( void )test_objectForDeclarationDictionaryKey
{
    UTI * uti;
    
    uti = [ UTI dataTypeUTI ];
    
    XCTAssertNotNil( [ uti objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyIdentifier ] );
    XCTAssertNotNil( [ uti objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyDescription ] );
    XCTAssertNotNil( [ uti objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyConformsTo ] );
    XCTAssertNotNil( [ uti objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyTagSpecification ] );
}

- ( void )test_copy
{
    UTI * uti;
    
    uti = [ [ UTI UTIWithString: @"public.plain-text"  ] copy ];
    
    XCTAssertTrue( [ uti isEqualToUTI: [ UTI plainTextTypeUTI ] ] );
}

- ( void )test_isEqual
{
    UTI * uti;
    
    uti = [ UTI UTIWithString: @"public.plain-text" ];
    
    XCTAssertTrue(  [ uti isEqual: [ UTI plainTextTypeUTI ] ] );
    XCTAssertFalse( [ uti isEqual: [ UTI JPEGTypeUTI ] ] );
}

- ( void )test_isEqualTo
{
    UTI * uti;
    
    uti = [ UTI UTIWithString: @"public.plain-text" ];
    
    XCTAssertTrue(  [ uti isEqualTo: [ UTI plainTextTypeUTI ] ] );
    XCTAssertFalse( [ uti isEqualTo: [ UTI JPEGTypeUTI ] ] );
}

- ( void )test_Hash
{
    UTI * uti;
    
    uti = [ UTI plainTextTypeUTI ];
    
    XCTAssertEqual( [ uti hash ], [ @"public.plain-text" hash ] );
}

@end
