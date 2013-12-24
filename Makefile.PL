
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Session-based logging platform on top of MongoDB",
  "AUTHOR" => "Ido Perlmuter <ido\@ido50.net>",
  "BUILD_REQUIRES" => {},
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Pye",
  "EXE_FILES" => [
    "bin/pye"
  ],
  "LICENSE" => "perl",
  "NAME" => "Pye",
  "PREREQ_PM" => {
    "Carp" => 0,
    "Getopt::Compact" => 0,
    "JSON" => 0,
    "MongoDB" => 0,
    "MongoDB::Code" => 0,
    "Term::ANSIColor" => 0,
    "Text::SpanningTable" => 0,
    "Tie::IxHash" => 0,
    "lib" => 0,
    "strict" => 0,
    "version" => 0,
    "warnings" => 0
  },
  "TEST_REQUIRES" => {
    "Test::More" => 0
  },
  "VERSION" => "1.000000",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


my %FallbackPrereqs = (
  "Carp" => 0,
  "Getopt::Compact" => 0,
  "JSON" => 0,
  "MongoDB" => 0,
  "MongoDB::Code" => 0,
  "Term::ANSIColor" => 0,
  "Test::More" => 0,
  "Text::SpanningTable" => 0,
  "Tie::IxHash" => 0,
  "lib" => 0,
  "strict" => 0,
  "version" => 0,
  "warnings" => 0
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.63_03) } ) {
  delete $WriteMakefileArgs{TEST_REQUIRES};
  delete $WriteMakefileArgs{BUILD_REQUIRES};
  $WriteMakefileArgs{PREREQ_PM} = \%FallbackPrereqs;
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



