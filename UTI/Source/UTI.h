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
 * @header      UTI.h
 * @copyright   (c) 2014 - Jean-David Gadina - www.xs-labs.com
 * @abstract    Objective-C wrapper class for Uniform Type Identifiers (UTIs)
 */

#ifdef UTI_DONT_USE_MODULES
#import <Foundation/Foundation.h>
#else
@import Foundation;
#endif

/*!
 * @define      NS_DESIGNATED_INITIALIZER
 * @abstract    Marks a designated initializer of an Objective-C class.
 * @discussion  This macro is defined if not available, in order to support
 *              old compilers.
 */
#ifndef NS_DESIGNATED_INITIALIZER
#define NS_DESIGNATED_INITIALIZER
#endif

/*!
 * @typedef     UTITagClass
 * @abstract    The tagging classification schemes that a uniform type identifier can be converted to and from.
 * @discussion  The 'UTITagClassNSPboardType' and 'UTITagClassOSType' values
 *              are only available for OS X targets. Using them on iOS
 *              platforms will always return a nil value.
 */
typedef enum
{
    UTITagClassFilenameExtension    = 0x00, /*! Indicates that the tag is a filename extension. */
    UTITagClassMIMEType             = 0x01, /*! Indicates that the tag is a MIME type. */
    UTITagClassNSPboardType         = 0x02, /*! Indicates that the tag is an NSPasteBoard type. */
    UTITagClassOSType               = 0x03  /*! Indicates that the tag is an OSType. */
}
UTITagClass;

/*!
 * @typedef     UTIDeclarationDictionaryKey
 * @abstract    The known keys for values found in a UTI dictionary.
 */
typedef enum
{
    UTIDeclarationDictionaryKeyIdentifier       = 0x00, /*! The uniform type identifier for the declared type. This key is required. */
    UTIDeclarationDictionaryKeyTagSpecification = 0x01, /*! A dictionary containing conversions of the uniform type identifier to equivalent tags in other classification schemes. */
    UTIDeclarationDictionaryKeyConformsTo       = 0x02, /*! The UTIs to which this identifier conforms. */
    UTIDeclarationDictionaryKeyDescription      = 0x03, /*! A user-visible description of this type (may be localized). */
    UTIDeclarationDictionaryKeyIconFile         = 0x04, /*! The name of the bundle icon resource to associate with this UTI. */
    UTIDeclarationDictionaryKeyReferenceURL     = 0x05, /*! The URL of a reference document describing this type. */
    UTIDeclarationDictionaryKeyVersion          = 0x06  /*! A version string. */
}
UTIDeclarationDictionaryKey;

/*!
 * @class       UTI
 * @abstract    Objective-C wrapper class for UTI functions
 * @discussion  Uniform Type Identifiers (or UTIs) are strings which uniquely
 *              identify abstract types. They can be used to describe a file
 *              format or an in-memory data type, but can also be used to
 *              describe the type of other sorts of entities, such as
 *              directories, volumes, or packages.
 */
@interface UTI: NSObject < NSCopying >

/*!
 * @property    isDynamic
 * @abstract    Whether the UTI is dynamic or not
 */
@property( nonatomic, readonly ) BOOL isDynamic;

/*!
 * @property    preferredFilenameExtension
 * @abstract    Returns the preferred filename extension for an UTI.
 */
@property( nonatomic, readonly ) NSString * preferredFilenameExtension;

/*!
 * @property    preferredMIMEType
 * @abstract    Returns the preferred mime-type for an UTI.
 */
@property( nonatomic, readonly ) NSString * preferredMIMEType;

/*!
 * @property    preferredNSPboardType
 * @abstract    Returns the preferred NSPasteboardType for an UTI.
 */
@property( nonatomic, readonly ) NSString * preferredNSPboardType;

/*!
 * @property    preferredOSType
 * @abstract    Returns the preferred OSType for an UTI.
 * @see         OSTypeForString
 */
@property( nonatomic, readonly ) NSString * preferredOSType;

/*!
 * @property    description
 * @abstract    Returns the localized, user-readable type description string associated with a uniform type identifier.
 * @discussion  The localized string that describes the uniform type is found in the type’s declaration.
 */
@property( nonatomic, readonly ) NSString * description;

/*!
 * @property    declaration
 * @abstract    Returns a uniform type’s declaration.
 * @discussion  A uniform type identifier is declared in a bundle’s information
 *              property list (info.plist). This method extracts and returns
 *              a dictionary that contains the complete declaration of the
 *              uniform type identifier. This is useful when your application
 *              needs to access properties that does not have a built-in
 *              accessor method.
 */
