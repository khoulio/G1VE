//
//  LeftMenuVC.m
//  AMSlideMenu
//
//  Created by Artur Mkrtchyan on 12/24/13.
//  Copyright (c) 2013 Artur Mkrtchyan. All rights reserved.
//

#import "LeftMenuVC.h"

@implementation LeftMenuVC

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 7.0 && ![UIApplication sharedApplication].isStatusBarHidden)
    {
        self.tableView.contentInset = UIEdgeInsetsMake(20, 0, 0, 0);
        
    }
    
    /*
     NSMutableArray *give1projct;
     NSMutableArray *programs;
     NSMutableArray *news;
     NSMutableArray *myGive1project;
     */
   
    
    give1projct = [NSMutableArray array] ;
    
    [give1projct addObject:@"GIVE1TALKS"];
    [give1projct addObject:@"WE ARE IN YOUR COUNTRY"];
    
    
    programs = [NSMutableArray array] ;
    
    [programs addObject:@"GIVE1INCUBATOR"];
    [programs addObject:@"GIVE1WEN"];
    [programs addObject:@"GIVE1ARTS"];
    [programs addObject:@"GIVE1YEN"];
   
    
    news = [NSMutableArray array] ;
    
    [news addObject:@"HIGHLIGHTS"];
    [news addObject:@"VIDEOS CHANNEL"];
    [news addObject:@"EVENTS GALLERY"];
   
    myGive1project = [NSMutableArray array] ;
    
    [myGive1project addObject:@"GET INVOLVED"];
    [myGive1project addObject:@"SOCIAL NETWORKS"];
    [myGive1project addObject:@"LEADER'S QUOTES"];
    

    
    
   /* [[self view] setAutoresizesSubviews:NO];
    
    UIView *backgroundView = [[UIView alloc] initWithFrame:self.view.frame];
    backgroundView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"logoGive.png"]];
    [backgroundView setAlpha:0.2];
    
    self.tableView.backgroundView = backgroundView;
    self.tableView.backgroundColor = [UIColor clearColor];*/
    
   
   
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    //#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 4;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    //#warning Incomplete method implementation.
    // Return the number of rows in the section.
    switch (section) {
        case 0:
            return give1projct.count;
            break;
        case 1:
            return programs.count;
            break;
        case 2:
            return news.count;
            break;
        case 3:
            return myGive1project.count;
            break;
            
        default:
            return give1projct.count;
            break;
    }
    
}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return @"GIVE 1 PROJECT";
            break;
        case 1:
            return @"PROGRAMS";
            break;
        case 2:
            return @"NEWS & MULTIMEDIA";
            break;
        case 3:
            return @"myGIVE1PROJECT";
            break;
            
        default:
            return @"GIVE 1 PROJECT";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
     NSString *str;
    switch (indexPath.section) {
        case 0:
            str=[give1projct objectAtIndex:indexPath.row];
            break;
        case 1:
            str=[programs objectAtIndex:indexPath.row];
            break;
        case 2:
            str=[news objectAtIndex:indexPath.row];
            break;
        case 3:
            str=[myGive1project objectAtIndex:indexPath.row];
            break;
            
        default:
            str=@"";
            break;
    }
   
    cell.textLabel.text=str;
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
 {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 }
 else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
 {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
 {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a story board-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 
 */


@end
