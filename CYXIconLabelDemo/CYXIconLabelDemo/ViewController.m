//
//  ViewController.m
//  CYXIconLabelDemo
//
//  Created by 晓 on 2020/4/30.
//  Copyright © 2020 晓. All rights reserved.
//

#import "ViewController.h"
#import "CYXIconAttributedUtils.h"
#import "CYXIconTestTableViewCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UILabel *textLabel;
@property (nonatomic,strong,nullable) UITableView *tableview;

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.tableview];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 100;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *reuseIdentifier=@"CYXIconTestTableViewCell";
    CYXIconTestTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if(cell==nil){
        cell=[[CYXIconTestTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault      reuseIdentifier:reuseIdentifier];
    }
    //cell.textLabel.text = @"123";
    [cell set];
    return cell;

}
#pragma mark ---G
-(UILabel*)textLabel{
    if(!_textLabel){
        _textLabel = [[UILabel alloc] init];
        _textLabel.textColor = [UIColor blackColor];
        _textLabel.font = [UIFont systemFontOfSize:30];
        _textLabel.numberOfLines = 2;
        _textLabel.userInteractionEnabled = YES;
    }
    return _textLabel;
}

-(nullable UITableView*)tableview{
    if(!_tableview){
        _tableview = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _tableview.delegate = self;
        _tableview.dataSource = self;
    }
    return _tableview;
}



@end
