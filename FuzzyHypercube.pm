package Bio::Tools::FuzzyHypercube;
use 5.006;
use strict;
our $VERSION = '0.01';
use XSLoader;
XSLoader::load 'Bio::Tools::FuzzyHypercube';

sub new {
    die "Length of the input is not divided by 3\n" if length($_[1]) % 3;
    bless [ _makecube(length($_[1]), uc($_[1])) ], $_[0];
}

use List::Util qw/max/;
sub dist {
    my($A, $B) = @_;
    my($a, $b);
    return 0 if(max(@$A) == 0 && max(@$B) == 0);
    return 1 if(max(@$A) == 0 || max(@$B) == 0);
    foreach (0..12){
	$a += abs ($A->[$_] - $B->[$_]);
	$b += $A->[$_] > $B->[$_] ? $A->[$_] : $B->[$_];
    }
    $a/$b;
}

1;
__END__
# Below is stub documentation for your module. You better edit it!

=head1 NAME

Bio::Tools::FuzzyHypercube - Fuzzy Hypercube of sequence

=head1 SYNOPSIS

  use Bio::Tools::FuzzyHypercube;
  my $cubeA = Bio::Tools::FuzzyHypercube->new('ACGGCGCTGCACGTGACG');
  my $cubeB = Bio::Tools::FuzzyHypercube->new('GCGCGGAGAGTTTTGCCA');

  print @$cubeA;
  print @$cubeB;

  print $cubeA->dist($cubeB);


=head1 DESCRIPTION

Fuzzy Hypercube is an idea proposed for estimating difference between two sequences. For details, see B<The fuzzy polynucleotide space: basic properties> written by I<Angela Torres and Juan J. Nieto> published in Bioinformatics Journal

The interface is simple. Make two cubes, and calculate the distance between them, as shown in SYNOPSIS.

=head1 COPYRIGHT

xern E<lt>xern@cpan.orgE<gt>

This module is free software; you can redistribute it or modify it under the same terms as Perl itself.

=cut
