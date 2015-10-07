use strict;

use Test::More tests => 3;
use Test::Mojo;

my $t = Test::Mojo->new('NephologyServer');
$t->ua->max_redirects(1);

$t->get_ok('/')->status_is(200)->content_like(qr/Welcome to Nephology/);
print $t;
