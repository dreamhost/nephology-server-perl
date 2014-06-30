package LookupKey;

use strict;
use NephologyServer::DB;

use base qw(Rose::DB::Object);

__PACKAGE__->meta->setup
(
	table => 'lookup_key',
	columns => [
		id => {
			type        => 'int',
			length      => 11,
			primary_key => 1,
			not_null    => 1,
		},
		key_name => {
			type     => 'varchar',
			length   => 64,
			not_null => 1,
		},
	],
);

sub init_db { NephologyServer::DB->new }
