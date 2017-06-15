#!/usr/bin/perl -w
use FindBin qw($RealBin);
use lib "$RealBin/lib";
use RdChecker qw(check_for_secret_episode);

my ($message, $return_value) = check_for_secret_episode;
print $message;
exit $return_value;
