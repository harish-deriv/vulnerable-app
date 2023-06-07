package MyApp::Controller::Vulnerable;

use Mojo::Base 'Mojolicious::Controller';

sub open_redirect {
    my $self = shift;

    my $redirect_url = $self->param('url');
    $self->redirect_to($redirect_url) if $redirect_url;
}

1;
