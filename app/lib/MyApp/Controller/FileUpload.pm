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

sub upload_svg {
    my $self = shift;

    # Get uploaded file
    my $file = $self->req->upload('svg_file');
    unless ($file) {
        $self->render(text => 'No file uploaded');
        return;
    }

    # Save the uploaded file
    my $filename = $file->filename;
    my $path = $self->app->home->rel_file("public/uploads/$filename");
    $file->move_to($path);

    # Process the SVG file
    my $svg_content = $file->slurp;
    $self->render_svg($svg_content);
}

sub render_svg {
    my ($self, $svg_content) = @_;

    # Render the SVG file in a template
    $self->render(template => 'render_svg', svg_content => $svg_content);
}

1;
