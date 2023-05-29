package MyApp::Controller::SensitiveDataExposure;

use Mojo::Base 'Mojolicious::Controller';

# Action with sensitive data exposure vulnerability
sub get_user_details {
    my $self = shift;

    my $user_id = $self->param('user_id');

    # Fetch user details without proper authorization checks
    my $user = $self->app->db->select('users', ['id', 'username'], { id => $user_id })->hash;

    # Render the user details
    $self->render(json => $user);
}

1;
