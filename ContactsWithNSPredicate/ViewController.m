//
//  ViewController.m
//  ContactsWithNSPredicate
//
//  Created by user on 09/08/17.
//  Copyright © 2017 glbitm. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    myArray = [[NSMutableArray alloc] init];
    NSArray *array = @[@"Akshat", @"Eric", @"Angad", @"Zain", @"Bosch", @"Kyle", @"Kevin", @"Stan", @"Emily"
                       , @"Butters", @"Wendy", @"Sunny"];
    
    for(char c='A'; c<='Z'; c++){
        NSString *string = [NSString stringWithFormat:@"%c", c];
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", string];
        NSArray *result = [array filteredArrayUsingPredicate:predicate];
        if(result.count >0){
            [myArray addObject:result];
        }
    }
    NSLog(@"%@", myArray);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table View Data Source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    NSArray *tempArray = [myArray objectAtIndex:section];
    return [tempArray count];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return [myArray count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellId = @"SimpleTableId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    NSArray *tempArray = [myArray objectAtIndex:indexPath.section];
    NSString *str = [tempArray objectAtIndex:indexPath.row];
    cell.textLabel.text = str;
    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    NSArray *tempArray = [myArray objectAtIndex:section];
    
    NSString *key =  [[[tempArray objectAtIndex:0] substringToIndex: 1] uppercaseString];
    return key;
    
}

#pragma mark - TableView Delegate

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSArray *tempArray = [myArray objectAtIndex:indexPath.section];
    NSString *str = [tempArray objectAtIndex:indexPath.row];
    NSLog(@"%@", str);
}
@end
