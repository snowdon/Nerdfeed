//
//  RSSChannel.m
//  Nerdfeed
//
//  Created by  Chuns on 11-10-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import "RSSChannel.h"
#import "RSSItem.h"

@implementation RSSChannel
@synthesize items, title, shortDescription, parentParserDelegate;

- (void)parser:(NSXMLParser *)parser 
didStartElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName 
    attributes:(NSDictionary *)attributeDict
{
    NSLog(@"\t%@ found a %@ element", self, elementName);
    
    if ([elementName isEqual:@"title"]){
        currentString = [[NSMutableString alloc] init];
        [self setTitle:currentString];
        
    }
    else if ([elementName isEqual:@"description"]){
        currentString = [[NSMutableString alloc] init];
        [self setShortDescription:currentString];
    }
    else if ([elementName isEqual:@"item"]){
        RSSItem *entry = [[RSSItem alloc] init];
        
        [entry setParentParserDelegate:self];
        
        [parser setDelegate:entry];
        
        [items addObject:entry];
        [entry release];
    }
    
}

- (void)parser:(NSXMLParser *)parser 
 didEndElement:(NSString *)elementName 
  namespaceURI:(NSString *)namespaceURI 
 qualifiedName:(NSString *)qName
{
    [currentString release];
    currentString = nil;
    
    if ([elementName isEqual:@"channel"])
        [parser setDelegate:parentParserDelegate];
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)str
{
    [currentString appendString:str];
}

- (id)init
{
    self = [super init];
    
    if (self) {
        items = [[NSMutableArray alloc] init];
    }
    
    return self;
}

- (void)dealloc
{
    [items release];
    
    [title release];
    [shortDescription release];
    
    [super dealloc];
}

@end
