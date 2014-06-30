package LookupKey::Manager;

use strict;
use Rose::DB::Object::Manager;
use base 'Rose::DB::Object::Manager';

sub object_class { 'LookupKey' }
__PACKAGE__->make_manager_methods('lookup_keys');

1;
