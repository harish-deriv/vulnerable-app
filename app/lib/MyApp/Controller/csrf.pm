package MyApp::Controller::CSRF;

use Mojo::Base 'Mojolicious::Controller';

# Action with CSRF vulnerability
sub transfer_money {
    my $self = shift;

    my $recipient = $self->param('recipient');
    my $amount    = $self->param('amount');

    # Insecure transfer logic
    # Simulating a money transfer without proper CSRF protection
    # This code is vulnerable to CSRF attacks
    $self->app->log->info("Transferring $amount to $recipient");

    # Display transfer confirmation message
    $self->render(template => 'transfer_confirmation', recipient => $recipient, amount => $amount);
}

1;
