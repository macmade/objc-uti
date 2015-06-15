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

#import "UTI.h"

#ifndef __has_feature
#define __has_feature( _x_ )    0
#endif

#if __has_feature( objc_arc )
#define UTI_ARC                 1
#else
#define UTI_ARC                 0
#endif

#if defined( __IPHONE_OS_VERSION_MIN_REQUIRED ) && __IPHONE_OS_VERSION_MIN_REQUIRED
#define UTI_IOS                 1
#else
#define UTI_IOS                 0
#endif

#if UTI_IOS
@import MobileCoreServices;
#else
@import CoreServices;
#endif

@interface UTI()

@property ( nonatomic, readwrite, retain ) NSString     * UTIValue;
@property ( nonatomic, readwrite, retain ) NSDictionary * representation;

@end

@implementation UTI

@synthesize UTIValue;
@synthesize representation;

+ ( instancetype )UTIWithString: ( NSString * )str
{
    #if UTI_ARC
    return [ self UTIWithCFString: ( __bridge CFStringRef )str ];
    #else
    return [ self UTIWithCFString: ( CFStringRef )str ];
    #endif
}

+ ( instancetype )UTIWithCFString: ( CFStringRef )str
{
    #if UTI_ARC
    return [ [ self alloc ] initWithCFString: str ];
    #else
    return [ [ [ self alloc ] initWithCFString: str ] autorelease ];
    #endif
}

+ ( instancetype )UTIWithFileExtension: ( NSString * )extension
{
    return [ self UTIWithFileExtension: extension conformingTo: nil ];
}

+ ( instancetype )UTIWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti
{
    return [ self UTIWithTag: extension tagClass: UTITagClassFilenameExtension conformingTo: uti ];
}

+ ( instancetype )UTIWithMIMEType: ( NSString * )type
{
    return [ self UTIWithMIMEType: type conformingTo: nil ];
}

+ ( instancetype )UTIWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self UTIWithTag: type tagClass: UTITagClassMIMEType conformingTo: uti ];
}

+ ( instancetype )UTIWithNSPboardType: ( NSString * )type
{
    return [ self UTIWithNSPboardType: type conformingTo: nil ];
}

+ ( instancetype )UTIWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self UTIWithTag: type tagClass: UTITagClassNSPboardType conformingTo: uti ];
}

+ ( instancetype )UTIWithOSType: ( NSString * )type
{
    return [ self UTIWithOSType: type conformingTo: nil ];
}

+ ( instancetype )UTIWithOSType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self UTIWithTag: type tagClass: UTITagClassOSType conformingTo: uti ];
}

+ ( instancetype )UTIWithTag: ( NSString * )tag tagClass: ( UTITagClass )tagClass conformingTo: ( UTI * )uti
{
    #if UTI_ARC
    return [ [ self alloc ] initWithTag: tag tagClass: tagClass conformingTo: uti ];
    #else
    return [ [ [ self alloc ] initWithTag: tag tagClass: tagClass conformingTo: uti ] autorelease ];
    #endif
}

+ ( NSArray * )abstractTypes
{
    return @[ [ self itemTypeUTI ],
              [ self contentTypeUTI ],
              [ self compositeContentTypeUTI ],
              [ self applicationTypeUTI ],
              [ self messageTypeUTI ],
              [ self contactTypeUTI ],
              [ self archiveTypeUTI ],
              [ self diskImageTypeUTI ]
    ];
}

+ ( NSArray * )concreteTypes
{
    return @[ [ self dataTypeUTI ],
              [ self directoryTypeUTI ],
              [ self resolvableTypeUTI ],
              [ self symLinkTypeUTI ],
              [ self mountPointTypeUTI ],
              [ self aliasFileTypeUTI ],
              [ self aliasRecordTypeUTI ],
              [ self URLTypeUTI ],
              [ self fileURLTypeUTI ]
    ];
}

+ ( NSArray * )textTypes
{
    return @[ [ self textTypeUTI ],
              [ self plainTextTypeUTI ],
              [ self UTF8PlainTextTypeUTI ],
              [ self UTF16ExternalPlainTextTypeUTI ],
              [ self UTF16PlainTextTypeUTI ],
              [ self RTFTypeUTI ],
              [ self HTMLTypeUTI ],
              [ self XMLTypeUTI ],
              [ self sourceCodeTypeUTI ],
              [ self CSourceTypeUTI ],
              [ self objectiveCSourceTypeUTI ],
              [ self CPlusPlusSourceTypeUTI ],
              [ self objectiveCPlusPlusSourceTypeUTI ],
              [ self CHeaderTypeUTI ],
              [ self CPlusPlusHeaderTypeUTI ],
              [ self javaSourceTypeUTI ]
    ];
}