@property( nonatomic, readonly ) NSDictionary * declaration;

/*!
 * @property    declaringBundleURL
 * @abstract    Returns the location of a bundle containing the declaration for a type.
 */
@property( nonatomic, readonly ) NSURL * declaringBundleURL;

/*!
 * @property    identifier
 * @abstract    Returns the uniform type identifier for the declared type.
 */
@property( nonatomic, readonly ) NSString * identifier;

/*!
 * @property    tagSpecifications
 * @abstract    Returns a dictionary containing conversions of the uniform type identifier to equivalent tags in other classification schemes.
 */
@property( nonatomic, readonly ) NSDictionary * tagSpecifications;

/*!
 * @property    conformsTo
 * @abstract    Returns the UTIs to which this identifier conforms.
 */
@property( nonatomic, readonly ) NSArray * conformsTo;

/*!
 * @property    referenceURL
 * @abstract    Returns the URL of a reference document describing this type.
 */
@property( nonatomic, readonly ) NSURL * referenceURL;

/*!
 * @property    version
 * @abstract    Returns a version string.
 */
@property( nonatomic, readonly ) NSString * version;

/*!
 * @method      initWithString:
 * @abstract    Gets an UTI object with a string.
 * @param       str         The UTI identifier, as a string.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithString: ( NSString * )str;

/*!
 * @method      initWithCFString:
 * @abstract    Gets an UTI object with a CoreFoundation string.
 * @param       str         The UTI identifier, as a CoreFoundation string.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithCFString: ( CFStringRef )str;

/*!
 * @method      initWithFileExtension:
 * @abstract    Gets an UTI object with a file extension.
 * @param       extension   The file extension.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithFileExtension: ( NSString * )extension;

/*!
 * @method      initWithFileExtension:
 * @abstract    Gets an UTI object with a file extension.
 * @param       extension   The file extension.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithFileExtension: ( NSString * )extension allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithFileExtension:conformingTo:
 * @abstract    Gets an UTI object with a file extension.
 * @param       extension   The file extension.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti;

/*!
 * @method      initWithFileExtension:conformingTo:
 * @abstract    Gets an UTI object with a file extension.
 * @param       extension   The file extension.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithMIMEType:
 * @abstract    Gets an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithMIMEType: ( NSString * )type;

/*!
 * @method      initWithMIMEType:
 * @abstract    Gets an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithMIMEType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithMIMEType:conformingTo:
 * @abstract    Gets an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      initWithMIMEType:conformingTo:
 * @abstract    Gets an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithNSPboardType
 * @abstract    Gets an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithNSPboardType: ( NSString * )type;

/*!
 * @method      initWithNSPboardType
 * @abstract    Gets an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithNSPboardType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithNSPboardType:conformingTo:
 * @abstract    Gets an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      initWithNSPboardType:conformingTo:
 * @abstract    Gets an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
+ ( instancetype )UTIWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithOSType:
 * @abstract    Gets an UTI object with an OSType.
 * @param       type        The OSType.
 * @return      An UTI object.
 * @see         stringForOSType
 */
+ ( instancetype )UTIWithOSType: ( NSString * )type;

/*!
 * @method      initWithOSType:
 * @abstract    Gets an UTI object with an OSType.
 * @param       type        The OSType.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 * @see         stringForOSType
 */
+ ( instancetype )UTIWithOSType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithOSType:conformingTo:
 * @abstract    Gets an UTI object with an OSType.
 * @param       type        The OSType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 * @see         stringForOSType
 */
+ ( instancetype )UTIWithOSType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      initWithOSType:conformingTo:
 * @abstract    Gets an UTI object with an OSType.
 * @param       type        The OSType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 * @see         stringForOSType
 */
+ ( instancetype )UTIWithOSType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithTag:tagClass:conformingTo:
 * @abstract    Gets a uniform type identifier for the type indicated by the specified tag.
 * @param       tag         The tag to translate into a uniform type identifier.
 * @param       tagClass    The class of the tag parameter.
 * @param       uti         If not nil, the returned uniform type identifier must conform to this parameter.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object
 * @discussion  This method is used to translate a type declared using another
 *              declaration mechanism (for example, MIME types) into a uniform
 *              type identifier. This method searches all UTI declarations for
 *              a matching translation. If a conforming parameter is assigned,
 *              the search is reduced to the subset of type identifiers that
 *              conform to that type.
 * @see         UTITagClass
 */
