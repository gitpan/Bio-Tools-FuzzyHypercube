use Test;
BEGIN { plan tests => 6 };
ok(1);

use Bio::Tools::FuzzyHypercube;

my $cubeA = Bio::Tools::FuzzyHypercube->new('');
my $cubeB = Bio::Tools::FuzzyHypercube->new('');
ok(0, $cubeA->dist($cubeB));

my $cubeA = Bio::Tools::FuzzyHypercube->new('');
my $cubeB = Bio::Tools::FuzzyHypercube->new('GCGCGGAGAGTTTTGCCA');
ok(1, $cubeA->dist($cubeB));

my $cubeA = Bio::Tools::FuzzyHypercube->new('ACGGCGCTGCACGTGACG');
my $cubeB = Bio::Tools::FuzzyHypercube->new('GCGCGGAGAGTTTTGCCA');
ok(0.5, $cubeA->dist($cubeB));

ok('0.1111111111111111110.1111111111111111110.11111111111111111100.05555555555555555560.16666666666666666700.11111111111111111100.05555555555555555560.2777777777777777780', join q//,@$cubeA);
ok('0.05555555555555555560.1111111111111111110.1111111111111111110.055555555555555555600.1111111111111111110.1111111111111111110.1111111111111111110.11111111111111111100.1666666666666666670.0555555555555555556', join q//, @$cubeB);
