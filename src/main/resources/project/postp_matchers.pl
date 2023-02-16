@::gMatchers = (
  {
   id =>        "selenium-failure",
   pattern =>          q{Tests failed},
   action =>           q{updateSummary(); exit 1;},
  },
);

sub incValueWithString($;$$) {
    my ($name, $patternString, $increment) = @_;

    $increment = 1 unless defined($increment);

    my $localString = (defined $::gProperties{$name}) ? $::gProperties{$name} :
                                                        $patternString;

    $localString =~ /([^\d]*)(\d+)(.*)/;
    my $leading = $1;
    my $numeric = $2;
    my $trailing = $3;
    
    $numeric += $increment;
    $localString = $leading . $numeric . $trailing;

    setProperty ($name, $localString);
}

sub updateSummary() {
 
    my $summary = (defined $::gProperties{"cs-unused-sum"}) ? $::gProperties{"cs-unused-sum"} . "\n" : "";
    
    $summary .= (defined $::gProperties{"cs-string-sum"}) ? $::gProperties{"cs-string-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-basic-sum"}) ? $::gProperties{"cs-basic-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-braces-sum"}) ? $::gProperties{"cs-braces-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-design-sum"}) ? $::gProperties{"cs-design-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-coupling-sum"}) ? $::gProperties{"cs-coupling-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-optimization-sum"}) ? $::gProperties{"cs-optimization-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-j2ee-sum"}) ? $::gProperties{"cs-j2ee-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-jsp-sum"}) ? $::gProperties{"cs-jsp-sum"} . "\n" : "";
    $summary .= (defined $::gProperties{"cs-jsf-sum"}) ? $::gProperties{"cs-jsf-sum"} . "\n" : "";

	setProperty ("summary", $summary);
}