+ ( instancetype )UTIWithTag: ( NSString * )tag tagClass: ( UTITagClass )tagClass conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      abstractTypes
 * @abstract    Gets the known uniform type identifiers that most other type identifiers are derived from.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )abstractTypes;

/*!
 * @method      concreteTypes
 * @abstract    Gets the known uniform type identifiers for concrete types.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )concreteTypes;

/*!
 * @method      textTypes
 * @abstract    Gets the known uniform type identifiers for text content.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )textTypes;

/*!
 * @method      compositeContentTypes
 * @abstract    Gets the known uniform type identifiers for content that includes multiple data types.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )compositeContentTypes;

/*!
 * @method      imageContentTypes
 * @abstract    Gets the known uniform type identifiers for graphics content.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )imageContentTypes;

/*!
 * @method      audioVisualContentTypes
 * @abstract    Gets the known uniform type identifier for audio and video content.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )audioVisualContentTypes;

/*!
 * @method      directoryTypes
 * @abstract    Gets the known uniform type identifiers for different directory types.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )directoryTypes;

/*!
 * @method      applicationTypes
 * @abstract    Gets the known uniform type identifiers for application types.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )applicationTypes;

/*!
 * @method      contactTypes
 * @abstract    Gets the known uniform type identifiers for contact types.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )contactTypes;

/*!
 * @method      miscellaneousTypes
 * @abstract    Gets the known uniform type identifiers for types that do not fit in other categories.
 * @return      An array with the corresponding UTIs.
 */
+ ( NSArray * )miscellaneousTypes;

/*!
 * @method      itemTypeUTI
 * @abstract    Gets an UTI object for the 'public.item' UTI.
 * @return      An UTI object.
 * @discussion  The generic abstract type identifier for most things (files, directories).
 */
+ ( instancetype )itemTypeUTI;

/*!
 * @method      contentTypeUTI
 * @abstract    Gets an UTI object for the 'public.content' UTI.
 * @return      An UTI object.
 * @discussion  The abstract type identifier for anything containing user-viewable document content (documents, pasteboard data, and document packages).
 */
+ ( instancetype )contentTypeUTI;

/*!
 * @method      compositeContentTypeUTI
 * @abstract    Gets an UTI object for the 'public.composite-content' UTI.
 * @return      An UTI object.
 * @discussion  The abstract type identifier for content formats supporting mixed embedded content (i.e., compound documents).
 */
+ ( instancetype )compositeContentTypeUTI;

/*!
 * @method      applicationTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.application' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Mac apps.
 */
+ ( instancetype )applicationTypeUTI;

/*!
 * @method      messageTypeUTI
 * @abstract    Gets an UTI object for the 'public.message' UTI.
 * @return      An UTI object.
 * @discussion  The abstract type identifier for messages (email, instant message, etc.).
 */
+ ( instancetype )messageTypeUTI;

/*!
 * @method      contactTypeUTI
 * @abstract    Gets an UTI object for the 'public.contact' UTI.
 * @return      An UTI object.
 * @discussion  The abstract type identifier for contact information( for example, a person, group, or organization).
 */
+ ( instancetype )contactTypeUTI;

/*!
 * @method      archiveTypeUTI
 * @abstract    Gets an UTI object for the 'public.archive' UTI.
 * @return      An UTI object.
 * @discussion  The abstract type identifier for an archive of files and directories.
 */
+ ( instancetype )archiveTypeUTI;

/*!
 * @method      diskImageTypeUTI
 * @abstract    Gets an UTI object for the 'public.disk-image' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a data item mountable as a volume.
 */
+ ( instancetype )diskImageTypeUTI;

/*!
 * @method      dataTypeUTI
 * @abstract    Gets an UTI object for the 'public.data' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for any sort of simple byte stream, including files and in-memory data.
 */
+ ( instancetype )dataTypeUTI;

/*!
 * @method      directoryTypeUTI
 * @abstract    Gets an UTI object for the 'public.directory' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a file system directory, including packages and folders.
 */
+ ( instancetype )directoryTypeUTI;

/*!
 * @method      resolvableTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.resolvable' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for symbolic links and alias files.
 */
+ ( instancetype )resolvableTypeUTI;

