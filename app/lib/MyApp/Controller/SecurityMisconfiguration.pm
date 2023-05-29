package MyApp::Controller::SecurityMisconfiguration;

use Mojo::Base 'Mojolicious::Controller';

# Action with security misconfiguration vulnerability
sub access_sensitive_data {
    my $self = shift;

    # Access sensitive data without proper authorization checks
    my $data = $self->app->get_sensitive_data();

    # Render the sensitive data
    $self->render(json => $data);
}

1;