+ ( NSArray * )compositeContentTypes
{
    return @[ [ self PDFTypeUTI ],
              [ self RTFDTypeUTI ],
              [ self flatRTFDTypeUTI ],
              [ self TXNTextAndMultimediaDataTypeUTI ],
              [ self webArchiveTypeUTI ]
    ];
}

+ ( NSArray * )imageContentTypes
{
    return @[ [ self imageTypeUTI ],
              [ self JPEGTypeUTI ],
              [ self JPEG2000TypeUTI ],
              [ self TIFFTypeUTI ],
              [ self PICTTypeUTI ],
              [ self GIFTypeUTI ],
              [ self PNGTypeUTI ],
              [ self quickTimeImageTypeUTI ],
              [ self appleICNSTypeUTI ],
              [ self BMPTypeUTI ],
              [ self ICOTypeUTI ]
    ];
}

+ ( NSArray * )audioVisualContentTypes
{
    return @[ [ self audiovisualContentTypeUTI ],
              [ self movieTypeUTI ],
              [ self videoTypeUTI ],
              [ self audioTypeUTI ],
              [ self quickTimeMovieTypeUTI ],
              [ self MPEGTypeUTI ],
              [ self MPEG4TypeUTI ],
              [ self MP3TypeUTI ],
              [ self MPEG4AudioTypeUTI ],
              [ self appleProtectedMPEG4AudioTypeUTI ]
    ];
}

+ ( NSArray * )directoryTypes
{
    return @[ [ self folderTypeUTI ],
              [ self volumeTypeUTI ],
              [ self packageTypeUTI ],
              [ self bundleTypeUTI ],
              [ self frameworkTypeUTI ]
    ];
}

+ ( NSArray * )applicationTypes
{
    return @[ [ self applicationBundleTypeUTI ],
              [ self applicationFileTypeUTI ]
    ];
}

+ ( NSArray * )contactTypes
{
    return @[ [ self vCardTypeUTI ] ];
}

+ ( NSArray * )miscellaneousTypes
{
    return @[ [ self inkTextTypeUTI ] ];
}

+ ( instancetype )itemTypeUTI
{
    return [ self UTIWithCFString: kUTTypeItem ];
}

+ ( instancetype )contentTypeUTI
{
    return [ self UTIWithCFString: kUTTypeContent ];
}

+ ( instancetype )compositeContentTypeUTI
{
    return [ self UTIWithCFString: kUTTypeCompositeContent ];
}

+ ( instancetype )applicationTypeUTI
{
    return [ self UTIWithCFString: kUTTypeApplication ];
}

+ ( instancetype )messageTypeUTI
{
    return [ self UTIWithCFString: kUTTypeMessage ];
}

+ ( instancetype )contactTypeUTI
{
    return [ self UTIWithCFString: kUTTypeContact ];
}

+ ( instancetype )archiveTypeUTI
{
    return [ self UTIWithCFString: kUTTypeArchive ];
}

+ ( instancetype )diskImageTypeUTI
{
    return [ self UTIWithCFString: kUTTypeDiskImage ];
}

+ ( instancetype )dataTypeUTI
{
    return [ self UTIWithCFString: kUTTypeData ];
}

+ ( instancetype )directoryTypeUTI
{
    return [ self UTIWithCFString: kUTTypeDirectory ];
}

+ ( instancetype )resolvableTypeUTI
{
    return [ self UTIWithCFString: kUTTypeResolvable ];
}

+ ( instancetype )symLinkTypeUTI
{
    return [ self UTIWithCFString: kUTTypeSymLink ];
}

+ ( instancetype )mountPointTypeUTI
{
    return [ self UTIWithCFString: kUTTypeMountPoint ];
}

+ ( instancetype )aliasFileTypeUTI
{
    return [ self UTIWithCFString: kUTTypeAliasFile ];
}

+ ( instancetype )aliasRecordTypeUTI
{
    return [ self UTIWithCFString: kUTTypeAliasRecord ];
}

