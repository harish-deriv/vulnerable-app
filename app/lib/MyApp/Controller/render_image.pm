package MyApp::Controller::FileRender;

use Mojo::Base 'Mojolicious::Controller';

sub render_file {
    my $self = shift;

    # Get the filename from the query parameter
    my $filename = $self->param('filename');

    # Validate the filename
    unless ($filename) {
        $self->render(text => 'No filename specified');
        return;
    }

    # Define the file path
    my $file_path = "/var/www/html/$filename";

    # Check if the file exists
    unless (-e $file_path && -f _) {
        $self->render(text => 'File not found');
        return;
    }

    # Render the file in the template
    $self->render(template => 'render_image', file_path => $file_path);
}

1;
