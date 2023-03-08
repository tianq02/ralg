## -*- texinfo -*-
## @deftypefn {} {@var{mcpi} =} mcmc_pi (@var{acc})
##
## @seealso{}
## @end deftypefn

## Author: tianq <tianq@tianq-Legion-Y7000>
## Created: 2022-11-26

function mcpi = mc_pi (acc)
  %x = rand(acc,1)*2 - 1;
  %y = rand(acc,1)*2 - 1;

  x = rand(acc,1);
  y = rand(acc,1);

  dist = x.^2 + y.^2;

  an = sum(dist<1)
  mcpi = 4*an/acc

  dist(dist>=1)+=1; %enlarge contrast

  scatter(x,y,1,dist);
  axis square;  %固定宽高比
  title(sprintf("%d/%d\npi=%d",an,acc,mcpi));
endfunction
