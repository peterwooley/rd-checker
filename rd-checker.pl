#!/usr/bin/perl -w
use LWP::Simple qw(head);

my $ep = $ARGV[0] or die "Episode number not provided.\n";
my $paddedEp = sprintf "%0*d", 3, $ARGV[0];
my $url = "http://traffic.libsyn.com/recdiffs/Reconcilable_Differences_$paddedEp.mp3";

if (head($url)) {
  print "Episode $ep exists. Listen here: $url\n";
  exit 0;
} else {
  print "Episode $ep does not exist.\n";
  exit 1;
}
