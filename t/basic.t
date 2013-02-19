use Test::Most;
use Test::DBIx::Class
  -schema_class=>'CE::Service::Checklist::Schema',
  -fixture_class => '::Population',
  qw(User Checklist);
 
fixtures_ok ['seed'];

done_testing;
