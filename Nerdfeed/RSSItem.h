//
//  RSSItem.h
//  Nerdfeed
//
//  Created by  Chuns on 11-10-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface RSSItem : NSObject <NSXMLParserDelegate>{
    NSString *title;
    NSString *link;
    NSMutableString *currentString;
    
    id parentParserDelegate;
}

@property (nonatomic, assign) id parentParserDelegate;

@property (nonatomic, retain) NSString *title;
@property (nonatomic, retain) NSString *link;

@end
