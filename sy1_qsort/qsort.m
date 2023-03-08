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
## @deftypefn {} {@var{retval} =} qsort (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: tianq <tianq@LAPTOP-EKNTOFTJ>
## Created: 2022-11-03

%%自制（慢速）排序

function rA = qsort (A, isRand=1)
  l=1; r=columns(A);
  rA = _qsort (A, l, r, isRand);
endfunction

function rA = _qsort (A, l, r, isRand=1)

  if l<r %否则已完成，
    %%划分，获取划分完成的，保存至A
    [A,pl,pr] = part(A,l,r,isRand);
    A=_qsort (A, l, pl-1, isRand);
    A=_qsort (A, pr+1, r, isRand);
  endif
  rA = A;
endfunction
