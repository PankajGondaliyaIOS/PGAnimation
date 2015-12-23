//
//  HomeViewController.m
//  PGAnimation
//
//  Created by Pankaj on 04/12/15.
//  Copyright © 2015 Pankaj Gondaliya. All rights reserved.
//
// You can contact me on : https://www.facebook.com/pankaj.gondaliya.16

#import "HomeViewController.h"
#import "PlayGroundViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initiateView];
}

#pragma mark - Tableview Delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 25;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return arrAnimations.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *simpleTableIdentifier = @"SimpleTableItem";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:simpleTableIdentifier];
        [cell.textLabel setFont:[UIFont systemFontOfSize:10.5]];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [arrAnimations objectAtIndex:indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    PlayGroundViewController *playGroundVC = [[PlayGroundViewController alloc] init];
    playGroundVC.strAnimation = [arrAnimations objectAtIndex:indexPath.row];
    playGroundVC.nType = indexPath.row;
    [self.navigationController pushViewController:playGroundVC animated:YES];
}

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section {
    UIView *view = [[UIView alloc] init];
    return view;
}

#pragma mark - View Initiation Methods

-(void)initiateView {
    arrAnimations = [NSMutableArray new];
    [arrAnimations addObject:@"Animate Zoom Bounce"];
    [arrAnimations addObject:@"Animate Shake"];
    [arrAnimations addObject:@"Animate Spin"];
    [arrAnimations addObject:@"Animate Flip"];
    [arrAnimations addObject:@"Animate SpringRotation"];
    [arrAnimations addObject:@"Animate Fade"];
    [arrAnimations addObject:@"Animate from Right"];
    [arrAnimations addObject:@"Animate from Left"];
    [arrAnimations addObject:@"Animate from Top"];
    [arrAnimations addObject:@"Animate from Bottom"];
    [arrAnimations addObject:@"Animate Bounce"];
    [arrAnimations addObject:@"Animate from zero rect"];
    [arrAnimations addObject:@"Animate from Centre of view with zero rect"];
    [arrAnimations addObject:@"Animate a view to Zero rect"];
    [arrAnimations addObject:@"Animate Top to Centre With Rect"];
    [arrAnimations addObject:@"Animate Centre to Bottom With Rect"];
    [arrAnimations addObject:@"Animate Bottom to Centre With Rect"];
    [arrAnimations addObject:@"Animate Centre to TOP With Rect"];
    [arrAnimations addObject:@"Animate Top to Centre With Rect With Block"];
    [arrAnimations addObject:@"Animate Left to Centre With Rect"];
    [arrAnimations addObject:@"Animate Centre to right With Rect"];
    [arrAnimations addObject:@"Animate Right to Centre With Rect"];
    [arrAnimations addObject:@"Animate Centre to Left With Rect"];
    [arrAnimations addObject:@"View Color spread animation"];
    [arrAnimations addObject:@"Animate X of view"];
    [arrAnimations addObject:@"Animate Y of view"];
    [arrAnimations addObject:@"Animate Width of view"];
    [arrAnimations addObject:@"Animate Height of view"];
    [arrAnimations addObject:@"Animate Top left to center"];
    [arrAnimations addObject:@"Animate Top Right to center"];
    [arrAnimations addObject:@"Animate Bottom left to center"];
    [arrAnimations addObject:@"Animate Bottom right to center"];
    [arrAnimations addObject:@"Animate Centre to right bottom corner"];
    [arrAnimations addObject:@"Animate Centre to left bottom corner"];
    [arrAnimations addObject:@"Animate Centre to right top corner"];
    [arrAnimations addObject:@"Animate Centre to left top corner"];
    [arrAnimations addObject:@"Animate Blink"];
    [arrAnimations addObject:@"Animate Whole RECT/FRAME"];
    [arrAnimations addObject:@"Animate PushViewController with Present Effect"];
    [arrAnimations addObject:@"Animate PushViewController with Zoom Effect"];
    [arrAnimations addObject:@"Animate PushViewController with Spin Effect"];
    
    [arrAnimations addObject:@"Animate PushViewController with PresentDown Effect"];
    [arrAnimations addObject:@"Animate PushViewController with Pop Effect"];
    [arrAnimations addObject:@"Animate PushViewController with Fade Effect"];
    [arrAnimations addObject:@"Animate PushViewController with Spring Effect"];
    [arrAnimations addObject:@"Animate PushViewController with FlipRight Effect"];
    [arrAnimations addObject:@"Animate PushViewController with FlipLeft Effect"];
    [arrAnimations addObject:@"Animate PushViewController with CurlUpLeft Effect"];
    [arrAnimations addObject:@"Animate PushViewController with CurlDown Effect"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
