package CE::Service::Checklist::Schema::Result::User::Checklist;

use CE::Service::Checklist::Schema::Candy
  -components => ['Ordered'];

table 'user_checklist';

primary_column checklist_id => {
  data_type => "integer",
  is_auto_increment => 1};

column user_id => {
  data_type => 'integer',
  is_foreign_key => 1};

column title => {
  data_type => 'varchar',
  size => '64'};

column 'position' => { data_type => 'integer' };
column copy => { data_type => 'text'};

belongs_to user => '::User', 'user_id';
has_many item_rs => '::User::Item', 'checklist_id';

__PACKAGE__->position_column('position');
__PACKAGE__->grouping_column('user_id');

1;

=head1 NAME

CE::Service::Checklist::Schema::Result::Checklist

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<CE::Service::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CE::Service::Checklist> for rights information.

=cut