/*!
 * @method      symLinkTypeUTI
 * @abstract    Gets an UTI object for the 'public.symlink' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a symbolic link.
 */
+ ( instancetype )symLinkTypeUTI;

/*!
 * @method      mountPointTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.mount-point' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a root directory of a volume.
 */
+ ( instancetype )mountPointTypeUTI;

/*!
 * @method      aliasFileTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.alias-file' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a fully-formed alias file.
 */
+ ( instancetype )aliasFileTypeUTI;

/*!
 * @method      aliasRecordTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.alias-record' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for raw alias data.
 */
+ ( instancetype )aliasRecordTypeUTI;

/*!
 * @method      URLTypeUTI
 * @abstract    Gets an UTI object for the 'public.url' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for the bytes of a URL.
 */
+ ( instancetype )URLTypeUTI;

/*!
 * @method      fileURLTypeUTI
 * @abstract    Gets an UTI object for the 'public.file-url' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for the text of a "file:" URL.
 */
+ ( instancetype )fileURLTypeUTI;

/*!
 * @method      textTypeUTI
 * @abstract    Gets an UTI object for the 'public.text' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for all text-encoded data, including text with markup (HTML, RTF, etc.).
 */
+ ( instancetype )textTypeUTI;

/*!
 * @method      plainTextTypeUTI
 * @abstract    Gets an UTI object for the 'public.plain-text' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for text with no markup and in an unspecified encoding.
 */
+ ( instancetype )plainTextTypeUTI;

/*!
 * @method      UTF8PlainTextTypeUTI
 * @abstract    Gets an UTI object for the 'public.utf8-plain-text' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for plain text in a UTF-8 encoding.
 */
+ ( instancetype )UTF8PlainTextTypeUTI;

/*!
 * @method      UTF16ExternalPlainTextTypeUTI
 * @abstract    Gets an UTI object for the 'public.utf16-external-plain-text' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for plain text in a UTF-16 encoding. If the encoded text does not include a byte order mark (BOM), the data has "external representation" byte order (big-endian).
 */
+ ( instancetype )UTF16ExternalPlainTextTypeUTI;

/*!
 * @method      UTF16PlainTextTypeUTI
 * @abstract    Gets an UTI object for the 'public.utf16-plain-text' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for plain text in a UTF-16 encoding in native byte order. The byte order mark (BOM) is optional. Correspondes to the 'utxt' OSType.
 */
+ ( instancetype )UTF16PlainTextTypeUTI;

/*!
 * @method      RTFTypeUTI
 * @abstract    Gets an UTI object for the 'public.rtf' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Rich Text Format.
 */
+ ( instancetype )RTFTypeUTI;

/*!
 * @method      HTMLTypeUTI
 * @abstract    Gets an UTI object for the 'public.html' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for HTML, any version.
 */
+ ( instancetype )HTMLTypeUTI;

/*!
 * @method      XMLTypeUTI
 * @abstract    Gets an UTI object for the 'public.xml' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for XML data.
 */
+ ( instancetype )XMLTypeUTI;

/*!
 * @method      sourceCodeTypeUTI
 * @abstract    Gets an UTI object for the 'public.source-code' UTI.
 * @return      An UTI object.
 * @discussion  The abstract type identifier for source code (any language).
 */
+ ( instancetype )sourceCodeTypeUTI;

/*!
 * @method      CSourceTypeUTI
 * @abstract    Gets an UTI object for the 'public.c-source' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for C source code (.c).
 */
+ ( instancetype )CSourceTypeUTI;

/*!
 * @method      objectiveCSourceTypeUTI
 * @abstract    Gets an UTI object for the 'public.objective-c-source' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Objective-C source code (.m).
 */
+ ( instancetype )objectiveCSourceTypeUTI;

/*!
 * @method      CPlusPlusSourceTypeUTI
 * @abstract    Gets an UTI object for the 'public.c-plus-plus-source' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for C++ source code (.cp, etc.).
 */
+ ( instancetype )CPlusPlusSourceTypeUTI;

/*!
 * @method      objectiveCPlusPlusSourceTypeUTI
 * @abstract    Gets an UTI object for the 'public.objective-c-plus-plus-source' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Objective-C++ source code.
 */
+ ( instancetype )objectiveCPlusPlusSourceTypeUTI;

/*!
 * @method      CHeaderTypeUTI
 * @abstract    Gets an UTI object for the 'public.c-header' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a C header.
 */
+ ( instancetype )CHeaderTypeUTI;

