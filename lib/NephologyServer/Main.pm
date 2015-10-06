package NephologyServer::Main;

use strict;
use Mojo::Base 'Mojolicious::Controller';

sub welcome {
	my $self = shift;
	return $self->redirect_to('/index.html');
}
