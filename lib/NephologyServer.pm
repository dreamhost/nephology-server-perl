package NephologyServer;

use strict;

use Mojo::Base 'Mojolicious';
use Mojolicious::Plugin::Mount;

sub startup {
	my $self = shift;
	my $r = $self->routes;

	$r->get('/')->to(
		controller => 'example',
		action     => 'welcome',
        );

	# Boot
	$r->get('/boot/:boot_mac')->to(
		controller => 'boot',
		action     => 'lookup_machine',
	);

	# Install
	$r->get('/install/:boot_mac/:rule')->to(
		controller => 'install',
		action     => 'set_rule',
	);
	$r->get('/install/:boot_mac')->to(
		controller => 'install',
		action     => 'install_machine',
	);

	# Discovery
	$r->post('/install/:boot_mac')->to(
		controller => 'install',
		action 	   => 'discovery',
	);

	# Info
	$r->get('/info/:boot_mac/:key_name/:param_name')->to(
		controller => 'install',
		action     => 'info',
	);

        $self->plugin(Mount => {'/webui' => 'bin/nephology-webui'});
}

1;
