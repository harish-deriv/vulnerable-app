package MyApp::Controller::SQLInjection;

use Mojo::Base 'Mojolicious::Controller';

# Action for user authentication
sub login {
    my $self = shift;
    
    my $username = $self->param('username');
    my $password = $self->param('password');

    # Construct SQL query using placeholders
    my $query = "SELECT * FROM users WHERE username = ? AND password = ?";
    
    # Execute the SQL query with user-supplied values
    my $result = $self->app->db->query($query, $username, $password)->hash;

    if ($result) {
        # Authentication successful
        $self->session(username => $username);
        $self->render(text => 'Welcome, ' . $self->session('username'));
    } else {
        # Authentication failed
        $self->render(text => 'Invalid credentials');
    }
}

# Action for blind SQL injection
sub blind_sql_injection {
    my $self = shift;

    my $id = $self->param('id');

    # Construct SQL query with blind SQL injection vulnerability
    my $query = "SELECT * FROM users WHERE id = $id";
    my $result = $self->app->db->query($query)->hash;

    if ($result) {
        # User found
        $self->render(text => 'User exists');
    } else {
        # User not found
        $self->render(text => 'User does not exist');
    }
}

# Action for union-based SQL injection
sub union_based_sql_injection {
    my $self = shift;

    my $category = $self->param('category');

    # Construct SQL query with union-based SQL injection vulnerability
    my $query = "SELECT * FROM products WHERE category = '$category'";
    my $result = $self->app->db->query($query)->hashes;

    $self->render(json => $result);
}

# Action for full SQL injection
sub full_sql_injection {
    my $self = shift;

    my $query = $self->param('query');

    # Execute the user-supplied SQL query
    my $result = $self->app->db->query($query)->hashes;

    $self->render(json => $result);
}

1;
