use ExtUtils::MakeMaker;


WriteMakefile(
    'NAME'		=> 'Bio::Tools::FuzzyHypercube',
    'VERSION_FROM'	=> 'FuzzyHypercube.pm', 
    'PREREQ_PM'		=> {}, 
    ($] >= 5.005 ?    
      (ABSTRACT_FROM => 'FuzzyHypercube.pm', 
       AUTHOR     => 'xern <xern@cpan.org>') : ()),
    'LIBS'		=> [''], 
    'DEFINE'		=> '', 
	
    'INC'		=> '', 
	
    
);
