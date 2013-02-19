package CE::Service::Checklist::Schema::Migrate;

use Moose;
 
extends 'DBIx::Class::Migration::Script';
 
sub defaults {
  schema_class => 'CE::Service::Checklist::Schema',
}

__PACKAGE__->meta->make_immutable;
__PACKAGE__->run_if_script;

=head1 NAME

CE::Service::Checklist::Schema::Migrate - Migrations 

=head1 SYNOPSIS

    TBD
    	
=head1 DESCRIPTION

    TBD

=head1 AUTHOR

See L<CE::Service::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CE::Service::Checklist> for rights information.

=cut

