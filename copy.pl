#!/usr/bin/perl

#This perl script copies data from one directory to another if the data arrived within the last 6 minutes.
#To change the time, change $mintues 


use strict;
use warnings;

umask(001);
my $origDir = “WHERE THE DATA IS YOU WANT TO COPY“;
my $newDir = “WHERE YOU WANT TO COPY THE DATA TO“;
my $minutes = "6";
my $file;

  print "Dir $origDir\n”;
  if(chdir("$origDir”)){
     opendir(DIR,"$origDir”);
     my @files = readdir(DIR);
     closedir(DIR);
     foreach $file (@files){
        if(time - (stat "$file") [9] < $minutes * 60){
          print "$file\n";
          use File::Copy qw(copy);
          copy "$file", "$newDir/$file";
        }
     }
  }