+ ( instancetype )URLTypeUTI
{
    return [ self UTIWithCFString: kUTTypeURL ];
}

+ ( instancetype )fileURLTypeUTI
{
    return [ self UTIWithCFString: kUTTypeFileURL ];
}

+ ( instancetype )textTypeUTI
{
    return [ self UTIWithCFString: kUTTypeText ];
}

+ ( instancetype )plainTextTypeUTI
{
    return [ self UTIWithCFString: kUTTypePlainText ];
}

+ ( instancetype )UTF8PlainTextTypeUTI
{
    return [ self UTIWithCFString: kUTTypeUTF8PlainText ];
}

+ ( instancetype )UTF16ExternalPlainTextTypeUTI
{
    return [ self UTIWithCFString: kUTTypeUTF16ExternalPlainText ];
}

+ ( instancetype )UTF16PlainTextTypeUTI
{
    return [ self UTIWithCFString: kUTTypeUTF16PlainText ];
}

+ ( instancetype )RTFTypeUTI
{
    return [ self UTIWithCFString: kUTTypeRTF ];
}

+ ( instancetype )HTMLTypeUTI
{
    return [ self UTIWithCFString: kUTTypeHTML ];
}

+ ( instancetype )XMLTypeUTI
{
    return [ self UTIWithCFString: kUTTypeXML ];
}

+ ( instancetype )sourceCodeTypeUTI
{
    return [ self UTIWithCFString: kUTTypeSourceCode ];
}

+ ( instancetype )CSourceTypeUTI
{
    return [ self UTIWithCFString: kUTTypeCSource ];
}

+ ( instancetype )objectiveCSourceTypeUTI
{
    return [ self UTIWithCFString: kUTTypeObjectiveCSource ];
}

+ ( instancetype )CPlusPlusSourceTypeUTI
{
    return [ self UTIWithCFString: kUTTypeCPlusPlusSource ];
}

+ ( instancetype )objectiveCPlusPlusSourceTypeUTI
{
    return [ self UTIWithCFString: kUTTypeObjectiveCPlusPlusSource ];
}

+ ( instancetype )CHeaderTypeUTI
{
    return [ self UTIWithCFString: kUTTypeCHeader ];
}

+ ( instancetype )CPlusPlusHeaderTypeUTI
{
    return [ self UTIWithCFString: kUTTypeCPlusPlusHeader ];
}

+ ( instancetype )javaSourceTypeUTI
{
    return [ self UTIWithCFString: kUTTypeJavaSource ];
}

+ ( instancetype )PDFTypeUTI
{
    return [ self UTIWithCFString: kUTTypePDF ];
}

+ ( instancetype )RTFDTypeUTI
{
    return [ self UTIWithCFString: kUTTypeRTFD ];
}

+ ( instancetype )flatRTFDTypeUTI
{
    return [ self UTIWithCFString: kUTTypeFlatRTFD ];
}

+ ( instancetype )TXNTextAndMultimediaDataTypeUTI
{
    return [ self UTIWithCFString: kUTTypeTXNTextAndMultimediaData ];
}

+ ( instancetype )webArchiveTypeUTI
{
    return [ self UTIWithCFString: kUTTypeWebArchive ];
}

+ ( instancetype )imageTypeUTI
{
    return [ self UTIWithCFString: kUTTypeImage ];
}

+ ( instancetype )JPEGTypeUTI
{
    return [ self UTIWithCFString: kUTTypeJPEG ];
}

+ ( instancetype )JPEG2000TypeUTI
{
    return [ self UTIWithCFString: kUTTypeJPEG2000 ];
}

+ ( instancetype )TIFFTypeUTI
{
    return [ self UTIWithCFString: kUTTypeTIFF ];
}

+ ( instancetype )PICTTypeUTI
{
    return [ self UTIWithCFString: kUTTypePICT ];
}

+ ( instancetype )GIFTypeUTI
{
    return [ self UTIWithCFString: kUTTypeGIF ];
}

+ ( instancetype )PNGTypeUTI
{
    return [ self UTIWithCFString: kUTTypePNG ];
}

+ ( instancetype )quickTimeImageTypeUTI
{
    return [ self UTIWithCFString: kUTTypeQuickTimeImage ];
}

+ ( instancetype )appleICNSTypeUTI
{
    return [ self UTIWithCFString: kUTTypeAppleICNS ];
}

+ ( instancetype )BMPTypeUTI
{
    return [ self UTIWithCFString: kUTTypeBMP ];
}

