//
//  FRViewController.m
//  btle iPhone4
//
//  Created by Falko Richter on 02/12/13.
//  Copyright (c) 2013 falkorichter. All rights reserved.
//

#import "FRViewController.h"

#import <CoreBluetooth/CoreBluetooth.h>




@interface FRViewController () <CBCentralManagerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *bluetoothState;
@property (nonatomic, strong) CBCentralManager* manager;

- (IBAction)checkAgain;

@end

@implementation FRViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.manager = [[CBCentralManager alloc] init];#
    self.manager.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self checkAgain];    
}


- (IBAction)checkAgain {
    switch (self.manager.state) {
        case CBCentralManagerStateUnknown       :
            self.bluetoothState.text = @"CBCentralManagerStateUnknown";
            break;
        case CBCentralManagerStateResetting     :
            self.bluetoothState.text = @"CBCentralManagerStateResetting";
            break;
        case CBCentralManagerStateUnsupported   :
            self.bluetoothState.text = @"CBCentralManagerStateUnsupported";
            break;
        case CBCentralManagerStateUnauthorized  :
            self.bluetoothState.text = @"CBCentralManagerStateUnauthorized";
            break;
        case CBCentralManagerStatePoweredOff    :
            self.bluetoothState.text = @"CBCentralManagerStatePoweredOff";
            break;
        case CBCentralManagerStatePoweredOn     :
            self.bluetoothState.text = @"CBCentralManagerStatePoweredOn";
            break;
    }
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central{
    [self checkAgain];
}

@end
