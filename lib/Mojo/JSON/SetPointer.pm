package Mojo::JSON::SetPointer;
use Mojo::Base 'Mojo::JSON::Pointer';
use Data::Dumper;

our $VERSION = '0.01';

sub set {
  my ($self, $pointer, $value) = @_;
  my $data = $self->data;

  $self->data($value) if $pointer eq '/';

  my @segments = grep length, split '/' => $pointer;

  while (@segments) {
    my $p = shift @segments;

    #$p =~ s!~1!/!g;
    #$p =~ s/~0/~/g;

    if (ref $data eq 'HASH') {

      if (ref $data->{$p}) {
        $data = $data->{$p};
      }

      elsif (!@segments) {
        $data->{$p} = $value;
      }

      elsif ($segments[0] =~ /^(?:\-|\d+)$/) {
        $data->{$p} = [];
        $data = $data->{$p};
      }

      else {
        $data->{$p} = {};
        $data = $data->{$p};
      }
    }

    elsif (ref $data eq 'ARRAY') {

      if ($p eq '-') {
        $p = int @$data;
      }

      if (ref $data->[$p]) {
        $data = $data->[$p];
      }

      elsif (!@segments) {
        $data->[$p] = $value;
      }

      elsif ($segments[0] =~ /^(?:\-|\d+)$/) {
        $data->[$p] = [];
        $data = $data->[$p];
      }

      else {
        $data->[$p] = {};
        $data = $data->[$p];
      }
    }
  }
}

1;

=head1 DESCRIPTION

Mojo::JSON::SetPointer, extended to allow setting of values

=head1 METHODS

Mojo::JSON::SetPointer inherits all methods from Mojo::JSON::SetPointer and implements the following new ones.

=head2 set

  my $hashref = {foo => 'bar'};
  Mojo::JSON::SetPointer->new($hashref)->set('/foo' => 'hello');
  # {foo => 'hello'}

  $hashref = {baz => [4, 5, 6]};
  Mojo::JSON::SetPointer->new($hashref)->set('/baz/0' => '4a');
  # {baz => '4a', 5, 6}

  $hashref = {baz => [4, 5, 6]};
  Mojo::JSON::SetPointer->new($hashref)->set('/baz/-' => 7);
  # {baz => 4, 5, 6, 7}

=head1 SEE ALSO

L<Mojolicious>, L<Mojo::JSON::Pointer>

=head1 AUTHOR

Glen Hinkle

=cut
