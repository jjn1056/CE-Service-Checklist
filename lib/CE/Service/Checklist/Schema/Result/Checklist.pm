package CE::Service::Checklist::Schema::Result::Checklist;

use CE::Service::Checklist::Schema::Candy;

table 'checklist';

primary_column checklist_id => {
  data_type => "integer",
  is_auto_increment => 1};

column title => {
  data_type => 'varchar',
  size => '64'};

column copy => {
  data_type => 'text'};

has_many item_rs => '::Item', 'checklist_id';

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
