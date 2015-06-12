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

- ( void )testUTIWithString
{
    UTI * uti;
    
    uti = [ UTI UTIWithString: @"public.objective-c-source" ];
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )testUTIWithCFString
{
    UTI       * uti;
    CFStringRef s;
    
    s   = CFStringCreateWithCString( NULL, "public.objective-c-source", kCFStringEncodingASCII );
    uti = [ UTI UTIWithCFString: s ];
    
    CFRelease( s );
    
    XCTAssertNotNil( uti );
    XCTAssertEqualObjects( uti.identifier, @"public.objective-c-source" );
}

- ( void )testUTIWithFileExtension
{
    
}

- ( void )testUTIWithFileExtensionConformingTo
{
    
}

- ( void )testUTIWithMIMEType
{
    
}

- ( void )testUTIWithMIMETypeConformingTo
{
    
}

- ( void )testUTIWithNSPboardType
{
    
}

- ( void )testUTIWithNSPboardTypeConformingTo
{
    
}

- ( void )testUTIWithOSType
{
    
}

- ( void )testUTIWithOSTypeConformingTo
{
    
}

- ( void )testUTIWithTagTagClassConformingTo
{
    
}

- ( void )testAbstractTypes
{
    NSArray * types;
    
    types = [ UTI abstractTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
    }
}

- ( void )testConcreteTypes
{
    NSArray * types;
    
    types = [ UTI concreteTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
    }
}

- ( void )testTextTypes
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

- ( void )testCompositeContentTypes
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

- ( void )testImageContentTypes
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

- ( void )testAudioVisualContentTypes
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

- ( void )testDirectoryTypes
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

- ( void )testApplicationTypes
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

- ( void )testContactTypes
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

- ( void )testMiscellaneousTypes
{
    NSArray * types;
    
    types = [ UTI miscellaneousTypes ];
    
    XCTAssertGreaterThan( types.count, ( NSUInteger )0 );
    
    for( UTI * uti in types )
    {
        XCTAssertTrue( [ uti isKindOfClass: [ UTI class ] ] );
    }
}

- ( void )testItemTypeUTI
{
    XCTAssertNotNil( [ UTI itemTypeUTI ] );
}

- ( void )testContentTypeUTI
{
    XCTAssertNotNil( [ UTI contentTypeUTI ] );
}

- ( void )testCompositeContentTypeUTI
{
    XCTAssertNotNil( [ UTI compositeContentTypeUTI ] );
}

- ( void )testApplicationTypeUTI
{
    XCTAssertNotNil( [ UTI applicationTypeUTI ] );
}

- ( void )testMessageTypeUTI
{
    XCTAssertNotNil( [ UTI messageTypeUTI ] );
}

- ( void )testContactTypeUTI
{
    XCTAssertNotNil( [ UTI contactTypeUTI ] );
}

- ( void )testArchiveTypeUTI
{
    XCTAssertNotNil( [ UTI archiveTypeUTI ] );
}

- ( void )testDiskImageTypeUTI
{
    XCTAssertNotNil( [ UTI diskImageTypeUTI ] );
}

- ( void )testDataTypeUTI
{
    XCTAssertNotNil( [ UTI dataTypeUTI ] );
}

- ( void )testDirectoryTypeUTI
{
    XCTAssertNotNil( [ UTI directoryTypeUTI ] );
}

- ( void )testResolvableTypeUTI
{
    XCTAssertNotNil( [ UTI resolvableTypeUTI ] );
}

- ( void )testSymLinkTypeUTI
{
    XCTAssertNotNil( [ UTI symLinkTypeUTI ] );
}

- ( void )testMountPointTypeUTI
{
    XCTAssertNotNil( [ UTI mountPointTypeUTI ] );
}

- ( void )testAliasFileTypeUTI
{
    XCTAssertNotNil( [ UTI aliasFileTypeUTI ] );
}

- ( void )testAliasRecordTypeUTI
{
    XCTAssertNotNil( [ UTI aliasRecordTypeUTI ] );
}

- ( void )testURLTypeUTI
{
    XCTAssertNotNil( [ UTI URLTypeUTI ] );
}

- ( void )testFileURLTypeUTI
{
    XCTAssertNotNil( [ UTI fileURLTypeUTI ] );
}

- ( void )testTextTypeUTI
{
    XCTAssertNotNil( [ UTI textTypeUTI ] );
}

- ( void )testPlainTextTypeUTI
{
    XCTAssertNotNil( [ UTI plainTextTypeUTI ] );
}

- ( void )testUTF8PlainTextTypeUTI
{
    XCTAssertNotNil( [ UTI UTF8PlainTextTypeUTI ] );
}

- ( void )testUTF16ExternalPlainTextTypeUTI
{
    XCTAssertNotNil( [ UTI UTF16ExternalPlainTextTypeUTI ] );
}

- ( void )testUTF16PlainTextTypeUTI
{
    XCTAssertNotNil( [ UTI UTF16PlainTextTypeUTI ] );
}

- ( void )testRTFTypeUTI
{
    XCTAssertNotNil( [ UTI RTFTypeUTI ] );
}

- ( void )testHTMLTypeUTI
{
    XCTAssertNotNil( [ UTI HTMLTypeUTI ] );
}

- ( void )testXMLTypeUTI
{
    XCTAssertNotNil( [ UTI XMLTypeUTI ] );
}

- ( void )testSourceCodeTypeUTI
{
    XCTAssertNotNil( [ UTI sourceCodeTypeUTI ] );
}

- ( void )testCSourceTypeUTI
{
    XCTAssertNotNil( [ UTI CSourceTypeUTI ] );
}

