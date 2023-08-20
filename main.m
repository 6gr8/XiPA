#import <Foundation/Foundation.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#import "SSZipArchive/SSZipArchive.h"
#import "Header.h"

// Coded By Mr DeNsor - XiPA
// You Can Make This Script Better :)

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        printf("\033[35m[-] XiPA ...\033[0m\n");
        char userInput[100];
        
        printf("[1] Unzip Ipa \n[2] Info Ipa\n[3] Change Name.ipa\n[4] Change Version.ipa\n[5] Change Bundle.ipa\n[6] Exit\n");
        printf(">>");
        scanf("%s", userInput);
        if (strcmp(userInput, "1") == 0) {
            printf("UNZip Ipa\n");
            NSString *ipapath = @"/Users/kaanarslan/Downloads/instagram.ipa";
                    
            NSString *folderpath = @"/Users/kaanarslan/Desktop/xmc";
                    
            BOOL done = [SSZipArchive unzipFileAtPath:ipapath toDestination:folderpath];
                    
                if (done) {
                        NSLog(@"[!] Done Sir ..  %@", folderpath);
                    } else {
                        NSLog(@"[!] Error ... :(");
                    }
        }
        // /Users/densor/Downloads/game.ipa
        if (strcmp(userInput, "2") == 0) {
            system("clear");
            NSString *ipa = @"/Users/densor/Desktop/xmc/2.0.2den.ipa"; // Ipa Path
            NSFileManager *filemee = [NSFileManager defaultManager];
            NSString *temp = NSTemporaryDirectory();
            NSString *temp2 = [temp stringByAppendingPathComponent:@"ExtractedApp"];
            [filemee createDirectoryAtPath:temp2 withIntermediateDirectories:YES attributes:nil error:nil];
            
            NSTask *unzip = [[NSTask alloc] init];
            [unzip setLaunchPath:@"/usr/bin/unzip"];
            [unzip setArguments:@[ipa, @"Payload/*.app/Info.plist"]];
            [unzip setCurrentDirectoryPath:temp2];
            [unzip launch];
            [unzip waitUntilExit];
            
            NSString *plistPath = [temp2 stringByAppendingPathComponent:@"Payload/Agar.io.app/Info.plist"];
            NSDictionary *getinfo = [NSDictionary dictionaryWithContentsOfFile:plistPath];
            NSString *name = getinfo[@"CFBundleDisplayName"];
            NSString *version = getinfo[@"CFBundleShortVersionString"];
            NSString *bundle = getinfo[@"CFBundleIdentifier"];
            NSString *minimumos = getinfo[@"MinimumOSVersion"];
            
            NSLog(@"App Name: %@", name);
            NSLog(@"App Version: %@", version);
            NSLog(@"Bundle: %@",bundle);
            NSLog(@"Minimum OS Version: %@",minimumos);
            
            [filemee removeItemAtPath:temp2 error:nil];
        }
        if (strcmp(userInput, "3") == 0){
            system("clear");
            NSString *ipapath = @"/Users/densor/Downloads/game.ipa"; // Ipa Path
            NSFileManager *fileman = [NSFileManager defaultManager];
            NSString *tempd = NSTemporaryDirectory();
            NSString *tem = [tempd stringByAppendingPathComponent:@"ExtractedApp"];
            [fileman createDirectoryAtPath:tem withIntermediateDirectories:YES attributes:nil error:nil];

            NSTask *unzip = [[NSTask alloc] init];
            [unzip setLaunchPath:@"/usr/bin/unzip"];
            [unzip setArguments:@[ipapath, @"Payload/*.app/Info.plist"]];
            [unzip setCurrentDirectoryPath:tem];
            [unzip launch];
            [unzip waitUntilExit];

            NSString *plistpath = [tem stringByAppendingPathComponent:@"Payload/Agar.io.app/Info.plist"];
            NSMutableDictionary *info = [NSMutableDictionary dictionaryWithContentsOfFile:plistpath];
            NSString *nameipa = @"NameOfIpa"; // Name For Ipa
            NSString *newappname = @"DeNxx"; // New Name
            info[@"CFBundleDisplayName"] = newappname;

            [info writeToFile:plistpath atomically:YES];

            NSString *folderpath = @"/Users/densor/Desktop/xmc"; // Folder Path
            [fileman createDirectoryAtPath:folderpath withIntermediateDirectories:YES attributes:nil error:nil];

            NSString *ipanamepath = [NSString stringWithFormat:@"%@.ipa", nameipa];
            NSString *path = [folderpath stringByAppendingPathComponent:ipanamepath];

            NSTask *zip2 = [[NSTask alloc] init];
            [zip2 setLaunchPath:@"/usr/bin/zip"];
            [zip2 setArguments:@[@"-qry", path, @"."]];
            [zip2 setCurrentDirectoryPath:tem];
            [zip2 launch];
            [zip2 waitUntilExit];

            NSLog(@"[-] Done Sir .. %@", path);
            
            [fileman removeItemAtPath:tem error:nil];

        }
        if (strcmp(userInput, "4") == 0){
            system("clear");
            NSString *ipapath = @"/Users/densor/Downloads/game.ipa"; // Ipa Path
            NSFileManager *fileman = [NSFileManager defaultManager];
            NSString *tempd = NSTemporaryDirectory();
            NSString *tem = [tempd stringByAppendingPathComponent:@"ExtractedApp"];
            [fileman createDirectoryAtPath:tem withIntermediateDirectories:YES attributes:nil error:nil];

            NSTask *unzip = [[NSTask alloc] init];
            [unzip setLaunchPath:@"/usr/bin/unzip"];
            [unzip setArguments:@[ipapath, @"Payload/*.app/Info.plist"]];
            [unzip setCurrentDirectoryPath:tem];
            [unzip launch];
            [unzip waitUntilExit];

            NSString *plistpath = [tem stringByAppendingPathComponent:@"Payload/Agar.io.app/Info.plist"];
            NSMutableDictionary *info = [NSMutableDictionary dictionaryWithContentsOfFile:plistpath];
            NSString *nameipa = @"NameOfIpa"; // Name For Ipa
            NSString *newVersion = @"2.99.0"; // New Version
            info[@"CFBundleShortVersionString"] = newVersion;

            [info writeToFile:plistpath atomically:YES];

            NSString *folderpath = @"/Users/densor/Desktop/xmc"; // Folder Path
            [fileman createDirectoryAtPath:folderpath withIntermediateDirectories:YES attributes:nil error:nil];

            NSString *ipanamepath = [NSString stringWithFormat:@"%@.ipa", nameipa];
            NSString *path = [folderpath stringByAppendingPathComponent:ipanamepath];

            NSTask *zip2 = [[NSTask alloc] init];
            [zip2 setLaunchPath:@"/usr/bin/zip"];
            [zip2 setArguments:@[@"-qry", path, @"."]];
            [zip2 setCurrentDirectoryPath:tem];
            [zip2 launch];
            [zip2 waitUntilExit];
            
            NSLog(@"[-] Done Sir .. %@", path);
            
            [fileman removeItemAtPath:tem error:nil];
        }
        if (strcmp(userInput, "5") == 0){
            system("clear");
            NSString *ipapath = @"/Users/densor/Downloads/game.ipa"; // Ipa Path
            NSFileManager *fileman = [NSFileManager defaultManager];
            NSString *tempd = NSTemporaryDirectory();
            NSString *tem = [tempd stringByAppendingPathComponent:@"ExtractedApp"];
            [fileman createDirectoryAtPath:tem withIntermediateDirectories:YES attributes:nil error:nil];

            NSTask *unzip = [[NSTask alloc] init];
            [unzip setLaunchPath:@"/usr/bin/unzip"];
            [unzip setArguments:@[ipapath, @"Payload/*.app/Info.plist"]];
            [unzip setCurrentDirectoryPath:tem];
            [unzip launch];
            [unzip waitUntilExit];

            NSString *plistpath = [tem stringByAppendingPathComponent:@"Payload/Agar.io.app/Info.plist"];
            NSMutableDictionary *infoDictionary = [NSMutableDictionary dictionaryWithContentsOfFile:plistpath];
            NSString *nameipa = @"NameOfIpa"; // Name For Ipa
            NSString *newbundle = @""; // Neew Bundle
            infoDictionary[@"CFBundleShortVersionString"] = newbundle;

            [infoDictionary writeToFile:plistpath atomically:YES];

            NSString *folderpath = @"/Users/densor/Desktop/xmc"; // Folder Path
            [fileman createDirectoryAtPath:folderpath withIntermediateDirectories:YES attributes:nil error:nil];

            NSString *ipanamepath = [NSString stringWithFormat:@"%@.ipa", nameipa];
            NSString *path = [folderpath stringByAppendingPathComponent:ipanamepath];

            NSTask *zip2 = [[NSTask alloc] init];
            [zip2 setLaunchPath:@"/usr/bin/zip"];
            [zip2 setArguments:@[@"-qry", path, @"."]];
            [zip2 setCurrentDirectoryPath:tem];
            [zip2 launch];
            [zip2 waitUntilExit];

            NSLog(@"[-] Done Sir .. %@", path);
            
            [fileman removeItemAtPath:tem error:nil];
        }
        if (strcmp(userInput, "6") == 0){
            exit(0);
        }
        return 0;
    }
}
