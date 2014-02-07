//
//  HomeViewController.m
//  Wutiko
//
//  Created by Jules Gueye on 29/01/2014.
//  Copyright (c) 2014 wutiko.com. All rights reserved.
//
#define HOST @"http://beta.wutiko.com/"

#import "HomeViewController.h"
#import "HomeCellView.h"
#import "Job.h"
#import "Sector.h"
#import "Companie.h"

#import "PDLocationsMap.h"
@interface HomeViewController (){
    NSMutableArray *tabJobs;
    NSMutableArray *tabCompanies;
    NSMutableArray *tabSectors;
    BOOL isJobOn;
    BOOL isCompany;
    BOOL isSector;
    BOOL isNext;
    NSString* urlToLoadData;
    NSDictionary *dataFromServeur;
    NSInteger taille;
    NSArray *arrayPoint;
    NSString *nextURLToLoad;
    
    
    
}


@end

@implementation HomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    if (!isCompany) {
        
    
    
    isJobOn=YES;
    isCompany=NO;
    isCompany=NO;
    isNext=NO;
    
    }

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    NSString *jobOrCompanieOrSector=@"jobs";
    if (isJobOn) {
        jobOrCompanieOrSector=@"jobs";
    }else if(isCompany){
        jobOrCompanieOrSector=@"companies";
    }else{
        jobOrCompanieOrSector=@"sectors";
    }
    urlToLoadData=[NSString stringWithFormat:@"http://beta.wutiko.com/%@/listof%@",jobOrCompanieOrSector,jobOrCompanieOrSector];
    NSLog(@"%@",urlToLoadData);
    
    [self loadData];
    
}

