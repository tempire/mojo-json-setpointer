
# NAME

Mojo::JSON::SetPointer - Mojo::JSON::SetPointer

# DESCRIPTION

Mojo::JSON::SetPointer, extended to allow setting of values

# METHODS

Mojo::JSON::SetPointer inherits all methods from Mojo::JSON::SetPointer and implements the following new ones.

## set

    my $hashref = {foo => 'bar'};
    Mojo::JSON::SetPointer->new($hashref)->set('/foo' => 'hello');
    # {foo => 'hello'}

    $hashref = {baz => [4, 5, 6]};
    Mojo::JSON::SetPointer->new($hashref)->set('/baz/0' => '4a');
    # {baz => '4a', 5, 6}

    $hashref = {baz => [4, 5, 6]};
    Mojo::JSON::SetPointer->new($hashref)->set('/baz/-' => 7);
    # {baz => 4, 5, 6, 7}

# SEE ALSO

[Mojolicious](https://metacpan.org/pod/Mojolicious), [Mojo::JSON::Pointer](https://metacpan.org/pod/Mojo%3A%3AJSON%3A%3APointer)

# AUTHOR

Glen Hinkle
