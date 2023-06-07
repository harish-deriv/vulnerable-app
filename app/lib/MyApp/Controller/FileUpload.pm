package MyApp::Controller::FileUpload;

use Mojo::Base 'Mojolicious::Controller';

sub upload {
    my $self = shift;

    # Get the uploaded file
    my $file = $self->req->upload('file');

    # Check if a file was uploaded
    unless ($file) {
        $self->render(text => 'No file uploaded');
        return;
    }

    # Save the file
    my $filename = $file->filename;
    $file->move_to("/var/www/html/$filename");

    # Render a success message
    $self->render(text => 'File uploaded successfully');
}

1;
