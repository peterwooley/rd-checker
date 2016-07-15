package RdChecker;
use strict;
use warnings;

use LWP::Simple qw(head);
use LWP::UserAgent;
use XML::XPath;

use base 'Exporter';
our @EXPORT_OK = qw(get_next_episode check_for_secret_episode);

# Adapted from http://stackoverflow.com/q/21654059/1245595
sub get_next_episode {
  my $feed_url = "https://www.relay.fm/rd/feed";
  my $ua = LWP::UserAgent->new(ssl_opts => { verify_hostname => 0 });
  $ua->agent("rd-checker");
  my $response = $ua->get($feed_url);
  my $xml = $response->content;
  my $xpath = XML::XPath->new(xml => $xml);
  my $latest = scalar(@{$xpath->findnodes('/rss/channel/item')});
  return ++$latest;
}

sub check_for_secret_episode {
  my $ep = shift // get_next_episode();
  my $padded_ep = sprintf "%0*d", 3, $ep;
  my $url = "http://traffic.libsyn.com/recdiffs/Reconcilable_Differences_$padded_ep.mp3";

  # Taken from http://stackoverflow.com/a/11448973/1245595
  if (head($url)) {
    return ("Episode $ep has been uploaded early. Listen at $url\n", 0);
  } else {
    return ("Episode $ep has not been uploaded yet.\n", 1);
  }
}
