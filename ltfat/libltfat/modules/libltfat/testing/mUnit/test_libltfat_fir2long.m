function test_failed = test_libltfat_fir2long(varargin)
test_failed = 0;

fprintf(' ===============  %s ================ \n',upper(mfilename));

definput.flags.complexity={'double','single'};
[flags]=ltfatarghelper({},definput,varargin);
dataPtr = [flags.complexity, 'Ptr'];

Larr =    [1, 9,11,110,1, 9, 8, 8,   11, 11, 10];
Loutarr = [11,9,12,221,1,10, 10, 11, 15, 16, 1000];

for do_complex = 0:1
    complexstring = '';
    if do_complex, complexstring = 'complex'; end
    funname = makelibraryname('fir2long',flags.complexity,do_complex);
    
    for Lidx = 1:numel(Larr)
        L = Larr(Lidx);
        Lout = Loutarr(Lidx);
            
            if do_complex
                z = cast((1:L)'+1i*(L:-1:1)',flags.complexity);
                zi = complex2interleaved(z);
                zout = randn(2*Lout,1,flags.complexity);
                
                ziPtr = libpointer(dataPtr,zi);
                zoutPtr = libpointer(dataPtr,zout);
            else
                z = cast((1:L)',flags.complexity);
                zi = z;
                zout = randn(Lout,1,flags.complexity);
                
                ziPtr = libpointer(dataPtr,zi);
                zoutPtr = libpointer(dataPtr,zout);
            end
            
            trueres = fir2long(z,Lout);
            
            
            status = calllib('libltfat',funname,ziPtr,L,Lout,zoutPtr);
            
            if do_complex
                res = norm(trueres - interleaved2complex(zoutPtr.Value));
            else
                res = norm(trueres - zoutPtr.Value);
            end
            
            [test_failed,fail]=ltfatdiditfail(res+status,test_failed,0);
            fprintf(['FIR2LONG OP L:%3i, Lout:%3i, %s %s %s %s\n'],L,Lout,flags.complexity,complexstring,ltfatstatusstring(status),fail);
            
            zoutPtr.Value(:) = randn(size(zoutPtr.Value),flags.complexity);
            zoutPtr.Value(1:numel(ziPtr.Value)) = ziPtr.Value;
            status = calllib('libltfat',funname,zoutPtr,L,Lout,zoutPtr);
            
            if do_complex
                res = norm(trueres - interleaved2complex(zoutPtr.Value));
            else
                res = norm(trueres - zoutPtr.Value);
            end
            
            [test_failed,fail]=ltfatdiditfail(res+status,test_failed,0);
            fprintf(['FIR2LONG IP L:%3i, Lout:%3i, %s %s %s %s\n'],L,Lout,flags.complexity,complexstring,ltfatstatusstring(status),fail);
    end
end


%
%   Url: http://ltfat.github.io/doc/libltfat/modules/libltfat/testing/mUnit/test_libltfat_fir2long.html

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

