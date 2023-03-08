## Author: tianq <tianq@LAPTOP-EKNTOFTJ>
## Created: 2022-11-23

%bm变换取样数不影响精度，n意思是返回向量的长度
function retval = gauss_rand_bm (len = 1)
  U1 = rand(1, len);U2 = rand(1, len);
  retval = sqrt(-2*log(U1)).*cos(2*pi*U2)
endfunction
