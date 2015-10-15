package NephologyServer::Boot;

use strict;
use Mojo::Base 'Mojolicious::Controller';
use YAML;

use Node::Manager;
use NephologyServer::Config;
use NephologyServer::Validate;
use NodeStatus::Manager;

sub lookup_machine {
	my $self = shift;
	my $boot_mac = $self->stash('boot_mac');

	my $Config = NephologyServer::Config::config($self);
	my $Node = NephologyServer::Validate::validate($self,$boot_mac);
	my $NodeStatus = NodeStatus->new(status_id => $Config->{'default_node_status'});
	$NodeStatus->load;

	if ( $Node ) {
		$NodeStatus = $Node->status;
	}

    # stash before we render
	$self->stash("srvip" => $Config->{'server_addr'});
	if ($self->render(template => $NodeStatus->template, format => 'txt')) {
		if ($NodeStatus->next_status && $Node) {
			$Node->status_id($NodeStatus->next_status);
			unless ($Node->save()) {
				$self->render('json' => {'error' => 'Unable to update node ' . $boot_mac},
							status => 500);
			}
		}
	} else {
		$self->render('json' => {'error' => 'cannot render template ' . $NodeStatus->template},
					status => 500);
	}
}

1;
