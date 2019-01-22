#!/usr/bin/perl -w

# using strict turns on strict pragma which 
# will make you declare your variables with my keyword.
use strict; 

# Scalars : can stored only one element of any kind
# $<variable_name>
# scope of variables my, local, global

my $var_int = 1; #An int scalar
my $var_string = "Hello"; #Strings 
my $var_float = 3.14; #Float scalar
my $var_s = 'String Literally $var_float';
my $var_d = "String with $var_float \n";

print $var_s;
print $var_d;

if(1){
    my $var_int = 5;
    print "var_int is $var_int \n";
}
print "var_int is $var_int \n";

my $var_h = $var_string.", World! \n";
print $var_h;

# Perl Array 
# @<array_name>
# using qw (quote word)
my @perl_array = qw(a b c d);
print "@perl_array \n";

my @numbers = (1..10);
print "@numbers\n";
my $size = scalar(@numbers);
print "Array size = $size \n";

my $long_string = "Goodbye! to a world, tada!";

# split('delimiter', list) removes delimiter completely
my @dyn_arr = split('a',$long_string);

# foreach to iterate thru each element of list or array
foreach(@dyn_arr){
    print "$_ \n"; # Special variable storing the current value
}

# autovivification - sometimes I'm straight up sometimes I'm fucked up
my @fck_pc;
$fck_pc[3] = 3;
# fck_pc[0] to fck_pc[1] are initialized as undef
print "@fck_pc \n";
# To make your pc go boom uncomment the next line
# fck_pc[100000000000000000000] = "FUCK";

# push, pop, shift, unshift
# push, pop operates at end of array
# shift, unshift at the start

push(@numbers, 11);
print "pushed 11 : @numbers \n";
pop(@numbers);
pop(@numbers);
print "last 2 element poped : @numbers \n";
shift(@numbers);
print "First element removed : @numbers \n";
unshift(@numbers, 'a');
print "Added 'a' to start of array : @numbers \n";

# perl hash (not the hash hash)
# %<hash_name>
my %hash_ex = ( 
    "aplha" => 1,
    "beta" => 2,
    "gamma" => 3,
    );
print "%hash_ex \n";
print "Not what expected?? \n";
# loop to the rescue or Data::Dumper (makes code slow, don't use for production)
use Data::Dumper;
print  Dumper(\%hash_ex);

# Adding new element to hash, if same key - mutation else new hash element
$hash_ex{'delta'} = 4;
print Dumper(\%hash_ex);

# delete keyword, can be used to delete hash entry
delete $hash_ex{'delta'};

# print hash as array (order may vary)
my @hash_arr = %hash_ex;
print "@hash_arr \n";

# getting hash keys and values
# don't forget my keyword
my @key_arr = keys(%hash_ex);
my @val_arr = values(%hash_ex);

print "@key_arr \n @val_arr \n";

# Perl conditional statements, finally!
# (condition) ? <if_true> : <if_false>
my $a = 1;
my $b = 2;
my $c = 3;
my $d = ($a == 1) ? 4 : 5; 
my $e = ($a == 0) ? 1 
      : ($b == 1) ? 2
      : ($c == 2) ? 3
      : ($d == 3) ? 4
      : 5;
print "e = $e \n";
# if else equivalent of above conditions
if ($a == 1){ $d = 4; }
else{ $d = 5; }

if ($a == 0){ $e = 1; }
elsif ($b == 1){ $e = 2; }
elsif ($c == 2){ $e = 3; }
elsif ($d == 3){ $e = 4; }
else { $e = 5; }

# unless - opposite of if (why?? is 'if' not enough??)
unless ($a == 0){
    print "a is not equal to 0 \n";
}

# loops 
# foreach - refer dynamic array example
# for loop 
for (my $n = 0 ; $n < 4 ; $n++){
    print "n = $n \n";
}
for (0..4){
    print "$_ \n";
}
# noticed the difference??

# using foreach for printing hash
foreach my $key (keys %hash_ex){
    print " $key contains $hash_ex{$key} \n";
}

# while loop - time to play
my $lucky_num = 14;
my $guess = 0;
print "Guess a number between 0 and 20 : ";
$guess = <STDIN>; # to get input from the user  
while ($guess != $lucky_num) {
    print "Guess a number between 0 and 20 : ";
    $guess = <STDIN>; # come on you know it still? xD  
}
print "you guessed it or anyways \n";

# do - while
do {
    $guess--;
} while ($guess >= 4);
print "guess is now $guess \n";

# until and do-until, more loops WTF!
# until is like unless
my $ter_loop = "close";
until ($ter_loop ne "close"){ # executes till condition is false
    print "Enter close to terminate (until) : ";
    $ter_loop = <STDIN>;
    chomp($ter_loop); # removes new line character
}
print "haha xD, you are not reading comments, no problem lets move to next loop \n";
do {
    print "Enter close to terminate (do-until) : ";
    $ter_loop = <STDIN>;
    chomp($ter_loop); # removes new line character
} until ($ter_loop eq "close");