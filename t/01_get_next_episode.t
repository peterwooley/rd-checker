use strict;
use warnings;

use Test::Simple tests => 1;
use Scalar::Util qw(looks_like_number);
use RdChecker qw(get_next_episode);

ok(looks_like_number get_next_episode);
