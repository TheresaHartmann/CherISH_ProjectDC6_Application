%TEST_TIMING_DGT_FAC  Test timing factorization DGTs
%
%   This script test the timing DGTs by comparing the results to the
%   comp_dgt_fac in the main toolbox. Therefore, the correctness of
%   comp_dgt_fac must be verified first.
%
%   Url: http://ltfat.github.io/doc/timing/test_timing_dgt_fac.html

% Copyright (C) 2005-2023 Peter L. Soendergaard <peter@sonderport.dk> and others.
% This file is part of LTFAT version 2.6.0
%
% This program is free software: you can redistribute it and/or modify
% it under the terms of the GNU General Public License as published by
% the Free Software Foundation, either version 3 of the License, or
% (at your option) any later version.
%
% This program is distributed in the hope that it will be useful,
% but WITHOUT ANY WARRANTY; without even the implied warranty of
% MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
% GNU General Public License for more details.
%
% You should have received a copy of the GNU General Public License
% along with this program.  If not, see <http://www.gnu.org/licenses/>.


routinemax=7;

Lr=[24,16,144,108,144,24,135,35,77,20];
ar=[ 4, 4,  9,  9, 12, 6,  9, 5, 7, 1];
Mr=[ 6, 8, 16, 12, 24, 8,  9, 7,11,20];

test_failed=0;

disp('--- Used subroutines ---');

for ii=1:routinemax
  which(['mex_dgt_fac_',num2str(ii)])
end;

for ii=1:length(Lr);

  L=Lr(ii);
  
  M=Mr(ii);
  a=ar(ii);
  
  b=L/M;
  N=L/a;
  c=gcd(a,M);
  d=gcd(b,N);
  p=a/c;
  q=M/c;
  
  for W=1:3
    
    for R=1:3
      
      for rtype=1:2
        if rtype==1
          rname='REAL ';	
          f=rand(L,W);
          g=rand(L,R);
        else
          rname='CMPLX';	
          f=crand(L,W);
          g=crand(L,R);
        end;
        
        gf=comp_wfac(g,a,M);            
        cc=comp_dgt_fac(f,gf,a,M);
        
        for rout=1:routinemax
          cc2=feval(['mex_dgt_fac_',num2str(rout)],f,gf,a,M,0);
        
          res=norm(cc(:)-cc2(:));      
          
          failed='';
          if res>10e-10
            failed='FAILED';
            test_failed=test_failed+1;
          end;
          
          s=sprintf('DGT  %s %i L:%3i W:%2i R:%2i a:%3i b:%3i c:%3i d:%3i p:%3i q:%3i %0.5g %s',rname,rout,L,W,R,a,b,c,d,p,q,res,failed);
          disp(s)

        end;        
                
      end;            
      
    end;
    
  end;
  
end;


test_failed



