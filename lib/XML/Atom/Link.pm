# $Id$

package XML::Atom::Link;
use strict;
use base qw( XML::Atom::Base );
use URI qw();
use XML::Atom;

__PACKAGE__->mk_attr_accessors(qw( rel href hreflang title type length ));

sub element_name { 'link' }

sub uri {
    my ($self) = @_;
    return defined $self->elem->baseURI
        ? URI->new_abs($self->href, $self->elem->baseURI)
        : URI->new($self->href);
}

## Maintain backwards compatibility with the old Link->set method.
sub set { shift->set_attr(@_) }

1;

__END__

=encoding UTF-8

=head1 NAME

XML::Atom::Link - Atom link

=head1 SYNOPSIS

    my $link = $entry->link;
    $link->uri;
    $link->href;
    $link->hreflang;
    $link->length;
    $link->rel;
    $link->title;
    $link->type;

=head1 USAGE

=head2 uri

Resolves the L</href> against a possible base URI (C<xml:base> attribute, see
L<RFC 4287 §2|http://tools.ietf.org/html/rfc4287#section-2>. This is harmless
if L</href> is already an absolute URI, or if there is no XML base involved,
so you should prefer C<uri> over C<href> for a get operation.

Returns a L<URI> object.

----

The other methods as follows are accessors to the C<link> element's attributes.
See L<RFC 4287 §4.2.7|http://tools.ietf.org/html/rfc4287#section-4.2.7>.

=head2 href

=head2 hreflang

=head2 length

=head2 rel

=head2 title

=head2 type

=head1 AUTHOR & COPYRIGHT

Please see the L<XML::Atom> manpage for author, copyright, and license
information.