package CE::Service::Checklist;

use Pod::Markdown;

(caller() ? 1 : do {
  (my $parser = Pod::Markdown->new)
    ->parse_from_file(__FILE__);
  print $parser->as_markdown });

=head1 NAME

CE::Service::Checklist - Exampel Checklist Service

=head1 DESCRIPTION

L<CE::Service::Checklist> is an example web service application

=head1 SEE ALSO

The following modules or resources may be of interest.

L<DBIx::Class>, L<Web::Simple>, L<Plack>

You should also review the C<dist.ini> file for the full list of dependencies

=head1 AUTHOR

    John Napiorkowski C<< <jjnapiork@cpan.org> >>

=head2 CONTRIBUTORS

=head1 COPYRIGHT & LICENSE

    Copyright 2013, John Napiorkowski C<< <jjnapiork@cpan.org> >>

This program is owned by John Napiorkowski and contributors as noted or
otherwise described in external documention or legal agreements.

=cut