-(void) loadData{
   dataFromServeur=[self loadDataFromURL:urlToLoadData];
    nextURLToLoad=[dataFromServeur objectForKey:@"next_page"];
    long nbObjetNextFound=0;
    if (isJobOn) {
        if(!isNext)
        tabJobs =[[NSMutableArray alloc] init];
        NSMutableArray *jobs =[[NSMutableArray alloc] initWithCapacity:[[dataFromServeur objectForKey:@"jobs"] count]];
        Job *job;
        // NSString *newNextLinkVideo= [dictionnaryNexVideos objectForKey:@"next_page"];
        for (int i=0; i<[[dataFromServeur objectForKey:@"jobs"] count]; i++) {
            NSDictionary *jobData=[dataFromServeur objectForKey:@"jobs"][i];
            NSDictionary *jobDictionnary=[jobData objectForKey:@"Job"];
            NSDictionary *companieDictionnary=[jobData objectForKey:@"Company"];
            NSDictionary *cityDictionnary=[jobData objectForKey:@"City"];
            //NSLog(@"%@",jobDictionnary);
            job= [[Job alloc] init];
            [job setJobByNSDictionnary:jobDictionnary];
            [job setComanieByNSDictionnary:companieDictionnary];
            [job setCityByNSDictionnary:cityDictionnary];
            
            [jobs addObject:job];
            // NSLog(@"%@",video.titre);
            //job=nil;
            
        }
        if(jobs.count >0)
            [tabJobs addObjectsFromArray:jobs];
        
        taille=tabJobs.count ;
        nbObjetNextFound= jobs.count;
        
    }else if(isCompany){
        if(!isNext)
        tabCompanies =[[NSMutableArray alloc] init];
        NSMutableArray *companies =[[NSMutableArray alloc] initWithCapacity:[[dataFromServeur objectForKey:@"companies"] count]];
        Companie *company;
        // NSString *newNextLinkVideo= [dictionnaryNexVideos objectForKey:@"next_page"];
        for (int i=0; i<[[dataFromServeur objectForKey:@"companies"] count]; i++) {
            NSDictionary *companyData=[dataFromServeur objectForKey:@"companies"][i];
            NSDictionary *companyDictionnary=[companyData objectForKey:@"Company"];
          //  NSDictionary *companieDictionnary=[jobData objectForKey:@"Company"];
            NSDictionary *cityDictionnary=[companyData objectForKey:@"City"];
            //NSLog(@"%@",jobDictionnary);
            company= [[Companie alloc] init];
            [company setCompaniesByNSDictionnary:companyDictionnary];
            //[job setComanieByNSDictionnary:companieDictionnary];
            [company setCityByNSDictionnary:cityDictionnary];
            
            [companies addObject:company];
            // NSLog(@"%@",video.titre);
            //job=nil;
            
        }
        if(companies.count >0)
        [tabCompanies addObjectsFromArray:companies];
        taille=tabCompanies.count ;
         nbObjetNextFound= companies.count;
        
    }else{
        if(!isNext)
        tabSectors =[[NSMutableArray alloc] init];
        NSMutableArray *sectors =[[NSMutableArray alloc] initWithCapacity:[[dataFromServeur objectForKey:@"sectors"] count]];
        Sector  *sector;
        // NSString *newNextLinkVideo= [dictionnaryNexVideos objectForKey:@"next_page"];
        for (int i=0; i<[[dataFromServeur objectForKey:@"sectors"] count]; i++) {
            NSDictionary *sectorData=[dataFromServeur objectForKey:@"sectors"][i];
            NSDictionary *sectorDictionnary=[sectorData objectForKey:@"Sector"];
            //  NSDictionary *companieDictionnary=[jobData objectForKey:@"Company"];
           // NSDictionary *cityDictionnary=[companyData objectForKey:@"City"];
            //NSLog(@"%@",jobDictionnary);
            sector= [[Sector alloc] init];
            [sector setSectorByNSDictionnary:sectorDictionnary];
            //[job setComanieByNSDictionnary:companieDictionnary];
           // [sector setCityByNSDictionnary:cityDictionnary];
            
            [sectors addObject:sector];
            // NSLog(@"%@",video.titre);
            //job=nil;
            
        }
        if(sectors.count >0)
        [tabSectors addObjectsFromArray:sectors];
        taille=tabSectors.count ;
         nbObjetNextFound= sectors.count;

    }
    [_butonNext setHidden:isSector ||(nbObjetNextFound==0)];
    
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    if (isJobOn)
        return tabJobs.count;
    else if(isCompany)
        return tabCompanies.count;
    else return tabSectors.count;
        }

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"CompanieCell";
    HomeCellView *cell = (HomeCellView *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    if (isJobOn) {
        
        Job *job=[tabJobs objectAtIndex:indexPath.row];
        cell.titre.text=job.name;
        cell.date.text=job.created;
        cell.nbVues.text=job.featured;
        cell.details.text=job.companie.name;
        cell.region.text=job.city_id;
        [self downloadingServerImageItemFromUrl:cell.imageViewCompany UrlImage:job.companie.avatarc idItem:job.idJob];
        
        
    }else if(isCompany){
        Companie *companie=[tabCompanies objectAtIndex:indexPath.row];
        cell.titre.text=companie.name;
        cell.date.text=@"";
        cell.nbVues.text=companie.featured;
       
        cell.region.text=companie.city_id;
        cell.details.text=[NSString stringWithFormat:@"%@ job(s)",companie.job_count] ;
        cell.region.text=companie.city_id;
       [self downloadingServerImageItemFromUrl:cell.imageViewCompany UrlImage:companie.avatarc idItem:companie.idCompanie];
       
        
    }else{
        static NSString *CellIdentifier = @"SectorCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
        
        Sector *sector=[tabSectors objectAtIndex:indexPath.row];
        cell.textLabel.text=sector.name;
        cell.detailTextLabel.text=[NSString stringWithFormat:@"%@ companies",sector.countCompanies];
        
    }
    
    
    
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

-(NSDictionary *)loadDataFromURL:(NSString *)url {
    // [self showLoadingView];
    NSString *urlString =url;
    NSMutableURLRequest *maRequete = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:urlString]];
    
    // On utilise une requète http POST
    [maRequete setHTTPMethod:@"POST"];
    
    // On passe les variables
    //  [maRequete setHTTPBody:[[NSString stringWithFormat:@"TB_Nom_Utilisateur=%@&TB_Mot_de_Passe=%@",login.text,password.text]dataUsingEncoding:NSASCIIStringEncoding]]; // ceci est un exemple où je passe deux paramètres (à définir avant, of course.)
    NSURLResponse *response;
    NSError *error;
    
    // On récupère ce qui est renvoyé par le code php et on l'affiche.
    NSData *result = [NSURLConnection sendSynchronousRequest:maRequete returningResponse:&response error:&error];
    
    NSString *returnString = [[NSString alloc] initWithData:result encoding:NSASCIIStringEncoding];
    
    
    
    NSDictionary *resultat =nil;
    if([returnString length]>0){
        resultat= [NSJSONSerialization JSONObjectWithData:result options:kNilOptions error:&error];
        //  NSLog(@"Array: %@", [[self.dictionary objectForKey:@"entries"][0] objectForKey:@"channel_bg"]);
        //  NSLog(@"Array: %d", [[self.dictionary objectForKey:@"entries"] count]);
        
        
    }
    return resultat;
}
-(void)downloadingServerImageItemFromUrl:(UIImageView*)imgView UrlImage:(NSString *)url idItem:(NSString *)idItem{
    
    
    imgView.image = [UIImage imageNamed:@"blue.png"];
    
    
    NSString* theFileName = [NSString stringWithFormat:@"%@.jpg",[[url lastPathComponent] stringByDeletingPathExtension]];
    
    
    NSFileManager *fileManager =[NSFileManager defaultManager];
    NSString *fileName = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"tmp/item_%@_%@",idItem,theFileName]];
    
    
    
    imgView.backgroundColor = [UIColor darkGrayColor];
    UIActivityIndicatorView *actView = [[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    [imgView addSubview:actView];
    [actView startAnimating];
    CGSize boundsSize = imgView.bounds.size;
    CGRect frameToCenter = actView.frame;
    // center horizontally
    if (frameToCenter.size.width < boundsSize.width)
        frameToCenter.origin.x = (boundsSize.width - frameToCenter.size.width) / 2;
    else
        frameToCenter.origin.x = 0;
    
    // center vertically
    if (frameToCenter.size.height < boundsSize.height)
        frameToCenter.origin.y = (boundsSize.height - frameToCenter.size.height) / 2;
    else
        frameToCenter.origin.y = 0;
    
    actView.frame = frameToCenter;
    
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        
        NSData *dataFromFile = nil;
        NSData *dataFromUrl = nil;
        
        dataFromFile = [fileManager contentsAtPath:fileName];
        if(dataFromFile==nil){
            NSString *linkToDownload=[NSString stringWithFormat:@"%@%@",HOST,url];
            NSLog(@"%@",linkToDownload);
            dataFromUrl=[[NSData alloc] initWithContentsOfURL:[NSURL URLWithString:linkToDownload]];
        }
        
        dispatch_sync(dispatch_get_main_queue(), ^{
            
            if(dataFromFile!=nil){
                imgView.image = [UIImage imageWithData:dataFromFile];
            }else if(dataFromUrl!=nil){
                imgView.image = [UIImage imageWithData:dataFromUrl];
                NSString *fileName = [NSHomeDirectory() stringByAppendingPathComponent:[NSString stringWithFormat:@"tmp/item_%@_%@",idItem, theFileName]];
                
                BOOL filecreationSuccess = [fileManager createFileAtPath:fileName contents:dataFromUrl attributes:nil];
                if(filecreationSuccess == NO){
                    NSLog(@"Failed to create the html file");
                }
                
            }else{
                imgView.image = [UIImage imageNamed:@"blue.png"];
            }
            
            // [video.imageView setImage:imgView.image];
            [actView removeFromSuperview];
            
            [imgView setBackgroundColor:[UIColor clearColor]];
        });
    });
    
    
}