/*!
 * @method      CPlusPlusHeaderTypeUTI
 * @abstract    Gets an UTI object for the 'public.c-plus-plus-header' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a C++ header.
 */
+ ( instancetype )CPlusPlusHeaderTypeUTI;

/*!
 * @method      javaSourceTypeUTI
 * @abstract    Gets an UTI object for the 'com.sun.java-source' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Java source code.
 */
+ ( instancetype )javaSourceTypeUTI;

/*!
 * @method      PDFTypeUTI
 * @abstract    Gets an UTI object for the 'com.adobe.pdf' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Adobe PDF format.
 */
+ ( instancetype )PDFTypeUTI;

/*!
 * @method      RTFDTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.rtfd' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Rich Text Format Directory (RTF with content embedding, on-disk format).
 */
+ ( instancetype )RTFDTypeUTI;

/*!
 * @method      flatRTFDTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.flat-rtfd' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Flattened RTFD (pasteboard format).
 */
+ ( instancetype )flatRTFDTypeUTI;

/*!
 * @method      TXNTextAndMultimediaDataTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.txn.text-multimedia-data' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for MLTE (Textension) format for mixed text and multimedia data. Corresponds to the 'txtn' OSType.
 */
+ ( instancetype )TXNTextAndMultimediaDataTypeUTI;

/*!
 * @method      webArchiveTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.webarchive' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for the WebKit web archive format
 */
+ ( instancetype )webArchiveTypeUTI;

/*!
 * @method      imageTypeUTI
 * @abstract    Gets an UTI object for the 'public.image' UTI.
 * @return      An UTI object.
 * @discussion  The abstract type identifier for image data.
 */
+ ( instancetype )imageTypeUTI;

/*!
 * @method      JPEGTypeUTI
 * @abstract    Gets an UTI object for the 'public.jpeg' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a JPEG image.
 */
+ ( instancetype )JPEGTypeUTI;

/*!
 * @method      JPEG2000TypeUTI
 * @abstract    Gets an UTI object for the 'public.jpeg-2000' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a JPEG-2000 image.
 */
+ ( instancetype )JPEG2000TypeUTI;

/*!
 * @method      TIFFTypeUTI
 * @abstract    Gets an UTI object for the 'public.tiff' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a TIFF image.
 */
+ ( instancetype )TIFFTypeUTI;

/*!
 * @method      PICTTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.pict' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a Quickdraw PICT.
 */
+ ( instancetype )PICTTypeUTI;

/*!
 * @method      GIFTypeUTI
 * @abstract    Gets an UTI object for the 'com.compuserve.gif' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a GIF image.
 */
+ ( instancetype )GIFTypeUTI;

/*!
 * @method      PNGTypeUTI
 * @abstract    Gets an UTI object for the 'public.png' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a PNG image.
 */
+ ( instancetype )PNGTypeUTI;

/*!
 * @method      quickTimeImageTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.quicktime-image' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a QuickTime image. Corresponds to the 'qtif' OSType.
 */
+ ( instancetype )quickTimeImageTypeUTI;

/*!
 * @method      appleICNSTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.icns' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Apple icon data.
 */
+ ( instancetype )appleICNSTypeUTI;

/*!
 * @method      BMPTypeUTI
 * @abstract    Gets an UTI object for the 'com.microsoft.bmp' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a Windows bitmap.
 */
+ ( instancetype )BMPTypeUTI;

/*!
 * @method      ICOTypeUTI
 * @abstract    Gets an UTI object for the 'com.microsoft.ico' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Windows icon data.
 */
+ ( instancetype )ICOTypeUTI;

/*!
 * @method      audiovisualContentTypeUTI
 * @abstract    Gets an UTI object for the 'public.audiovisual-content' UTI.
 * @return      An UTI object.
 * @discussion  An abstract type identifier for audio and/or video content.
 */
+ ( instancetype )audiovisualContentTypeUTI;

/*!
 * @method      movieTypeUTI
 * @abstract    Gets an UTI object for the 'public.movie' UTI.
 * @return      An UTI object.
 * @discussion  An abstract type identifier for a media format which may contain both video and audio. Corresponds to what users would label a "movie"
 */
+ ( instancetype )movieTypeUTI;

/*!
 * @method      videoTypeUTI
 * @abstract    Gets an UTI object for the 'public.video' UTI.
 * @return      An UTI object.
 * @discussion  An abstract type identifier for pure video data(no audio).
 */
