#include "EXTERN.h"
#include "perl.h"
#include "XSUB.h"

#define INC(x, j, i) case x: cnt[j][i]++; break;

MODULE = Bio::Tools::FuzzyHypercube		PACKAGE = Bio::Tools::FuzzyHypercube		

void
_makecube(len, seq)
 U32   len
 char* seq

 INIT:
  U32 i, j;
  U32 cnt[3][4] = {{0,0,0,0},{0,0,0,0},{0,0,0,0}};
  SV* v;

 CODE:
  POPi;
  POPp;
  for(j=0; j<3; j++){
   for(i =j; i<len; i+=3){
    switch(seq[i]){
      INC('A', j, 0);
      INC('C', j, 1);
      INC('G', j, 2);
      INC('T', j, 3);
    }
   }
  }
  for(j=0; j<3; j++){
   for(i =0; i<4; i++){
     sv_setnv(v=sv_newmortal(), len ? (double)cnt[j][i]/len : 0);
     XPUSHs(v);
   }
  }
  XSRETURN(12);