+ ( instancetype )ICOTypeUTI
{
    return [ self UTIWithCFString: kUTTypeICO ];
}

+ ( instancetype )audiovisualContentTypeUTI
{
    return [ self UTIWithCFString: kUTTypeAudiovisualContent ];
}

+ ( instancetype )movieTypeUTI
{
    return [ self UTIWithCFString: kUTTypeMovie ];
}

+ ( instancetype )videoTypeUTI
{
    return [ self UTIWithCFString: kUTTypeVideo ];
}

+ ( instancetype )audioTypeUTI
{
    return [ self UTIWithCFString: kUTTypeAudio ];
}

+ ( instancetype )quickTimeMovieTypeUTI
{
    return [ self UTIWithCFString: kUTTypeQuickTimeMovie ];
}

+ ( instancetype )MPEGTypeUTI
{
    return [ self UTIWithCFString: kUTTypeMPEG ];
}

+ ( instancetype )MPEG4TypeUTI
{
    return [ self UTIWithCFString: kUTTypeMPEG4 ];
}

+ ( instancetype )MP3TypeUTI
{
    return [ self UTIWithCFString: kUTTypeMP3 ];
}

+ ( instancetype )MPEG4AudioTypeUTI
{
    return [ self UTIWithCFString: kUTTypeMPEG4Audio ];
}

+ ( instancetype )appleProtectedMPEG4AudioTypeUTI
{
    return [ self UTIWithCFString: kUTTypeAppleProtectedMPEG4Audio ];
}

+ ( instancetype )folderTypeUTI
{
    return [ self UTIWithCFString: kUTTypeFolder ];
}

+ ( instancetype )volumeTypeUTI
{
    return [ self UTIWithCFString: kUTTypeVolume ];
}

+ ( instancetype )packageTypeUTI
{
    return [ self UTIWithCFString: kUTTypePackage ];
}

+ ( instancetype )bundleTypeUTI
{
    return [ self UTIWithCFString: kUTTypeBundle ];
}

+ ( instancetype )frameworkTypeUTI
{
    return [ self UTIWithCFString: kUTTypeFramework ];
}

+ ( instancetype )applicationBundleTypeUTI
{
    return [ self UTIWithCFString: kUTTypeApplicationBundle ];
}

+ ( instancetype )applicationFileTypeUTI
{
    return [ self UTIWithCFString: kUTTypeApplicationFile ];
}

+ ( instancetype )vCardTypeUTI
{
    return [ self UTIWithCFString: kUTTypeVCard ];
}

+ ( instancetype )inkTextTypeUTI
{
    return [ self UTIWithCFString: kUTTypeInkText ];
}

+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension
{
    return [ self allUTIsWithFileExtension: extension allowDynamic: NO ];
}

+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithFileExtension: extension conformingTo: nil allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti
{
    return [ self allUTIsWithFileExtension: extension conformingTo: uti allowDynamic: NO ];
}

+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithTag: extension tagClass: UTITagClassFilenameExtension conformingTo: uti allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type
{
    return [ self allUTIsWithMIMEType: type allowDynamic: NO ];
}

+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithMIMEType: type conformingTo: nil allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self allUTIsWithMIMEType: type conformingTo: uti allowDynamic: NO ];
}

+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithTag: type tagClass: UTITagClassMIMEType conformingTo: uti allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type
{
    return [ self allUTIsWithNSPboardType: type allowDynamic: NO];
}

+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithNSPboardType: type conformingTo: nil allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self allUTIsWithNSPboardType: type conformingTo: uti allowDynamic: NO ];
}

+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithTag: type tagClass: UTITagClassNSPboardType conformingTo: uti allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithOSType: ( NSString * )type
{
    return [ self allUTIsWithOSType: type allowDynamic: NO ];
}

+ ( NSArray * )allUTIsWithOSType: ( NSString * )type allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithOSType: type conformingTo: nil allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithOSType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self allUTIsWithOSType: type conformingTo: uti allowDynamic: NO ];
}

+ ( NSArray * )allUTIsWithOSType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn
{
    return [ self allUTIsWithTag: type tagClass: UTITagClassOSType conformingTo: uti allowDynamic: dyn ];
}