+ ( instancetype )videoTypeUTI;

/*!
 * @method      audioTypeUTI
 * @abstract    Gets an UTI object for the 'public.audio' UTI.
 * @return      An UTI object.
 * @discussion  An abstract type identifier for pure audio data (no video).
 */
+ ( instancetype )audioTypeUTI;

/*!
 * @method      quickTimeMovieTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.quicktime-movie' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a QuickTime movie.
 */
+ ( instancetype )quickTimeMovieTypeUTI;

/*!
 * @method      MPEGTypeUTI
 * @abstract    Gets an UTI object for the 'public.mpeg' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a MPEG-1 or MPEG-2 movie.
 */
+ ( instancetype )MPEGTypeUTI;

/*!
 * @method      MPEG4TypeUTI
 * @abstract    Gets an UTI object for the 'public.mpeg-4' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a MPEG-4 movie.
 */
+ ( instancetype )MPEG4TypeUTI;

/*!
 * @method      MP3TypeUTI
 * @abstract    Gets an UTI object for the 'public.mp3' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for MP3 audio.
 */
+ ( instancetype )MP3TypeUTI;

/*!
 * @method      MPEG4AudioTypeUTI
 * @abstract    Gets an UTI object for the 'public.mpeg-4-audio' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a MPEG-4 audio layer (.m4a, or the MIME type audio/MP4).
 */
+ ( instancetype )MPEG4AudioTypeUTI;

/*!
 * @method      appleProtectedMPEG4AudioTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.protected-mpeg-4-audio' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Apple protected MPEG4 format (.m4p, iTunes music store format).
 */
+ ( instancetype )appleProtectedMPEG4AudioTypeUTI;

/*!
 * @method      folderTypeUTI
 * @abstract    Gets an UTI object for the 'public.folder' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a a user-browsable directory (i.e., not a package).
 */
+ ( instancetype )folderTypeUTI;

/*!
 * @method      volumeTypeUTI
 * @abstract    Gets an UTI object for the 'public.volume' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for the root folder of a volume/mount point.
 */
+ ( instancetype )volumeTypeUTI;

/*!
 * @method      packageTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.package' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a packaged directory.
 */
+ ( instancetype )packageTypeUTI;

/*!
 * @method      bundleTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.bundle' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a directory conforming to a CFBundle layout
 */
+ ( instancetype )bundleTypeUTI;

/*!
 * @method      frameworkTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.framework' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for directory conforming to an OS X framework.
 */
+ ( instancetype )frameworkTypeUTI;

/*!
 * @method      applicationBundleTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.application-bundle' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a bundled application.
 */
+ ( instancetype )applicationBundleTypeUTI;

/*!
 * @method      applicationFileTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.application-file' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for a single-file Carbon/Classic application.
 */
+ ( instancetype )applicationFileTypeUTI;

/*!
 * @method      vCardTypeUTI
 * @abstract    Gets an UTI object for the 'public.vcard' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for VCard format.
 */
+ ( instancetype )vCardTypeUTI;

/*!
 * @method      inkTextTypeUTI
 * @abstract    Gets an UTI object for the 'com.apple.ink.inktext' UTI.
 * @return      An UTI object.
 * @discussion  The type identifier for Opaque InkText data.
 */
+ ( instancetype )inkTextTypeUTI;

/*!
 * @method      allUTIsWithFileExtension:
 * @abstract    Gets an array of all uniform type identifiers for the specified file extension.
 * @param       extension   The file extension.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension;

/*!
 * @method      allUTIsWithFileExtension:
 * @abstract    Gets an array of all uniform type identifiers for the specified file extension.
 * @param       extension   The file extension.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithFileExtension:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified file extension.
 * @param       extension   The file extension.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti;

/*!
 * @method      allUTIsWithFileExtension:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified file extension.
 * @param       extension   The file extension.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithMIMEType:
 * @abstract    Gets an array of all uniform type identifiers for the specified mime-type.
 * @param       type        The mime-type.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type;

/*!
 * @method      allUTIsWithMIMEType:
 * @abstract    Gets an array of all uniform type identifiers for the specified mime-type.
 * @param       type        The mime-type.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithMIMEType:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified mime-type.
 * @param       type        The mime-type.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      allUTIsWithMIMEType:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified mime-type.
 * @param       type        The mime-type.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithNSPboardType:
 * @abstract    Gets an array of all uniform type identifiers for the specified NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type;

/*!
 * @method      allUTIsWithNSPboardType:
 * @abstract    Gets an array of all uniform type identifiers for the specified NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithNSPboardType:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      allUTIsWithNSPboardType:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 */
