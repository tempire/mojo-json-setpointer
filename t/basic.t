use Mojo::Base -strict;

use Test::More;
use Mojo::JSON::SetPointer;

use Data::Dumper;
use Devel::Dwarn;

my $hashref = { foo => 'bar' };
Mojo::JSON::SetPointer->new($hashref)->set( '/foo' => 'hello' );
is_deeply $hashref => { foo => 'hello' };

$hashref = { baz => [ 4, 5, 6 ] };
Mojo::JSON::SetPointer->new($hashref)->set( '/baz/0' => '4a' );
is_deeply $hashref => { baz => [ '4a', 5, 6 ] };

$hashref = { baz => [ 4, 5, 6 ] };
Mojo::JSON::SetPointer->new($hashref)->set( '/baz/-' => 7 );
is_deeply $hashref => { baz => [ 4, 5, 6, 7 ] };

my $p = Mojo::JSON::SetPointer->new($hashref);
$p->set( '/' => [qw/ new structure /]);
is_deeply $hashref => { baz => [ 4, 5, 6, 7 ] }, 'Same ref, does not modify existing ref in this case';
is_deeply $p->data => [qw/ new structure /];
done_testing;
