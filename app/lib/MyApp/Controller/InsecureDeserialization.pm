package MyApp::Controller::InsecureDeserialization;

use Mojo::Base 'Mojolicious::Controller';

# Action with insecure deserialization vulnerability
sub unserialize_data {
    my $self = shift;

    my $serialized_data = $self->param('data');

    # Insecure deserialization of user-supplied data
    my $object = deserialize($serialized_data);

    # Process the deserialized object
    # ...
}

sub deserialize {
    my ($data) = @_;

    # Insecure deserialization implementation
    my $object = eval($data);

    return $object;
}

1;
