#!/usr/bin/perl

use strict;
use warnings;

umask(001);
my $origDir = “WHERE THE DATA IS YOU WANT TO COPY“;
my $newDir = “WHERE YOU WANT TO COPY THE DATA TOO“;
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
