use strict;
use warnings;
use Guacamole::Test;
use Test::More;

parses('<>');
parses('<$fh>');
parses('<<>>');
parses('<<$fh>>');

TODO: {
    todo_skip 'Reserve whitespace policy to avoid unacceptable spacing' => 2;
    parsent('< $fh >');
    parsent('<< $fh >>');
}

parsent('<@fh>');
parsent('<<@fh>>');
parsent('<fh>');
parsent('<<fh>>');
parsent('<fh()>');
parsent('<<fh()>>');
parses('while (<>) {...}');
parses('while ( my $line = <>) {...}');
parses('while (<<>>) {...}');
parses('while ( my $line = <<>>) {...}');

parses('while (<STDIN>) {...}');
parses('while ( my $line = <STDIN>) {...}');
parses('while (<<STDIN>>) {...}');
parses('while ( my $line = <<STDIN>>) {...}');

done_testing();