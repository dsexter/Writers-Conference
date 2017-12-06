#!usr/bin/perl
use strict;
#Written by David Sexter
#this will go through the registry file and look for the target querey, for now it is done by getting input from stdin
#for ease of testing purposes.
#todo: alter it to get the target from command line arguments (@ARGV)
#todo: have the website call this script to with command line arg of the search querey and have it return the record(s)
#todo: add in links to the registry file

my($querey, $input, $exit); #declare variables
$exit = 0; #is 1 when the program should exit, 0 when it still needs to run
while($exit != 1) #while we dont want to exit
{
   print "What would you like to search for? enter -1 to quit ";  #get the querey, will be from @ARGV in future
   $querey = <STDIN>; #gets input from stdin
   chomp($querey); #removes the new line character
   if($querey eq "-1") #if it is the exit condition
   {
      $exit = 1; #set exit condition
   }
   open(INPUT, "<conference-sessions.csv") or die("Error opening file\n");  #open the file or print the error message and exit
   while(($exit == 0) and (eof(INPUT) != 1)) #while we dont want to exit and not at the end of file
   {
      $input = <INPUT>; #get the next line in the file
      if($input =~ /$querey/i) #if the line contains the given querey
      {
         print "$input\n"; #display the results, will in future store the data in data structure to return to the website
      }
   }
   close(INPUT) or die("Error closing file\n"); #close the file
}