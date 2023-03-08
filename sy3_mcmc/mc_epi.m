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
## @deftypefn {} {@var{retval} =} mc_epi (@var{input1}, @var{input2})
##
## @seealso{}
## @end deftypefn

## Author: tianq <tianq@LAPTOP-EKNTOFTJ>
## Created: 2022-12-04

function retval = mc_epi (acc)
  x = rand(acc,1);
  y = rand(acc,1);

  d = x.^2 + y.^2;

  hit = rows( find(d > 1) );
  my_pi = 4 * hit / acc;

  d( d > 1 ) += 1;

  scatter(x,y,1,d);
  title(sprintf("%d/%d\npi=%d",an,acc,mcpi));

endfunction
