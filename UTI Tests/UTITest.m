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

@import UTI;

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
    
}

- ( void )test_preferredFilenameExtension
{
    
}

- ( void )test_preferredMIMEType
{
    
}

- ( void )test_preferredNSPboardType
{
    
}

- ( void )test_preferredOSType
{
    
}

- ( void )test_description
{
    
}

- ( void )test_declaration
{
    
}

- ( void )test_declaringBundleURL
{
    
}

- ( void )test_exportedTypes
{
    
}

- ( void )test_importedTypes
{
    
}

- ( void )test_identifier
{
    
}

- ( void )test_tagSpecifications
{
    
}

- ( void )test_conformsTo
{
    
}

- ( void )test_iconFile
{
    
}

- ( void )test_referenceURL
{
    
}

- ( void )test_version
{
    
}

- ( void )test_UTIWithString
{
    UTI * uti;
    
    uti = [ UTI UTIWithString: @"public.objective-c-source" ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )test_UTIWithString_allowDynamic
{
    
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

- ( void )test_UTIWithCFString_allowDynamic
{
    
}

- ( void )test_UTIWithFileExtension
{
    
}

- ( void )test_UTIWithFileExtension_allowDynamic
{
    
}

- ( void )test_UTIWithFileExtension_ConformingTo
{
    
}

- ( void )test_UTIWithFileExtension_ConformingTo_allowDynamic
{
    
}

- ( void )test_UTIWithMIMEType
{
    
}

- ( void )test_UTIWithMIMEType_allowDynamic
{
    
}

- ( void )test_UTIWithMIMEType_ConformingTo
{
    
}

- ( void )test_UTIWithMIMEType_ConformingTo_allowDynamic
{
    
}

- ( void )test_UTIWithNSPboardType
{
    
}

- ( void )test_UTIWithNSPboardType_allowDynamic
{
    
}

- ( void )test_UTIWithNSPboardType_ConformingTo
{
    
}

- ( void )test_UTIWithNSPboardType_ConformingTo_allowDynamic
{
    
}

- ( void )test_UTIWithOSType
{
    
}

- ( void )test_UTIWithOSType_allowDynamic
{
    
}

- ( void )test_UTIWithOSType_ConformingTo
{
    
}

- ( void )test_UTIWithOSType_ConformingTo_allowDynamic
{
    
}

- ( void )test_UTIWithTag_TagClass_ConformingTo_allowDynamic
{
    
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
    XCTAssertNotNil( [ UTI itemTypeUTI ] );
}

- ( void )test_contentTypeUTI
{
    XCTAssertNotNil( [ UTI contentTypeUTI ] );
}

- ( void )test_CompositeContentTypeUTI
{
    XCTAssertNotNil( [ UTI compositeContentTypeUTI ] );
}

- ( void )test_applicationTypeUTI
{
    XCTAssertNotNil( [ UTI applicationTypeUTI ] );
}

- ( void )test_messageTypeUTI
{
    XCTAssertNotNil( [ UTI messageTypeUTI ] );
}

- ( void )test_contactTypeUTI
{
    XCTAssertNotNil( [ UTI contactTypeUTI ] );
}

- ( void )test_archiveTypeUTI
{
    XCTAssertNotNil( [ UTI archiveTypeUTI ] );
}

- ( void )test_diskImageTypeUTI
{
    XCTAssertNotNil( [ UTI diskImageTypeUTI ] );
}

- ( void )test_dataTypeUTI
{
    XCTAssertNotNil( [ UTI dataTypeUTI ] );
}

- ( void )test_directoryTypeUTI
{
    XCTAssertNotNil( [ UTI directoryTypeUTI ] );
}

- ( void )test_resolvableTypeUTI
{
    XCTAssertNotNil( [ UTI resolvableTypeUTI ] );
}

- ( void )test_symLinkTypeUTI
{
    XCTAssertNotNil( [ UTI symLinkTypeUTI ] );
}

- ( void )test_mountPointTypeUTI
{
    XCTAssertNotNil( [ UTI mountPointTypeUTI ] );
}

- ( void )test_aliasFileTypeUTI
{
    XCTAssertNotNil( [ UTI aliasFileTypeUTI ] );
}

- ( void )test_aliasRecordTypeUTI
{
    XCTAssertNotNil( [ UTI aliasRecordTypeUTI ] );
}

- ( void )test_URLTypeUTI
{
    XCTAssertNotNil( [ UTI URLTypeUTI ] );
}

- ( void )test_fileURLTypeUTI
{
    XCTAssertNotNil( [ UTI fileURLTypeUTI ] );
}

- ( void )test_textTypeUTI
{
    XCTAssertNotNil( [ UTI textTypeUTI ] );
}

- ( void )test_plainTextTypeUTI
{
    XCTAssertNotNil( [ UTI plainTextTypeUTI ] );
}

- ( void )test_UTF8PlainTextTypeUTI
{
    XCTAssertNotNil( [ UTI UTF8PlainTextTypeUTI ] );
}

- ( void )test_UTF16ExternalPlainTextTypeUTI
{
    XCTAssertNotNil( [ UTI UTF16ExternalPlainTextTypeUTI ] );
}

- ( void )test_UTF16PlainTextTypeUTI
{
    XCTAssertNotNil( [ UTI UTF16PlainTextTypeUTI ] );
}

- ( void )test_RTFTypeUTI
{
    XCTAssertNotNil( [ UTI RTFTypeUTI ] );
}

- ( void )test_HTMLTypeUTI
{
    XCTAssertNotNil( [ UTI HTMLTypeUTI ] );
}

- ( void )test_XMLTypeUTI
{
    XCTAssertNotNil( [ UTI XMLTypeUTI ] );
}

- ( void )test_sourceCodeTypeUTI
{
    XCTAssertNotNil( [ UTI sourceCodeTypeUTI ] );
}

- ( void )test_CSourceTypeUTI
{
    XCTAssertNotNil( [ UTI CSourceTypeUTI ] );
}

- ( void )test_objectiveCSourceTypeUTI
{
    XCTAssertNotNil( [ UTI objectiveCSourceTypeUTI ] );
}

- ( void )test_CPlusPlusSourceTypeUTI
{
    XCTAssertNotNil( [ UTI CPlusPlusSourceTypeUTI ] );
}

- ( void )test_objectiveCPlusPlusSourceTypeUTI
{
    XCTAssertNotNil( [ UTI objectiveCPlusPlusSourceTypeUTI ] );
}

- ( void )test_CHeaderTypeUTI
{
    XCTAssertNotNil( [ UTI CHeaderTypeUTI ] );
}

- ( void )test_CPlusPlusHeaderTypeUTI
{
    XCTAssertNotNil( [ UTI CPlusPlusHeaderTypeUTI ] );
}

- ( void )test_javaSourceTypeUTI
{
    XCTAssertNotNil( [ UTI javaSourceTypeUTI ] );
}

- ( void )test_PDFTypeUTI
{
    XCTAssertNotNil( [ UTI PDFTypeUTI ] );
}

- ( void )test_RTFDTypeUTI
{
    XCTAssertNotNil( [ UTI RTFDTypeUTI ] );
}

- ( void )test_flatRTFDTypeUTI
{
    XCTAssertNotNil( [ UTI flatRTFDTypeUTI ] );
}

- ( void )test_TXNTextAndMultimediaDataTypeUTI
{
    XCTAssertNotNil( [ UTI TXNTextAndMultimediaDataTypeUTI ] );
}

- ( void )test_webArchiveTypeUTI
{
    XCTAssertNotNil( [ UTI webArchiveTypeUTI ] );
}

- ( void )test_imageTypeUTI
{
    XCTAssertNotNil( [ UTI imageTypeUTI ] );
}

- ( void )test_JPEGTypeUTI
{
    XCTAssertNotNil( [ UTI JPEGTypeUTI ] );
}

- ( void )test_JPEG2000TypeUTI
{
    XCTAssertNotNil( [ UTI JPEG2000TypeUTI ] );
}

- ( void )test_TIFFTypeUTI
{
    XCTAssertNotNil( [ UTI TIFFTypeUTI ] );
}

- ( void )test_PICTTypeUTI
{
    XCTAssertNotNil( [ UTI PICTTypeUTI ] );
}

- ( void )test_GIFTypeUTI
{
    XCTAssertNotNil( [ UTI GIFTypeUTI ] );
}

- ( void )test_PNGTypeUTI
{
    XCTAssertNotNil( [ UTI PNGTypeUTI ] );
}

- ( void )test_quickTimeImageTypeUTI
{
    XCTAssertNotNil( [ UTI quickTimeImageTypeUTI ] );
}

- ( void )test_appleICNSTypeUTI
{
    XCTAssertNotNil( [ UTI appleICNSTypeUTI ] );
}

- ( void )test_BMPTypeUTI
{
    XCTAssertNotNil( [ UTI BMPTypeUTI ] );
}

- ( void )test_ICOTypeUTI
{
    XCTAssertNotNil( [ UTI ICOTypeUTI ] );
}

- ( void )test_audiovisualContentTypeUTI
{
    XCTAssertNotNil( [ UTI audiovisualContentTypeUTI ] );
}

- ( void )test_movieTypeUTI
{
    XCTAssertNotNil( [ UTI movieTypeUTI ] );
}

- ( void )test_videoTypeUTI
{
    XCTAssertNotNil( [ UTI videoTypeUTI ] );
}

- ( void )test_audioTypeUTI
{
    XCTAssertNotNil( [ UTI audioTypeUTI ] );
}

- ( void )test_quickTimeMovieTypeUTI
{
    XCTAssertNotNil( [ UTI quickTimeMovieTypeUTI ] );
}

- ( void )test_MPEGTypeUTI
{
    XCTAssertNotNil( [ UTI MPEGTypeUTI ] );
}

- ( void )test_MPEG4TypeUTI
{
    XCTAssertNotNil( [ UTI MPEG4TypeUTI ] );
}

- ( void )test_MP3TypeUTI
{
    XCTAssertNotNil( [ UTI MP3TypeUTI ] );
}

- ( void )test_MPEG4AudioTypeUTI
{
    XCTAssertNotNil( [ UTI MPEG4AudioTypeUTI ] );
}

- ( void )test_appleProtectedMPEG4AudioTypeUTI
{
    XCTAssertNotNil( [ UTI appleProtectedMPEG4AudioTypeUTI ] );
}

- ( void )test_folderTypeUTI
{
    XCTAssertNotNil( [ UTI folderTypeUTI ] );
}

- ( void )test_volumeTypeUTI
{
    XCTAssertNotNil( [ UTI volumeTypeUTI ] );
}

- ( void )test_packageTypeUTI
{
    XCTAssertNotNil( [ UTI packageTypeUTI ] );
}

- ( void )test_bundleTypeUTI
{
    XCTAssertNotNil( [ UTI bundleTypeUTI ] );
}

- ( void )test_frameworkTypeUTI
{
    XCTAssertNotNil( [ UTI frameworkTypeUTI ] );
}

- ( void )test_applicationBundleTypeUTI
{
    XCTAssertNotNil( [ UTI applicationBundleTypeUTI ] );
}

- ( void )test_applicationFileTypeUTI
{
    XCTAssertNotNil( [ UTI applicationFileTypeUTI ] );
}

- ( void )test_vCardTypeUTI
{
    XCTAssertNotNil( [ UTI vCardTypeUTI ] );
}

- ( void )test_inkTextTypeUTI
{
    XCTAssertNotNil( [ UTI inkTextTypeUTI ] );
}

- ( void )test_allUTIsWithFileExtension
{
    XCTAssertGreaterThan( [ UTI allUTIsWithFileExtension: @"mp4" ].count, ( NSUInteger )1 );
    XCTAssertEqual(       [ UTI allUTIsWithFileExtension: @"xyz" ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithFileExtension_allowDynamic
{
    
}

- ( void )test_allUTIsWithFileExtension_ConformingTo
{
    XCTAssertGreaterThan( [ UTI allUTIsWithFileExtension: @"mp4" conformingTo: [ UTI audioTypeUTI ] ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithFileExtension: @"mp4" conformingTo: [ UTI textTypeUTI  ] ].count, ( NSUInteger )0 );
}

- ( void )test_AllUTIsWithFileExtension_ConformingTo_allowDynamic
{
    
}

- ( void )test_allUTIsWithMIMEType
{
    XCTAssertGreaterThan( [ UTI allUTIsWithMIMEType: @"audio/mpeg" ].count, ( NSUInteger )1 );
    XCTAssertEqual(       [ UTI allUTIsWithMIMEType: @"xyz/xyz"    ].count, ( NSUInteger )0 );
}

- ( void )test_AllUTIsWithMIMEType_allowDynamic
{
    
}

- ( void )test_allUTIsWithMIMEType_ConformingTo
{
    XCTAssertGreaterThan( [ UTI allUTIsWithMIMEType: @"audio/mpeg" conformingTo: [ UTI audioTypeUTI ] ].count, ( NSUInteger )0 );
    XCTAssertEqual(       [ UTI allUTIsWithMIMEType: @"audio/mpeg" conformingTo: [ UTI textTypeUTI  ] ].count, ( NSUInteger )0 );
}

- ( void )test_allUTIsWithMIMEType_ConformingTo_allowDynamic
{
    
}

- ( void )test_allUTIsWithNSPboardType
{
    
}

- ( void )test_allUTIsWithNSPboardType_allowDynamic
{
    
}

- ( void )test_allUTIsWithNSPboardType_ConformingTo
{
    
}

- ( void )test_allUTIsWithNSPboardType_ConformingTo_allowDynamic
{
    
}

- ( void )test_allUTIsWithOSType
{
    
}

- ( void )test_allUTIsWithOSType_allowDynamic
{
    
}

- ( void )test_allUTIsWithOSType_ConformingTo
{
    
}

- ( void )test_allUTIsWithOSType_ConformingTo_allowDynamic
{
    
}

- ( void )test_allUTIsWithTag_tagClass_conformingTo_allowDynamic
{
    
}

- ( void )test_stringForOSType
{
    
}

- ( void )test_OSTypeForString
{
    
}

- ( void )test_initWithString
{
    
}

- ( void )test_initWithCFString
{
    
}

- ( void )test_initWithFileExtension
{
    
}

- ( void )test_initWithFileExtension_conformingTo
{
    
}

- ( void )test_initWithMIMEType
{
    
}

- ( void )test_initWithMIMEType_conformingTo
{
    
}

- ( void )test_initWithNSPboardType
{
    
}

- ( void )test_initWithNSPboardType_conformingTo
{
    
}

- ( void )test_initWithOSType
{
    
}

- ( void )test_initWithOSType_conformingTo
{
    
}

- ( void )test_initWithTag_tagClass_conformingTo
{
    
}

- ( void )test_preferredTagForTagClass
{
    UTI * uti;
    
    uti = [ UTI HTMLTypeUTI ];
    
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassFilenameExtension ], @"html" );
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassMIMEType ],          @"text/html" );
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassNSPboardType ],      @"Apple HTML pasteboard type" );
    XCTAssertEqualObjects( [ uti preferredTagForTagClass: UTITagClassOSType ],            @"HTML" );
}

- ( void )test_isEqualToUTI
{
    XCTAssertTrue(  [ [ UTI imageTypeUTI ] isEqualToUTI: [ UTI UTIWithCFString: kUTTypeImage ] ] );
    XCTAssertFalse( [ [ UTI imageTypeUTI ] isEqualToUTI: [ UTI JPEGTypeUTI ] ] );
}

- ( void )test_conformsToUTI
{
    XCTAssertTrue(  [ [ UTI JPEGTypeUTI ] conformsToUTI: [ UTI imageTypeUTI ] ] );
    XCTAssertFalse( [ [ UTI textTypeUTI ] conformsToUTI: [ UTI imageTypeUTI ] ] );
}

- ( void )test_objectForDeclarationDictionaryKey
{
    
}

- ( void )test_copy
{
    
}

- ( void )test_isEqual
{
    
}

@end
