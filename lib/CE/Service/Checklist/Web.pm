package CE::Service::Checklist::Web;

use JSON;
use Web::Simple;
use DBIx::Class::Migration;
use HTTP::Throwable::Factory 'http_exception';

my $schema = DBIx::Class::Migration
  ->new(schema_class => 'CE::Service::Checklist::Schema')
  ->schema;

sub dispatch_request {
  sub (/*...) {
    my ($self, $id) = @_;
    my $user = $schema->resultset('User')->find($id)
      || return http_exception 'NotFound';

    sub(GET + ~) {
      my @checklists = $user->checklist_rs->all;
      as_json(map {
        +{title => $_->title,
          link => "/${\$user->id}/${\$_->id}"} }
        @checklists);    
    },

    sub(/*) {
      my ($self, $id) = @_;
      my $checklist = $user->checklist_rs->find($id)
        || return http_exception 'NotFound';

      sub(GET) {
        as_json($checklist->get_columns);
      }
    }

  },
}

sub as_json {
  return [200, ['Content-Type' => 'application/json'],
    [encode_json(\@_)] ];
}

__PACKAGE__->run_if_script;

=head1 NAME

CE::Service::Checklist::Web - Checklist Web Service

=head1 DESCRIPTION

    TBD

=head1 AUTHOR

    John Napiorkowski C<< <jjnapiork@cpan.org> >>

=head2 CONTRIBUTORS

=head1 COPYRIGHT & LICENSE

    Copyright 2013, John Napiorkowski C<< <jjnapiork@cpan.org> >>

This program is owned by John Napiorkowski and contributors as noted or
otherwise described in external documention or legal agreements.

=cut