+ ( NSArray * )allUTIsWithTag: ( NSString * )tag tagClass: ( UTITagClass )tagClass conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn
{
    CFStringRef      cfTagClass;
    NSArray        * cfUTIs;
    NSString       * str;
    NSMutableArray * utis;
    UTI            * obj;
    
    switch( tagClass )
    {
        case UTITagClassFilenameExtension:  cfTagClass = kUTTagClassFilenameExtension; break;
        case UTITagClassMIMEType:           cfTagClass = kUTTagClassMIMEType;          break;
        case UTITagClassNSPboardType:       cfTagClass = kUTTagClassNSPboardType;      break;
        case UTITagClassOSType:             cfTagClass = kUTTagClassOSType;            break;
    }
    
    #if UTI_ARC
    cfUTIs = ( __bridge_transfer NSArray * )UTTypeCreateAllIdentifiersForTag( cfTagClass, ( __bridge CFStringRef )tag, ( __bridge CFStringRef )( uti.UTIValue ) );
    #else
    cfUTIs = [ ( NSArray * )UTTypeCreateAllIdentifiersForTag( cfTagClass, ( CFStringRef )tag, ( CFStringRef )( uti.UTIValue ) ) autorelease ];
    #endif
    
    utis = [ NSMutableArray arrayWithCapacity: cfUTIs.count ];
    
    for( str in cfUTIs )
    {
        obj = [ UTI UTIWithString: str ];
        
        if( dyn == NO && obj.isDynamic )
        {
            continue;
        }
        
        if( obj != nil )
        {
            [ utis addObject: obj ];
        }
    }
    
    return [ NSArray arrayWithArray: utis ];
}

+ ( NSString * )stringForOSType: ( OSType )type
{
    #if UTI_IOS
    
    ( void )type;
    
    return nil;
    
    #elif UTI_ARC
    
    return ( __bridge_transfer NSString * )UTCreateStringForOSType( type );
    
    #else
    
    return [ ( NSString * )UTCreateStringForOSType( type ) autorelease ];
    
    #endif
}

+ ( OSType )OSTypeForString: ( NSString * )str
{
    if( str == nil )
    {
        return 0;
    }
    
    #if UTI_IOS
    
    ( void )str;
    
    return 0;
    
    #elif UTI_ARC
    
    return UTGetOSTypeFromString( ( __bridge CFStringRef )str ) ;
    
    #else
    
    return UTGetOSTypeFromString( ( CFStringRef )str ) ;
    
    #endif
}

- ( instancetype )init
{
    return [ self initWithString: nil ];
}

- ( instancetype )initWithString: ( NSString * )str
{
    return [ self initWithCFString: ( __bridge CFStringRef )str ];
}

- ( instancetype )initWithCFString: ( CFStringRef )str /* NS_DESIGNATED_INITIALIZER */
{
    if( ( self = [ super init ] ) )
    {
        #if UTI_ARC
        self.UTIValue = ( __bridge NSString * )str;
        #else
        self.UTIValue = ( NSString * )str;
        #endif
    }
    
    return self;
}

- ( instancetype )initWithFileExtension: ( NSString * )extension
{
    return [ self initWithFileExtension: extension conformingTo: nil ];
}

- ( instancetype )initWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti
{
    return [ self initWithTag: extension tagClass: UTITagClassFilenameExtension conformingTo: uti ];
}

- ( instancetype )initWithMIMEType: ( NSString * )type
{
    return [ self initWithMIMEType: type conformingTo: nil ];
}

- ( instancetype )initWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self initWithTag: type tagClass: UTITagClassMIMEType conformingTo: uti ];
}

- ( instancetype )initWithNSPboardType: ( NSString * )type
{
    return [ self initWithNSPboardType: type conformingTo: nil ];
}

- ( instancetype )initWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self initWithTag: type tagClass: UTITagClassNSPboardType conformingTo: uti ];
}

- ( instancetype )initWithOSType: ( NSString * )type
{
    return [ self initWithOSType: type conformingTo: nil ];
}

- ( instancetype )initWithOSType: ( NSString * )type conformingTo: ( UTI * )uti
{
    return [ self initWithTag: type tagClass: UTITagClassOSType conformingTo: uti ];
}

