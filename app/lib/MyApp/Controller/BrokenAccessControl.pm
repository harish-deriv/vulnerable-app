package MyApp::Controller::BrokenAccessControl;

use Mojo::Base 'Mojolicious::Controller';

# Action with broken access control vulnerability
sub view_user_profile {
    my $self = shift;

    my $user_id = $self->param('user_id');
    my $current_user_id = $self->session('user_id');

    # Check if the current user is authorized to view the profile
    if ($user_id eq $current_user_id) {
        # Fetch and render the user profile
        $self->render(text => "User profile for user $user_id");
    } else {
        # Access denied
        $self->render(text => 'Access denied');
    }
}

1;
