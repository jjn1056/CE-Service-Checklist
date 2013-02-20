package CE::Service::Checklist::Web;

use Web::Simple;
use DBIx::Class::Migration;
use HTTP::Throwable::Factory 'http_exception';
use JSON;

my $schema = DBIx::Class::Migration
  ->new(schema_class => 'CE::Service::Checklist::Schema')
  ->schema;

sub as_json {
  [200, ['Content-Type' => 'application/json'],
    [encode_json(shift)] ];
}

sub dispatch_request {
  my $self = shift;

  sub (/*:id...) {
    my $user = $schema->resultset('User')->find($_{id})
      || return http_exception 'NotFound';

    sub(GET + ~) {
      as_json [$user->checklist_rs->map(sub { 
        +{ title => $_->title,
          link => "/${\$user->id}/${\$_->id}" }
      })];
    },

    sub(/*:id) {
      my $checklist = $user->checklist_rs->find($_{id})
        || return http_exception 'NotFound';

      sub(GET) { as_json [$checklist->get_columns] },
    },
  },
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