- ( void )testObjectiveCSourceTypeUTI
{
    XCTAssertNotNil( [ UTI objectiveCSourceTypeUTI ] );
}

- ( void )testCPlusPlusSourceTypeUTI
{
    XCTAssertNotNil( [ UTI CPlusPlusSourceTypeUTI ] );
}

- ( void )testObjectiveCPlusPlusSourceTypeUTI
{
    XCTAssertNotNil( [ UTI objectiveCPlusPlusSourceTypeUTI ] );
}

- ( void )testCHeaderTypeUTI
{
    XCTAssertNotNil( [ UTI CHeaderTypeUTI ] );
}

- ( void )testCPlusPlusHeaderTypeUTI
{
    XCTAssertNotNil( [ UTI CPlusPlusHeaderTypeUTI ] );
}

- ( void )testJavaSourceTypeUTI
{
    XCTAssertNotNil( [ UTI javaSourceTypeUTI ] );
}

- ( void )testPDFTypeUTI
{
    XCTAssertNotNil( [ UTI PDFTypeUTI ] );
}

- ( void )testRTFDTypeUTI
{
    XCTAssertNotNil( [ UTI RTFDTypeUTI ] );
}

- ( void )testFlatRTFDTypeUTI
{
    XCTAssertNotNil( [ UTI flatRTFDTypeUTI ] );
}

- ( void )testTXNTextAndMultimediaDataTypeUTI
{
    XCTAssertNotNil( [ UTI TXNTextAndMultimediaDataTypeUTI ] );
}

- ( void )testWebArchiveTypeUTI
{
    XCTAssertNotNil( [ UTI webArchiveTypeUTI ] );
}

- ( void )testImageTypeUTI
{
    XCTAssertNotNil( [ UTI imageTypeUTI ] );
}

- ( void )testJPEGTypeUTI
{
    XCTAssertNotNil( [ UTI JPEGTypeUTI ] );
}

- ( void )testJPEG2000TypeUTI
{
    XCTAssertNotNil( [ UTI JPEG2000TypeUTI ] );
}

- ( void )testTIFFTypeUTI
{
    XCTAssertNotNil( [ UTI TIFFTypeUTI ] );
}

- ( void )testPICTTypeUTI
{
    XCTAssertNotNil( [ UTI PICTTypeUTI ] );
}

- ( void )testGIFTypeUTI
{
    XCTAssertNotNil( [ UTI GIFTypeUTI ] );
}

- ( void )testPNGTypeUTI
{
    XCTAssertNotNil( [ UTI PNGTypeUTI ] );
}

- ( void )testQuickTimeImageTypeUTI
{
    XCTAssertNotNil( [ UTI quickTimeImageTypeUTI ] );
}

- ( void )testAppleICNSTypeUTI
{
    XCTAssertNotNil( [ UTI appleICNSTypeUTI ] );
}

- ( void )testBMPTypeUTI
{
    XCTAssertNotNil( [ UTI BMPTypeUTI ] );
}

- ( void )testICOTypeUTI
{
    XCTAssertNotNil( [ UTI ICOTypeUTI ] );
}

- ( void )testAudiovisualContentTypeUTI
{
    XCTAssertNotNil( [ UTI audiovisualContentTypeUTI ] );
}

- ( void )testMovieTypeUTI
{
    XCTAssertNotNil( [ UTI movieTypeUTI ] );
}

- ( void )testVideoTypeUTI
{
    XCTAssertNotNil( [ UTI videoTypeUTI ] );
}

- ( void )testAudioTypeUTI
{
    XCTAssertNotNil( [ UTI audioTypeUTI ] );
}

- ( void )testQuickTimeMovieTypeUTI
{
    XCTAssertNotNil( [ UTI quickTimeMovieTypeUTI ] );
}

- ( void )testMPEGTypeUTI
{
    XCTAssertNotNil( [ UTI MPEGTypeUTI ] );
}

- ( void )testMPEG4TypeUTI
{
    XCTAssertNotNil( [ UTI MPEG4TypeUTI ] );
}

- ( void )testMP3TypeUTI
{
    XCTAssertNotNil( [ UTI MP3TypeUTI ] );
}

- ( void )testMPEG4AudioTypeUTI
{
    XCTAssertNotNil( [ UTI MPEG4AudioTypeUTI ] );
}

- ( void )testAppleProtectedMPEG4AudioTypeUTI
{
    XCTAssertNotNil( [ UTI appleProtectedMPEG4AudioTypeUTI ] );
}

- ( void )testFolderTypeUTI
{
    XCTAssertNotNil( [ UTI folderTypeUTI ] );
}

- ( void )testVolumeTypeUTI
{
    XCTAssertNotNil( [ UTI volumeTypeUTI ] );
}

- ( void )testPackageTypeUTI
{
    XCTAssertNotNil( [ UTI packageTypeUTI ] );
}

- ( void )testBundleTypeUTI
{
    XCTAssertNotNil( [ UTI bundleTypeUTI ] );
}

- ( void )testFrameworkTypeUTI
{
    XCTAssertNotNil( [ UTI frameworkTypeUTI ] );
}

- ( void )testApplicationBundleTypeUTI
{
    XCTAssertNotNil( [ UTI applicationBundleTypeUTI ] );
}

- ( void )testApplicationFileTypeUTI
{
    XCTAssertNotNil( [ UTI applicationFileTypeUTI ] );
}

- ( void )testVCardTypeUTI
{
    XCTAssertNotNil( [ UTI vCardTypeUTI ] );
}

- ( void )testInkTextTypeUTI
{
    XCTAssertNotNil( [ UTI inkTextTypeUTI ] );
}

@end
