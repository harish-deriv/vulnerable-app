package MyApp::Controller::XSS;

use Mojo::Base 'Mojolicious::Controller';

# Action with Cross-Site Scripting (XSS) vulnerability
sub display_message {
    my $self = shift;

    my $message = $self->param('message');

    # Render the message without proper HTML escaping
    $self->render(text => "Message: $message");
}

1;
