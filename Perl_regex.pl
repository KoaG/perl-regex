#!/usr/bin/perl -w
use strict; 
use Data::Dumper;

# Regex.md for enlightenment

my $var1 = "Perl RegEx is awesome";

# Anchors
my $Start = $var1 =~ m/^perl/;
my $End = $var1 =~ m/awesome$/; 
print "$Start, $End \n";

my $var2 = "abbc.";
# Backlash
my $Dot = $var2 =~ m/\./;
print "$Dot \n";
# Character Class
my $CC1 = $var2 =~ m/ab{1}c/;
my $CC2 = $var2 =~ m/ab{1,}/;
my $CC3 = $var2 =~ m/b{1,3}/;
print "$CC1, $CC2, $CC3 \n";
# Dot
print "abb<any char> present \n" if($var2 =~ m/ab{2}./);
# Grouping
print "either of abc or bbc present \n" if($var2 =~ m/abc|bbc/);
print "ab(c|bc) -> abc or abbc \n" if($var2 =~ m/ab(c|bc)/);
# Repitition
my $var3 = "acd";
print "ab*cd \n" if($var3 =~ m/ab*cd/);
print "ab+cd \n" if($var3 =~ m/ab+cd/);
print "ab?cd \n" if($var3 =~ m/ab?cd/);
print "ab{0,1}cd \n" if($var3 =~ m/ab{0,1}cd/);

my $Para = 
"Sunflowers waiting for sunshine. \n
Violets just waiting for dew. \n
Bees just waiting for honey \n
And honey, I'm just waiting for you!";

# sunshine -> Sunshine (Substitution)
$Para =~ s/sunshine/Sunshine/;
print "$Para \n";
# Transliteration
$Para =~ tr/s/S/; # All the small 's' are capitalized
print "$Para \n";
# Count number of es
my $no_of_es = () = $Para =~ /e/gi;
print "$no_of_es \n";
my $r = "abcDEa";
my $t = $r =~ s/a/X/gr;
print "$t";