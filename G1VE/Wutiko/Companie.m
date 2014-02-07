//
//  Companie.m
//  Wutiko
//
//  Created by Jules Gueye on 29/01/2014.
//  Copyright (c) 2014 wutiko.com. All rights reserved.
//

#import "Companie.h"

@implementation Companie
-(void) setCompaniesByNSDictionnary:(NSDictionary *)dataFromServeur{
    self.idCompanie = [dataFromServeur objectForKey:@"id"];
    self.job_count= [dataFromServeur objectForKey:@"job_count"];
    self.name= [dataFromServeur objectForKey:@"name"];
    self.slug= [dataFromServeur objectForKey:@"slug"];
    self.founded= [dataFromServeur objectForKey:@"founded"];
    self.revenues= [dataFromServeur objectForKey:@"revenues"];
    self.size= [dataFromServeur objectForKey:@"size"];
    self.reach= [dataFromServeur objectForKey:@"reach"];
    self.address= [dataFromServeur objectForKey:@"address"];
    self.bp= [dataFromServeur objectForKey:@"bp"];
    self.legalform= [dataFromServeur objectForKey:@"legalform"];
    self.phone= [dataFromServeur objectForKey:@"phone"];
    self.email= [dataFromServeur objectForKey:@"email"];
    self.avatarc= [dataFromServeur objectForKey:@"avatarc"];
    self.created= [dataFromServeur objectForKey:@"created"];
    self.online= [dataFromServeur objectForKey:@"online"];
    self.fax= [dataFromServeur objectForKey:@"fax"];
    self.website= [dataFromServeur objectForKey:@"website"];
    self.featured= [dataFromServeur objectForKey:@"featured"];
    self.user_id= [dataFromServeur objectForKey:@"user_id"];
    self.district_id= [dataFromServeur objectForKey:@"district_id"];
    self.country_id= [dataFromServeur objectForKey:@"country_id"];
    self.city_id= [dataFromServeur objectForKey:@"city_id"];
    self.lat= [dataFromServeur objectForKey:@"lat"];
    self.lng= [dataFromServeur objectForKey:@"lng"];
    
}
-(void) setCityByNSDictionnary:(NSDictionary *)dataFromServeur{
    self.city_id= [dataFromServeur objectForKey:@"name"];
}
@end
