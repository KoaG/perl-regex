# **Perl RegEx**
>_Some people, when confronted with a problem, think "I know, I'll use regular expressions." Now they have two problems._ 
## Table of Content
1. [Introduction](#intro)
    -  [Usage of RegEx](#uor)
2. [Binding Operators](#bop)
    -  [Using Binding Operators](#ubop)
        -   [For matching](#fm)
        -   [For Substitution](#fs)
        -   [For Transliteration](#ftr)
3. [Modifiers](#mod)
    -  [Using Modifiers](#umod)
4. [Metacharacters](#meta)
    -  [List of Metacharacters](#lom)  
    -  [Special notations](#sn)
5. [Examples of _RegEx_](#eor)
6. [Code Examples](#ce)
7. [References](#ref)

# Introduction<a name="intro"></a>
_RegEx_ or _Regular Expression_ is a powerful technique for describing search pattern, which can be used for searching, text processing and data validation.
With _RegEx_ large amount of data can be easily updated and with a single _RegEx_ pattern, a variety of data can be modified. Therefore, RegEx is a must have skill.
### **Usage of RegEx**<a name="uor"></a>
With help of _RegEx_ you can easily find matching pattern, replace or modify data and much more. \
_For example_, if you want to find the keyword _RegEx_, with all it's variants like _regex, Regex_, you could use the RegEx : **[Rr]eg[Ee]x**. Awesome!

# Binding Operators<a name="bop"></a>
The binding operators are used to search, modify and translate. There are two types of binding operators
- **=~** : Regular
- **!~** : Complimentary
### Using Binding Operators<a name="ubop"></a>
#### For matching<a name="fm"></a>
```perl
    $var = "String";
    $matchR = $var =~ m/abc/; #Returns False
    $matchC = $var !~ m/abc/; #Returns True
```
#### For Substitution<a name="fs"></a>
```perl
    $var = "String is too long";
    #Replace String with Word
    $sub = $var =~ s/String/Word/; 
```
#### For Transliteration<a name="ftr"></a>
```perl
    $var = "String is too long";
    #Replace S with 1, t with 2 and o with 3
    $sub = $var =~ tr/Sto/123/; 
```
# Modifiers<a name="mod"></a>
Modifiers changes the default behaviour for matching. The modifiers can be used as inline or as an option.
-   **m** \
    Treat string as multiline, _"^"_ and _"$"_ matches at starting and end of each line.
-   **s** \
    String as single line, _"."_ matches to _"\n"_ also.
-   **i** \
    Case-insensitive matching.
-   **x** and **xx** \
    Permits whitespace and comments in _RegEx_.
-   **n** \
    Prevents grouping from capturing.
-   **c** \
    Keep current position during repeated matching
-   **g** \
    Globally matches the pattern repeatedly.
-   **e** \
    Evaluate right-hand side as an expression.
-   **ee** \
    First evaluate right-hand side as string then as an expression.
-   **o** \
    Introduces bug in the name of optimization.
-   **r** \
    Returns a new value after substitution without affecting the original string.
## Using Modifiers<a name="umod"></a>
```perl
    $var = "abcdEFG";
    print "Matched" if($var =~ m/abcdefg/i);
    print "Matched" if($var =~ m/(?i)abcdefg/;
    $try = "aba bba";
    $first_match = $try =~ s/a/c/r; 
    #first_match = cba bba, try = aba bba
    $sec_match = $try =~ s/a/c/gr;
    #sec_match = cbc bbc
```
# Metacharacters<a name="meta"></a>
Metacharacters is a set of special symbols and characters that are used to define pattern. \
### _List of Metacharacters_<a name="lom"></a>
+ Anchors
    - **^**&nbsp;&nbsp;:&nbsp;&nbsp; Start of the string
    - **$**&nbsp;&nbsp;:&nbsp;&nbsp; End of the string 
+ Backslash
    - **\\**&nbsp;&nbsp;:&nbsp;&nbsp; Quote or special (literal)
+ Character Class
    - **[]**&nbsp;&nbsp;:&nbsp;&nbsp; Set of characters
+ Dot
    - **.**&nbsp;&nbsp;:&nbsp;&nbsp; Any character expect newline
+ Grouping
    - **|**&nbsp;&nbsp;:&nbsp;&nbsp; Alternative
    - **()**&nbsp;&nbsp;:&nbsp;&nbsp; Grouping; Storing \
    Each grouping part that matched inside goes to special variables : _$1, $2, .._ \
    In association with matching variables, there are backreferences _\g1, \g2, .._ which are used inside a Regex.
+ Repitition
    - **\***&nbsp;&nbsp;:&nbsp;&nbsp; Match 0 or more times
    - **+**&nbsp;&nbsp;:&nbsp;&nbsp; Match 1 or more times
    - **?**&nbsp;&nbsp;:&nbsp;&nbsp; Match 0 or 1 times or shortest match
    - **{}**&nbsp;&nbsp;:&nbsp;&nbsp; Repition Modifier
#### Special Notations<a name="sn"></a>
+ Single Characters (with backslash)
    - Tab **\t**
    - Newline **\n**
    - Return **\r**
    - Character with hex **\xhh** 
+ Matching
    - **\w** matches any single character classified as _word_ (alphanumeric or "_")
    - **\W** matches any non-word character
    - **\s** matches whitespace (tab, space, newline)
    - **\S** matches any non-whitespace character
    - **\d** matches any digit character (0-9)
    - **\D** matches any non-digit character
+ Character Class
    - **[abc]** matches any of the characters in the sequence
    - **[x-y]** matches any of the characters from x to y(inclusively) in the ASCII code
    - **[\char]** matches char (generally symbol)
    - **[^abc]** matches character except abc

# Examples of _RegEx_<a name="eor"></a>

| expression | matches... |
|:----------:|---------------------------------------------------------------------------|
| abc | abc (that exact character sequence, but anywhere in the string) |
| ^abc | abc at the beginning of the string |
| abc$ | abc at the end of the string |
| a\|b | either of a and b |
| ^abc\|abc$ | the string abc at the beginning or at the end of the string |
| ab{2,4}c | an a followed by two, three or four b’s followed by a c |
| ab{2,}c | an a followed by at least two b’s followed by a c |
| ab*c | an a followed by any number (zero or more) of b’s followed by a c |
| ab+c | an a followed by one or more b’s followed by a c |
| ab?c | an a followed by an optional b followed by a c; that is, either abc or ac |
| a.c | an a followed by any single character (not newline) followed by a c |
| a\\.c | a.c exactly |
| [abc] | any one of a, b and c |
| [Aa]bc | either of Abc and abc |

# Code Examples<a name="ce"></a>
## Basic RegEx 
```perl
    #!/usr/bin/perl -w
    use strict;
    my %chars;
    my $Para = 
    "Sunflowers waiting for sunshine. \n
    Violets just waiting for dew. \n
    Bees just waiting for honey \n
    And honey, I'm just waiting for you!";

    # Matches 'for'
    print "Matched \n"
        if ($Para =~ m/for/);
    # Matches 'And' at start of string 
    print "Does not match \n"
        if ($Para =~ m/^And/);
    # Matches 'And' at start of each line
    print "Matches (using modifiers) \n"
        if ($Para =~ m/^And/m);
    
    my $group = "abcd";
    # Grouping captures matched strings
    #            1 2   3  4
    $group =~ m/(a(b|c)(c(d)))/;
    print "$1, $2, $3, $4 \n";

    # Converts lowercase alphabets range [a to m]
    # to uppercase
    $Para =~ tr/[a-m]/[A-M]/;
    print "$Para \n";

    # Counts frequency of uppercase alphabets
    $Para =~ s/([A-Z])/$chars{$1}++;$1/eg;
    print "Frequency of '$_' : $chars{$_} \n"
        foreach (sort{$chars{$b} <=> $chars{$a}}
        keys %chars);
    # If we use "m/avi/" then all four words will 
    # be matched - not GOOD!
    # lookahead(?=) and lookbehind(?<=) to match
    # whitespaces to match 
    my $x = "tavi avi pavi a-avi";
    print "Found avi" 
        if ($x =~ m/(?<=\s)avi(?=\s)/);
```
### Output
```
    Matched
    Matches (using modifiers)
    
    abcd, b, cd, d
    
    SunFLowErs wAItInG For sunsHInE.
    VIoLEts Just wAItInG For DEw.
    BEEs Just wAItInG For HonEy
    AnD HonEy, I'M Just wAItInG For you!
    
    Frequency of 'I' : 11
    Frequency of 'E' : 8
    Frequency of 'F' : 5
    Frequency of 'A' : 5
    Frequency of 'G' : 4
    Frequency of 'J' : 3
    Frequency of 'H' : 3
    Frequency of 'D' : 2
    Frequency of 'L' : 2
    Frequency of 'M' : 1
    Frequency of 'S' : 1
    Frequency of 'B' : 1
    Frequency of 'V' : 1

    Found avi
```
## Validation of contacts
```perl
    #!/usr/bin/perl -w-
    use strict;

    # RegEx using DEFINE block
    my $reg = 
    qr/^(?&first_name)[\s]*(?&last_name)[\s]*(?&phone_number)$
    (?(DEFINE)  
        # first_name matches any number ofalphabets
        (?<first_name>      
            ([a-zA-Z]+))
        # first_name matches any number of alphabets
        (?<last_name>
            ([a-zA-Z]+))    
        (?<phone_number>
            ((\+?(\d{1,3}))?    # matches country code if present
            (\-)?   # matches "-" between country code and number
            (\d{10})))  # matches 10 digit for a valid phone number
    )/xn; # used modifier x for free spacing

    # Test contacts hash
    my %contact = (
        "cont1" => "John Doe +81-9876543210",
        "cont2" => "John +81-9876543210",
        "cont3" => "John Doe +81-123",
        "cont4" => "Jo123hn Doe +81-9876543210",
        "cont5" => "John Doe +819876543210",
        "cont6" => "John   Doe   9876543210",
    );

    # validating each contact
    foreach my $key (keys %contact){
        print " $key : $contact{$key} is ";
        if ($contact{$key} =~ $reg) {
            print "valid \n";
        }
        else {
            print "invalid \n";
        }
    }
```
### Output
```
    cont4 : Jo123hn Doe +81-9876543210 is invalid
    cont5 : John Doe +819876543210 is valid
    cont3 : John Doe +81-123 is invalid
    cont2 : John +81-9876543210 is valid
    cont1 : John Doe +81-9876543210 is valid
    cont6 : John   Doe   9876543210 is valid
```
# References<a name="ref"></a>
1.  [Regular expressions in Perl](http://jkorpela.fi/perl/regexp.html)
2.  [RegexBuddy](https://www.regexbuddy.com/regex.html)
3.  [SEO's Guide to RegEx](https://moz.com/blog/an-seos-guide-to-regex)
