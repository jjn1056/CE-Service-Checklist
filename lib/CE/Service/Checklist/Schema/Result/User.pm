package CE::Service::Checklist::Schema::Result::User;

use CE::Service::Checklist::Schema::Candy;

table 'user';

primary_column user_id => {
  data_type => "integer",
  is_auto_increment => 1};

has_many checklist_rs => '::User::Checklist', 'user_id';

sub init_checklists_from {
  my ($self, $checklist_rs) = @_;
  foreach my $checklist($checklist->all) {
    my $user_checklist = $user
      ->create_related('checklist_rs',
        {title=>$checklist->title, copy=>$checklist->copy});
    foreach my $item ($checklist->item_rs->all) {
      $user_checklist->create_related('item_rs',
        {copy=>$item->copy});
    }
  }
}

1;

=head1 NAME

CE::Service::Checklist::Schema::Result::User

=head1 DESCRIPTION

    TBD

=head1 METHODS

    TBD

=head1 AUTHOR

See L<CE::Service::Checklist> for authorship information.

=head1 COPYRIGHT & LICENSE

See L<CE::Service::Checklist> for rights information.

=cut
