package KeyParam;

use strict;
use NephologyServer::DB;

use base qw(Rose::DB::Object);

__PACKAGE__->meta->setup
(
	table => 'key_param',
	columns => [
		key_id => {
			type        => 'int',
			length      => 11,
			primary_key => 1,
			not_null    => 1,
		},
		param_name => {
			type     => 'varchar',
			length   => 64,
			not_null => 1,
		},
		param_value => {
			type     => 'text',
			not_null => 1,
		},
	],
);

sub init_db { NephologyServer::DB->new }
