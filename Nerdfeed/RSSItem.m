//
//  RSSItem.m
//  Nerdfeed
//
//  Created by  Chuns on 11-10-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "RSSItem.h"


@implementation RSSItem

@synthesize title, link, parentParserDelegate;

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
    attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"title"]) {
        currentString = [[NSMutableString alloc] init];
        [self setTitle:currentString];
    }
    else if ([elementName isEqual:@"link"]) {
        currentString = [[NSMutableString alloc] init];
        [self setLink:currentString];
    }
    
    
    
}


- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)str
{
    [currentString appendString:str];
}

-(void)parser:(NSXMLParser *)parser 
didEndElement:(NSString *)elementName 
 namespaceURI:(NSString *)namespaceURI
qualifiedName:(NSString *)qName 
{
    [currentString release];
    currentString = nil;
    
    if ([currentString isEqual:@"item"])
        [parser setDelegate:parentParserDelegate];
}

- (void)dealloc
{
    [title release];
    [link release];
    [super release];
}


@end
