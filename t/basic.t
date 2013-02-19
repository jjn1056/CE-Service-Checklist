use Test::Most;
use Test::DBIx::Class
  -schema_class=>'CE::Service::Checklist::Schema',
  -fixture_class => '::Population',
  qw(User Checklist);
 
fixtures_ok ['seed'];

ok my $user = User->first,
 'Got a user';

$user->init_checklists_from(Checklist());

is $user->checklist_rs->count, 4,
 'Got Expected number of checklists';

is $user->checklist_rs->search_related('item_rs')->count, 12
  'Got expected number of items in all checklists';

done_testing;