+ ( NSArray * )allUTIsWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithOSType:
 * @abstract    Gets an array of all uniform type identifiers for the specified OSType.
 * @param       type        The OSType.
 * @return      An array of uniform type identifiers.
 * @see         stringForOSType
 */
+ ( NSArray * )allUTIsWithOSType: ( NSString * )type;

/*!
 * @method      allUTIsWithOSType:
 * @abstract    Gets an array of all uniform type identifiers for the specified OSType.
 * @param       type        The OSType.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 * @see         stringForOSType
 */
+ ( NSArray * )allUTIsWithOSType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithOSType:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified OSType.
 * @param       type        The OSType.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @return      An array of uniform type identifiers.
 * @see         stringForOSType
 */
+ ( NSArray * )allUTIsWithOSType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      allUTIsWithOSType:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the specified OSType.
 * @param       type        The OSType.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 * @see         stringForOSType
 */
+ ( NSArray * )allUTIsWithOSType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      allUTIsWithTag:tagClass:conformingTo:
 * @abstract    Gets an array of all uniform type identifiers for the type indicated by the specified tag.
 * @param       tag         The tag to translate into a uniform type identifier.
 * @param       tagClass    The class of the tag parameter.
 * @param       uti         If not nil, all returned uniform type identifiers must conform to this parameter.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An array of uniform type identifiers.
 * @discussion  This method is used to translate a type declared using another
 *              declaration mechanism (for example, MIME types) into a uniform
 *              type identifier. This method searches all UTI declarations for
 *              a matching translation and returns all possible results.
 *              If a conforming parameter is assigned, the search is reduced to
 *              the subset of type identifiers that conform to that type.
 */
+ ( NSArray * )allUTIsWithTag: ( NSString * )tag tagClass: ( UTITagClass )tagClass conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      stringForOSType:
 * @abstract    Encodes an OSType into a string suitable for use as a tag argument.
 * @param       type        The OSType to convert.
 * @return      A string that encodes the OSType.
 * @discussion  This method is only available for OS X targets. On iOS platforms,
 *              nil will be always returned.
 */
+ ( NSString * )stringForOSType: ( OSType )type;

/*!
 * @method      OSTypeForString:
 * @abstract    Decodes a tag string into an OSType.
 * @param       str         A string that encodes an OSType.
 * @return      The OSType that was encoded in the string.
 * @discussion  This method is only available for OS X targets. On iOS platforms,
 *              nil will be always returned.
 */
+ ( OSType )OSTypeForString: ( NSString * )str;

/*!
 * @method      initWithString:
 * @abstract    Initializes an UTI object with a string.
 * @param       str         The UTI identifier, as a string.
 * @return      An UTI object.
 */
- ( instancetype )initWithString: ( NSString * )str;

/*!
 * @method      initWithCFString:
 * @abstract    Initializes an UTI object with a CoreFoundation string.
 * @param       str         The UTI identifier, as a CoreFoundation string.
 * @return      An UTI object.
 */
- ( instancetype )initWithCFString: ( CFStringRef )str NS_DESIGNATED_INITIALIZER;

/*!
 * @method      initWithFileExtension:
 * @abstract    Initializes an UTI object with a file extension.
 * @param       extension   The file extension.
 * @return      An UTI object.
 */
- ( instancetype )initWithFileExtension: ( NSString * )extension;

/*!
 * @method      initWithFileExtension:
 * @abstract    Initializes an UTI object with a file extension.
 * @param       extension   The file extension.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
- ( instancetype )initWithFileExtension: ( NSString * )extension allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithFileExtension:conformingTo:
 * @abstract    Initializes an UTI object with a file extension.
 * @param       extension   The file extension.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 */
- ( instancetype )initWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti;

/*!
 * @method      initWithFileExtension:conformingTo:
 * @abstract    Initializes an UTI object with a file extension.
 * @param       extension   The file extension.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
- ( instancetype )initWithFileExtension: ( NSString * )extension conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithMIMEType:
 * @abstract    Initializes an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @return      An UTI object.
 */
- ( instancetype )initWithMIMEType: ( NSString * )type;

