use strict;
use warnings;

use Test::Simple tests => 2;
use RdChecker qw(check_for_secret_episode);

my (undef, $return_value_should_not_exist) = check_for_secret_episode -42;
ok($return_value_should_not_exist == 1);

my (undef, $return_value_should_exist) = check_for_secret_episode 12;
ok($return_value_should_exist == 0);
