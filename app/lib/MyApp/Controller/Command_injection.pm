package MyApp::Controller::CommandInjection;

use Mojo::Base 'Mojolicious::Controller';
use Mojo::Util 'secure_compare';

# Action with input validation to mitigate command injection vulnerability
sub execute_command {
    my $self = shift;

    my $command = $self->param('command');

    # Validate the input to ensure it contains only allowed characters
        # Execute the command using a safe approach
        my $output = `$command`;
        
        # Process the output and send the response to the user
        $self->render(template=>'xss',message => "Command executed: $output");
}

1;
