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

is $user->checklist_rs->search_related('item_rs')->count, 12,
  'Got expected number of items in all checklists';

is((my $checklist = $user->checklist_rs->first)->title, 'Freshman',
  'Got expected first checklist #1');

is $checklist->position, 1, 'Expected position #1';

ok $checklist->move_next, 'successful re-ordering';

is $checklist->position, 2, 'Expected position #2';

is $checklist->item_rs->first->completed, 0, 'Not complete';

done_testing;
