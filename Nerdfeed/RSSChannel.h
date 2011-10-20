//
//  RSSChannel.h
//  Nerdfeed
//
//  Created by  Chuns on 11-10-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSChannel : NSObject <NSXMLParserDelegate>{
    NSString *title;
    NSString *shortDescription;
    NSMutableArray *items;
    
    id parentParserDelegate;
    
    NSMutableString *currentString;
    
    
}

@property (nonatomic, assign) id parentParserDelegate;

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *shortDescription;
@property (nonatomic, retain) NSMutableArray *items;


@end
