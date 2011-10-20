//
//  ListViewController.h
//  Nerdfeed
//
//  Created by  Chuns on 11-10-20.
//  Copyright 2011年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class RSSChannel;

@interface ListViewController : UITableViewController <NSXMLParserDelegate>{
    NSURLConnection *connection;
    NSMutableData *xmlData;
    
    RSSChannel *channel;
}

- (void)fetchEntries;

@end
