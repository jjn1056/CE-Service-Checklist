package CE::Service::Checklist::Schema::ResultSet::User;

use strict;
use warnings;
use base 'CE::Service::Checklist::Schema::ResultSet';

sub new_member { shift->create({@_}) }

1;
