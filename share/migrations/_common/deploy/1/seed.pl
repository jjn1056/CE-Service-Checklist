use DBIx::Class::Migration::RunScript;
 
migrate {
  my $self = shift;
  if($self->set_has_fixtures('seed')) {
    $self->populate('seed');
  } else {
    my $user = $self->schema
      ->resultset('User')
      ->create({});

    my $freshman = $self->schema
      ->resultset('Checklist')
      ->create({title=>'Freshman',copy=>'Freshman Stuff Todo'});

    $freshman->items->populate([
        ['copy'],
        ['TODO 1'],
        ['TODO 2'],
        ['TODO 3']]);

    my $sophmore = $self->schema
      ->resultset('Checklist')
      ->create({title=>'Sophmore',copy=>'Sophmore Stuff Todo'});

    $sophmore->items->populate([
        ['copy'],
        ['TODO 1'],
        ['TODO 2'],
        ['TODO 3']]);


    my $junior = $self->schema
      ->resultset('Checklist')
      ->create({title=>'Junior',copy=>'Junior Stuff Todo'});

    $junior->items->populate([
        ['copy'],
        ['TODO 1'],
        ['TODO 2'],
        ['TODO 3']]);


    my $senior = $self->schema
      ->resultset('Checklist')
      ->create({title=>'Senior',copy=>'Senior Stuff Todo'});

    $senior->items->populate([
        ['copy'],
        ['TODO 1'],
        ['TODO 2'],
        ['TODO 3']]);

    $self->dump('seed');
  }
 
};
