package CE::Service::Checklist::Schema::Result::User::Item;

use CE::Service::Checklist::Schema::Candy
  -components => ['Ordered'];

table 'user_item';

primary_column item_id => {
  data_type => 'integer',
  is_auto_increment => 1};

column checklist_id => {
  data_type => 'integer',
  is_foreign_key => 1};

column position => { data_type => 'integer' };
column copy => { data_type => 'text'};

column completed => {
  data_type => 'boolean',
  default_value => 0 };


belongs_to checklist => '::User::Checklist', 'checklist_id';

__PACKAGE__->position_column('position');
__PACKAGE__->grouping_column('checklist_id');

1;

=head1 NAME

CE::Service::Checklist::Schema::Result::Item

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<CE::Service::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CE::Service::Checklist> for rights information.

=cut
