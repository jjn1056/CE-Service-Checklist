package CE::Service::Checklist::Schema::Candy;

use strict;
use warnings;
use base 'DBIx::Class::Candy';

sub base { $_[1] || 'CE::Service::Checklist::Schema::Result' }

1;

=head1 NAME

CE::Service::Checklist::Schema::Candy - My Candy Class

=head1 SYNOPSIS

	package CE::Service::Checklist::Schema::Result::User;
  use CE::Service::Checklist::Schema::Candy;

=head1 DESCRIPTION

Our custom subclass of L<DBIx::Class::Candy>

=head1 METHODS

This module defines the following methods.

=head2 base

Sets the base class for all Results

=head1 AUTHOR

See L<CE::Service::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CE::Service::Checklist> for rights information.

=cut


