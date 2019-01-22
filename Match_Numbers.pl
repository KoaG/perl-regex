#!/usr/bin/perl -w
use strict;

my $reg = qr/(?&BigNumber)([\s](?&Decimals))?
    (?(DEFINE)
        (?<one_to_9>
            (f(ive|our)
            |s(even|ix)
            |t(hree|wo)
            |(ni|o)ne
            |eight))
        (?<ten_to_19>
            (((s(even|ix)
                |f(our|if)
                |nine)te
                |e(ighte|lev)
                )en
            |t((hirte)?en|welve)))
        (?<two_digit_prefix>
            (s(even|ix)
            |t(hir|wen)
            |f(if|or)
            |eigh|nine)
            ty)
        (?<one_to_99>
            (?&two_digit_prefix)
            ([\s](?&one_to_9))?
            |(?&ten_to_19)
            |(?&one_to_9))
        (?<one_to_999>
            (?&one_to_9)[\s]hundred
            ([\s](and[\s])?
            (?&one_to_99))?
            |(?&one_to_99))
        (?<one_to_999_999>
            (?&one_to_999)[\s]thousand
            ([\s](?&one_to_999))
            |(?&one_to_999))
        (?<one_to_999_999_999>
            (?&one_to_999)[\s]million
            ([\s](?&one_to_999_999))?
            |(?&one_to_999_999))
        (?<one_to_999_999_999_999>
            (?&one_to_999)[\s]billion
            ([\s](?&one_to_999_999_999))?
            |(?&one_to_999_999_999))
        (?<one_to_999_999_999_999_999>
            (?&one_to_999)[\s]trillion
            ([\s](?&one_to_999_999_999_999))?
            |(?&one_to_999_999_999_999))
        (?<BigNumber>
            zero
            |(?&one_to_999_999_999_999_999))
        (?<zero_to_9>
            (?&one_to_9)
            |zero)
        (?<Decimals>point
            ([\s](?&zero_to_9))+)
    )/xn;

my $num = "'nine hundred ninety nine trillion'";
if($num =~ /\'$reg\'/){
    print "Matched" ;
}