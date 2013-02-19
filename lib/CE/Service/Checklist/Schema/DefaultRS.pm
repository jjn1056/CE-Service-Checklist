package CE::Service::Checklist::Schema::DefaultRS;

use strict;
use warnings;
use base 'CE::Service::Checklist::Schema::ResultSet';

1;

=head1 NAME

CE::Service::Checklist::Schema::DefaultRS - Use this as the default ResultSet.

=head1 DESCRIPTION

L<DBIx::Class> will use a resultset class which shares a name with the Result
class.  If one does not exist, use this class as the default.  Both custom and
default Resultsets share L<CE::Service::Checklist::Schema::ResultSet> as a
common base class.

If you are thinking of adding methods here, they probably belong in the true
base parent L<CE::Service::Checklist::Schema::ResultSet>.

=head1 AUTHOR

See L<CE::Service::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CE::Service::Checklist> for rights information.

=cut

