package MyApp::Controller::BrokenAuth;

use Mojo::Base 'Mojolicious::Controller';

# Action with broken authentication vulnerability
sub login {
    my $self = shift;

    my $username = $self->param('username');
    my $password = $self->param('password');

    # Insecure authentication logic
    if ($username eq 'admin' && $password eq 'password') {
        # Successful authentication
        $self->render(text => 'Welcome, ' . $username);
    } else {
        # Failed authentication
        $self->render(text => 'Invalid credentials');
    }
}

1;
