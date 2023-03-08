## Copyright (C) 2022 tianq
##
## This program is free software: you can redistribute it and/or modify
## it under the terms of the GNU General Public License as published by
## the Free Software Foundation, either version 3 of the License, or
## (at your option) any later version.
##
## This program is distributed in the hope that it will be useful,
## but WITHOUT ANY WARRANTY; without even the implied warranty of
## MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
## GNU General Public License for more details.
##
## You should have received a copy of the GNU General Public License
## along with this program.  If not, see <https://www.gnu.org/licenses/>.

## -*- texinfo -*-
## @deftypefn {} {@var{retval} =} gauss_rand_bm (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: tianq <tianq@LAPTOP-EKNTOFTJ>
## Created: 2022-11-23

%bm变换取样数不影响精度，n意思是返回向量的长度
function retval = gauss_rand_bm (len = 1)
  U1 = rand(1, len);U2 = rand(1, len);
  retval = sqrt(-2*log(U1)).*cos(2*pi*U2)
endfunction