- ( instancetype )initWithTag: ( NSString * )tag tagClass: ( UTITagClass )tagClass conformingTo: ( UTI * )uti /* NS_DESIGNATED_INITIALIZER */
{
    CFStringRef utiValue;
    CFStringRef cfTagClass;
    
    switch( tagClass )
    {
        case UTITagClassFilenameExtension:  cfTagClass = kUTTagClassFilenameExtension;  break;
        case UTITagClassMIMEType:           cfTagClass = kUTTagClassMIMEType;           break;
        
        #if UTI_IOS
        
        #if UTI_ARC
        
        case UTITagClassNSPboardType:       return nil;
        case UTITagClassOSType:             return nil;
        
        #else
        
        case UTITagClassNSPboardType:       [ self release ]; return nil;
        case UTITagClassOSType:             [ self release ]; return nil;
        
        #endif
        
        #else
        
        case UTITagClassNSPboardType:       cfTagClass = kUTTagClassNSPboardType;       break;
        case UTITagClassOSType:             cfTagClass = kUTTagClassOSType;             break;
        
        #endif
    }
    
    #if UTI_ARC
    utiValue = UTTypeCreatePreferredIdentifierForTag( ( __bridge CFStringRef )tag, cfTagClass, ( __bridge CFStringRef )( uti.UTIValue ) );
    #else
    utiValue = UTTypeCreatePreferredIdentifierForTag( ( CFStringRef )tag, ( CFStringRef )cfTagClass, ( CFStringRef )( uti.UTIValue ) );
    #endif
    
    if( utiValue == NULL )
    {
        #if UTI_ARC == 0
        [ self release ];
        #endif
        
        return nil;
    }
    
    if( ( self = [ super init ] ) )
    {
        #if UTI_ARC
        self.UTIValue = ( __bridge NSString * )utiValue;
        #else
        self.UTIValue = ( NSString * )utiValue;
        #endif
    }
    
    CFRelease( utiValue );
    
    return self;
}

- ( void )dealloc
{
    self.UTIValue       = nil;
    self.representation = nil;
    
    #if UTI_ARC == 0
    [ super dealloc ];
    #endif
}

- ( id )copyWithZone: ( NSZone * )zone
{
    return [ [ [ self class ] allocWithZone: zone ] initWithString: self.UTIValue ];
}

- ( NSString * )preferredTagForTagClass: ( UTITagClass )tagClass
{
    CFStringRef cfTagClass;
    
    if( self.UTIValue == nil )
    {
        return nil;
    }
    
    switch( tagClass )
    {
        case UTITagClassFilenameExtension:  cfTagClass = kUTTagClassFilenameExtension;  break;
        case UTITagClassMIMEType:           cfTagClass = kUTTagClassMIMEType;           break;
        
        #if UTI_IOS
        
        case UTITagClassNSPboardType:       return nil;
        case UTITagClassOSType:             return nil;
        
        #else
        
        case UTITagClassNSPboardType:       cfTagClass = kUTTagClassNSPboardType;       break;
        case UTITagClassOSType:             cfTagClass = kUTTagClassOSType;             break;
        
        #endif
    }
    
    #if UTI_ARC
    return ( __bridge_transfer NSString * )UTTypeCopyPreferredTagWithClass( ( __bridge CFStringRef )( self.UTIValue ), cfTagClass );
    #else
    return [ ( NSString * )UTTypeCopyPreferredTagWithClass( ( CFStringRef )( self.UTIValue ), cfTagClass ) autorelease ];
    #endif
}

- ( NSUInteger )hash
{
    return [ self.UTIValue hash ];
}

- ( BOOL )isEqual: ( id )object
{
    if( self == object )
    {
        return YES;
    }
    
    if( [ object isKindOfClass: [ UTI class ] ] == NO )
    {
        return NO;
    }
    
    return [ self isEqualToUTI: ( UTI * )object ];
}

- ( BOOL )isEqualToUTI: ( UTI * )uti
{
    if( uti == nil )
    {
        return NO;
    }
    
    return [ self.UTIValue isEqualToString: uti.UTIValue ];
}

- ( BOOL )conformsToUTI: ( UTI * )uti
{
    if( self.UTIValue == nil || uti.UTIValue == nil )
    {
        return NO;
    }
    
    #if UTI_ARC
    return ( UTTypeConformsTo( ( __bridge CFStringRef )( self.UTIValue ), ( __bridge CFStringRef )( uti.UTIValue ) ) ) ? YES : NO;
    #else
    return ( UTTypeConformsTo( ( CFStringRef )( self.UTIValue ), ( CFStringRef )( uti.UTIValue ) ) ) ? YES : NO;
    #endif
}

