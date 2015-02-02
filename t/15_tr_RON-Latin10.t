use strict;
require 5.008;
use utf8;
use Encode;
use Test::More tests => 2;

my $name	=   "RON-Latin10";

# Taken from http://www.unhchr.ch/udhr/lang/rum.htm
my $input	= "Fiecare om se poate prevala de toate drepturile şi ".
		  "libertăţile proclamate în prezenta Declaraţie fără ".
		  "nici un fel de deosebire ca, de pildă, deosebirea ".
		  "de rasă, culoare, sex, limbă, religie, opinie ".
		  "politică sau orice altă opinie, de origine ".
		  "naţională sau socială, avere, naştere sau orice ".
		  "alte împrejurări.";  

my $output_ok	= "Fiecare om se poate prevala de toate drepturile și ".
		  "libertățile proclamate în prezenta Declarație fără ".
		  "nici un fel de deosebire ca, de pildă, deosebirea ".
		  "de rasă, culoare, sex, limbă, religie, opinie ".
		  "politică sau orice altă opinie, de origine ".
		  "națională sau socială, avere, naștere sau orice ".
		  "alte împrejurări."; 

use Lingua::Translit;

my $tr = new Lingua::Translit($name);

# 1
is($tr->can_reverse(), 0, "$name: is not reversible");

my $o = $tr->translit($input);

# 2
is($o, $output_ok, "$name: UDOHR transliteration");

