//
//  Companie.h
//  Wutiko
//
//  Created by Jules Gueye on 29/01/2014.
//  Copyright (c) 2014 wutiko.com. All rights reserved.
//

#import <Foundation/Foundation.h>
/*
 "id":"89",
 "job_count":"5",
 "name":"Linked Partners",
 "slug":"linked-partners",
 "founded":"2010",
 "revenues":"1000000",
 "size":"5",
 "reach":"Local",
 "address":"6 rue 2 x rue B point E, dakar",
 "bp":"5485",
 "legalform":"SARL",
 "phone":"33 892 40 00",
 "email":"contact@linkedpartners.com",
 "avatarc":"img\/companies\/2013\/1\/89.png",
 "created":"2013-12-07 13:12:26",
 "online":"1",
 "fax":"77 239 00 00",
 "website":"www.linkedpartners.com",
 "featured":"1",
 "user_id":"18",
 "district_id":"1",
 "country_id":"1",
 "city_id":"1",
 "lat":"14.697699",
 "lng":"-17.463825",
 "url":{
 "controller":"companies",
 "action":"show",
 "id":"89",
 "slug":"linked-partners"
 }
 */
@interface Companie : NSObject
@property (nonatomic,strong) NSString *idCompanie;
@property (nonatomic,strong) NSString *job_count;
@property (nonatomic,strong) NSString *name;
@property (nonatomic,strong) NSString *slug;
@property (nonatomic,strong) NSString *founded;
@property (nonatomic,strong) NSString *revenues;
@property (nonatomic,strong) NSString *size;
@property (nonatomic,strong) NSString *reach;
@property (nonatomic,strong) NSString *address;
@property (nonatomic,strong) NSString *bp;
@property (nonatomic,strong) NSString *legalform;
@property (nonatomic,strong) NSString *phone;
@property (nonatomic,strong) NSString *avatarc;
@property (nonatomic,strong) NSString *created;
@property (nonatomic,strong) NSString *online;
@property (nonatomic,strong) NSString *featured;
@property (nonatomic,strong) NSString *user_id;
@property (nonatomic,strong) NSString *district_id;
@property (nonatomic,strong) NSString *country_id;
@property (nonatomic,strong) NSString *lat;
@property (nonatomic,strong) NSString *lng;
@property (nonatomic,strong) NSString *email;
@property (nonatomic,strong) NSString *fax;
@property (nonatomic,strong) NSString *website;
@property (nonatomic,strong) NSString *city_id;

-(void) setCompaniesByNSDictionnary:(NSDictionary *)dataFromServeur;
-(void) setCityByNSDictionnary:(NSDictionary *)dataFromServeur;

@end