- ( id )objectForDeclarationDictionaryKey: ( UTIDeclarationDictionaryKey )key
{
    NSDictionary * dic;
    CFStringRef    cfKey;
    
    if( self.UTIValue == nil )
    {
        return nil;
    }
    
    dic = self.declaration;
    
    switch( key )
    {
        case UTIDeclarationDictionaryKeyExportedType:       cfKey = kUTExportedTypeDeclarationsKey; break;
        case UTIDeclarationDictionaryKeyImportedType:       cfKey = kUTImportedTypeDeclarationsKey; break;
        case UTIDeclarationDictionaryKeyIdentifier:         cfKey = kUTTypeIdentifierKey;           break;
        case UTIDeclarationDictionaryKeyTagSpecification:   cfKey = kUTTypeTagSpecificationKey;     break;
        case UTIDeclarationDictionaryKeyConformsTo:         cfKey = kUTTypeConformsToKey;           break;
        case UTIDeclarationDictionaryKeyDescription:        cfKey = kUTTypeDescriptionKey;          break;
        case UTIDeclarationDictionaryKeyIconFile:           cfKey = kUTTypeIconFileKey;             break;
        case UTIDeclarationDictionaryKeyReferenceURL:       cfKey = kUTTypeReferenceURLKey;         break;
        case UTIDeclarationDictionaryKeyVersion:            cfKey = kUTTypeVersionKey;              break;
    }
    
    #if UTI_ARC
    return [ dic objectForKey: ( __bridge NSString * )cfKey ];
    #else
    return [ dic objectForKey: ( NSString * )cfKey ];
    #endif
}

- ( BOOL )isDynamic
{
    return [ self.UTIValue hasPrefix: @"dyn." ];
}

- ( NSString * )preferredFilenameExtension
{
    return [ self preferredTagForTagClass: UTITagClassFilenameExtension ];
}

- ( NSString * )preferredMIMEType
{
    return [ self preferredTagForTagClass: UTITagClassMIMEType ];
}

- ( NSString * )preferredNSPboardType
{
    return [ self preferredTagForTagClass: UTITagClassNSPboardType ];
}

- ( NSString * )preferredOSType
{
    return [ self preferredTagForTagClass: UTITagClassOSType ];
}

- ( NSString * )description
{
    if( self.UTIValue == nil )
    {
        return nil;
    }
    
    #if UTI_ARC
    return ( __bridge_transfer NSString * )UTTypeCopyDescription( ( __bridge CFStringRef )( self.UTIValue ) );
    #else
    return [ ( NSString * )UTTypeCopyDescription( ( CFStringRef )( self.UTIValue ) ) autorelease ];
    #endif
}

- ( NSDictionary * )declaration
{
    if( self.UTIValue == nil )
    {
        return nil;
    }
    
    @synchronized( self )
    {
        if( self.representation == nil )
        {
            #if UTI_ARC
            self.representation = ( __bridge_transfer NSDictionary * )UTTypeCopyDeclaration( ( __bridge CFStringRef )( self.UTIValue ) );
            #else
            self.representation = [ ( NSDictionary * )UTTypeCopyDeclaration( ( CFStringRef )( self.UTIValue ) ) autorelease ];
            #endif
        }
    }
    
    return self.representation;
}

- ( NSURL * )declaringBundleURL
{
    if( self.UTIValue == nil )
    {
        return nil;
    }
    
    #if UTI_ARC
    return ( __bridge_transfer NSURL * )UTTypeCopyDeclaringBundleURL( ( __bridge CFStringRef )( self.UTIValue ) );
    #else
    return [ ( NSURL * )UTTypeCopyDeclaringBundleURL( ( CFStringRef )( self.UTIValue ) ) autorelease ];
    #endif
}

- ( NSArray * )exportedTypes
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyExportedType ];
}

- ( NSArray * )importedTypes
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyImportedType ];
}

- ( NSString * )identifier
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyIdentifier ];
}

- ( NSDictionary * )tagSpecifications
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyTagSpecification ];
}

- ( NSArray * )conformsTo
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyConformsTo ];
}

- ( NSString * )iconFile
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyIconFile ];
}

- ( NSURL * )referenceURL
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyReferenceURL ];
}

- ( NSString * )version
{
    return [ self objectForDeclarationDictionaryKey: UTIDeclarationDictionaryKeyVersion ];
}

@end
