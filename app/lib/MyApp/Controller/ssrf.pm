package MyApp::Controller::Vulnerable;

use Mojo::Base 'Mojolicious::Controller';

sub ssrf {
    my $self = shift;

    my $url = $self->param('url');
    my $response = $self->ua->get($url)->res->text if $url;
    $self->render(text => $response);
}
1;
