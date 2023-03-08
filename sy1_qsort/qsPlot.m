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
## @deftypefn {} {@var{retval} =} qsPlot (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: tianq <tianq@LAPTOP-EKNTOFTJ>
## Created: 2022-11-02

function retval = qsPlot(xL, xR)
  i=1;
  x=(xL:xR)
  resA = zeros(1,((xR)-(xL)+1));
  resB = zeros(1,((xR)-(xL)+1));
  while((xL)<=(xR))
    res(1,i) = ((xR)-(xL)+1);
    A = randi((xL),1,(xL));
    tic;qsort(A,0);t=toc;resA(i)=t;
    tic;qsort(A,1);t=toc;resB(i)=t;
    i++,xL++;
  endwhile
  plot(x,resA,x,resB),
  legend('std', 'rand');

endfunction
