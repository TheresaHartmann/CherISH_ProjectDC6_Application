function cadj=ref_spreadadj_5(coef)
%REF_SPREADADJ_5  Symbol of adjoint spreading function.
%   Usage: cadj=ref_spreadadj_5(c,number);
%
%   Development version by FJ for comparison of different implementations
%   cadj=SPREADADJ(c) will compute the symbol cadj of the spreading 
%   operator that is the adjoint of the spreading operator with symbol c. 
%
%   Implementation for sparse matrix using loop
%
%   Url: http://ltfat.github.io/doc/timing/ref_spreadadj_5.html

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

L=size(coef,1);
  
[row,col,val]=find(coef);
        
% Optimization note : As said in note of case 3, we are computing 
% the Lth root of unity which have special properties and symetries 
% taht could be exploited to highly reduce this computation.
% Furthermore here we precompute every possible exponential
% term even if some are unneeded. But there is no simple way to
% know which one should be computed and the computation needed to
% know it could be worst than this computation. Nevertheless, it
% could be used in a different implementation
temp=exp((-i*2*pi/L)*(0:L-1));

cadj=spalloc(L,L,length(val));
for k=1:length(val)
  ii=mod(L-row(k)+1, L);
  jj=mod(L-col(k)+1, L);
  cadj(ii+1,jj+1)=conj(val(k))*temp(mod(ii*jj,L)+1);
end




