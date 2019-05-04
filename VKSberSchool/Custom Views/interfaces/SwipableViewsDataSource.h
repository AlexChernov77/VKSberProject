//
//  SwipableViewsDataSource.h
//  VKSberSchool
//
//  Created by Александр on 18/03/2019.
//  Copyright © 2019 Александр. All rights reserved.
//

@protocol SwipableViewsDataSource <NSObject>
    
-(void) view: (UIView* ) view atIndex: (NSInteger) index;
-(NSInteger)numbersOfViews;
    
@end
