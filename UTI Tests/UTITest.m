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

@end