- (IBAction)typeRecherche:(id)sender {
    isNext=NO;
   // NSLog(@"%ld",(long)_segmentedController.selectedSegmentIndex);
    isJobOn=(_segmentedController.selectedSegmentIndex==0);
    isCompany=(_segmentedController.selectedSegmentIndex==1);
    isSector=(_segmentedController.selectedSegmentIndex==2);
    NSString *jobOrCompanieOrSector=@"jobs";
    if (isJobOn) {
        jobOrCompanieOrSector=@"jobs";
    }else if(isCompany){
        jobOrCompanieOrSector=@"companies";
        
    }else{
        jobOrCompanieOrSector=@"sectors";
        
    }
    [_butonMap setEnabled:!isSector];
    urlToLoadData=[NSString stringWithFormat:@"http://beta.wutiko.com/%@/listof%@",jobOrCompanieOrSector,jobOrCompanieOrSector];
  //  NSLog(@"%@",urlToLoadData);
    
    [self loadData];
    [self.tableView reloadData];
}

- (IBAction)nextDataToLoad:(id)sender {
    if(nextURLToLoad){
    urlToLoadData= [NSString stringWithString:nextURLToLoad];
    isNext=YES;
   
    [self loadData];
    [self.tableView reloadData];
    }
}

- (IBAction)showLocations:(id)sender {
    PDLocationsMapViewController *locationsMapViewController = [[PDLocationsMapViewController alloc] initWithDelegate:self andDataSource:self];
   // [self presentViewController:locationsMapViewController animated:YES completion:nil];
    [self.navigationController pushViewController:locationsMapViewController animated:YES ];//odalViewController:locationsMapViewController animated:YES];
    
}

