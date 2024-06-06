function complainif_notnonnegint(var,varname,callfun)

if nargin<3
    callfun = mfilename;
end

if isempty(var) || ~isscalar(var) || ~isnumeric(var) || var<0 || rem(var,1)~=0 
   error('%s: %s should be non-negative integer.',upper(callfun),varname);
end

%
%   Url: http://ltfat.github.io/doc/comp/complainif_notnonnegint.html

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

