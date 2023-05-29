package MyApp::Controller::XMLExternalEntities;

use Mojo::Base 'Mojolicious::Controller';
use XML::LibXML;

# Action with XML External Entities (XXE) vulnerability
sub parse_xml {
    my $self = shift;

    my $xml = $self->param('xml');

    # Parse the XML with an insecure XML parser
    my $parser = XML::LibXML->new();
    my $doc = $parser->parse_string($xml);

    # Process the XML data
    # ...
}

1;