#pragma mark -
#pragma mark PDLocationsMapView

- (NSArray *)locationsForShowingInLocationsMap {
    /*PDLocation *loc1 = [[PDLocation alloc] initWithName:@"Agra" description:@"A city on the Jumna River in Uttar Pradesh state, northern India; pop. 899,000. Once the capital of the Mogul empire 1566–1658, it is the site of the Taj Mahal" andLocation:CLLocationCoordinate2DMake(27.177023,78.007862)];
    PDLocation *loc2 = [[PDLocation alloc] initWithName:@"Kanyakumari" description:@"Kanyakumari is a town in Kanyakumari district in Tamil Nadu state, India. Located at the southernmost tip of the Indian Peninsula, its former name was Cape Comorin" andLocation:CLLocationCoordinate2DMake(8.092881,77.538388)];
    PDLocation *loc3 = [[PDLocation alloc] initWithName:@"Mysore" description:@"Mysore is a tourism hot spot within the state of Karnataka and also acts as a base for other tourist places in the vicinity of the city." andLocation:CLLocationCoordinate2DMake(12.303442,76.64023)];*/
   
    NSMutableArray *listPoint = [[NSMutableArray alloc] initWithCapacity:taille];
    for (int i=0; i<taille; i++) {
        if (isJobOn) {
            Job *job=[tabJobs objectAtIndex:i];
            PDLocation *location = [[PDLocation alloc] initWithName:job.name description:job.companie.name andLocation:CLLocationCoordinate2DMake([job.companie.lat floatValue],[job.companie.lng floatValue])];
            [listPoint addObject:location];
        }else{
            Companie *com=[tabCompanies objectAtIndex:i];
            PDLocation *location = [[PDLocation alloc] initWithName:com.name description:com.address andLocation:CLLocationCoordinate2DMake([com.lat floatValue],[com.lng floatValue])];
            [listPoint addObject:location];

        }
    }
    arrayPoint =[[NSArray alloc] initWithArray:listPoint];
    
    
    return arrayPoint;
}

- (void)didSelectLocationAtIndex:(int)index {
    
}
-(void)setCompany{
    isJobOn=NO;
    isCompany=YES;
    [_segmentedController setSelectedSegmentIndex:1];
    [_segmentedController setHidden:YES];
    [self setTitle:_secto.name];
}
@end
