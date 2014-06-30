package KeyParam::Manager;

use strict;
use Rose::DB::Object::Manager;
use base 'Rose::DB::Object::Manager';

sub object_class { 'KeyParam' }
__PACKAGE__->make_manager_methods('key_params');

1;