/*!
 * @method      initWithMIMEType:
 * @abstract    Initializes an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
- ( instancetype )initWithMIMEType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithMIMEType:conformingTo:
 * @abstract    Initializes an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 */
- ( instancetype )initWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      initWithMIMEType:conformingTo:
 * @abstract    Initializes an UTI object with a mime-type.
 * @param       type        The mime-type.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
- ( instancetype )initWithMIMEType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithNSPboardType
 * @abstract    Initializes an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @return      An UTI object.
 */
- ( instancetype )initWithNSPboardType: ( NSString * )type;

/*!
 * @method      initWithNSPboardType
 * @abstract    Initializes an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
- ( instancetype )initWithNSPboardType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithNSPboardType:conformingTo:
 * @abstract    Initializes an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 */
- ( instancetype )initWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      initWithNSPboardType:conformingTo:
 * @abstract    Initializes an UTI object with a NSPasteboardType.
 * @param       type        The NSPasteboardType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 */
- ( instancetype )initWithNSPboardType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithOSType:
 * @abstract    Initializes an UTI object with an OSType.
 * @param       type        The OSType.
 * @return      An UTI object.
 * @see         stringForOSType
 */
- ( instancetype )initWithOSType: ( NSString * )type;

/*!
 * @method      initWithOSType:
 * @abstract    Initializes an UTI object with an OSType.
 * @param       type        The OSType.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 * @see         stringForOSType
 */
- ( instancetype )initWithOSType: ( NSString * )type allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithOSType:conformingTo:
 * @abstract    Initializes an UTI object with an OSType.
 * @param       type        The OSType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @return      An UTI object.
 * @see         stringForOSType
 */
- ( instancetype )initWithOSType: ( NSString * )type conformingTo: ( UTI * )uti;

/*!
 * @method      initWithOSType:conformingTo:
 * @abstract    Initializes an UTI object with an OSType.
 * @param       type        The OSType.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object.
 * @see         stringForOSType
 */
- ( instancetype )initWithOSType: ( NSString * )type conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn;

/*!
 * @method      initWithTag:tagClass:conformingTo:
 * @abstract    Initializes a uniform type identifier for the type indicated by the specified tag.
 * @param       tag         The tag to translate into a uniform type identifier.
 * @param       tagClass    The class of the tag parameter.
 * @param       uti         If not nil, the returned UTI must conform to this parameter. Otherwise, nil will be returned.
 * @param       dyn         Allows dynamic UTIs.
 * @return      An UTI object
 * @discussion  This method is used to translate a type declared using another
 *              declaration mechanism (for example, MIME types) into a uniform
 *              type identifier. This method searches all UTI declarations for
 *              a matching translation. If a conforming parameter is assigned,
 *              the search is reduced to the subset of type identifiers that
 *              conform to that type.
 * @see         UTITagClass
 */
- ( instancetype )initWithTag: ( NSString * )tag tagClass: ( UTITagClass )tagClass conformingTo: ( UTI * )uti allowDynamic: ( BOOL )dyn NS_DESIGNATED_INITIALIZER;

/*!
 * @method      preferredTagForTagClass:
 * @abstract    Translates a uniform type identifier to a list of tags in a different type classification method.
 * @param       tagClass    The class of the tags you want to return.
 * @return      A string value
 * @see         UTITagClass
 */
- ( NSString * )preferredTagForTagClass: ( UTITagClass )tagClass;

/*!
 * @method      isEqualToUTI:
 * @abstract    Returns a Boolean value that indicates whether a given object is an UTI object and exactly equal the receiver.
 * @param       uti         The UTI object to compare with the receiver.
 * @return      YES if the uti is an UTI object and is exactly equal to the receiver, otherwise NO.
 */
- ( BOOL )isEqualToUTI: ( UTI * )uti;

/*!
 * @method      conformsToUTI
 * @abstract    Returns a Boolean value that indicates whether a given object is an UTI object and conforms to the receiver.
 * @param       uti         The UTI object to compare for conformance with the receiver.
 * @return      YES if the uti is an UTI object and is conforms to the receiver, otherwise NO.
 */
- ( BOOL )conformsToUTI: ( UTI * )uti;

/*!
 * @method      objectForDeclarationDictionaryKey
 * @abstract    Gets a value from the UTI declaration's dictionary
 * @param       key         The dictionary key.
 * @return      The dictionary value corresponding to the specified key.
 */
- ( id )objectForDeclarationDictionaryKey: ( UTIDeclarationDictionaryKey )key;

@end
