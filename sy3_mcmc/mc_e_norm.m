## -*- texinfo -*-
## @deftypefn {} {@var{enorm} =} mc_e_norm (@var{l},@var{r},@var{mu},@var{sigma},@var{acc},)
##
## @seealso{}
## @end deftypefn

## Author: tianq <tianq@tianq-Legion-Y7000>
## Created: 2022-12-07

function enorm = mc_e_norm( l, r, mu, sigma, acc )
    % 生成积分域上的采样,此处用均匀分布作PDF
    x = sort(rand(1,acc)*(r-l)+l);
    % 计算各处的期望值
    y = exp(-1*(x-mu).^2/(2*(sigma)^2))/(sqrt(2*pi)*sigma);
    % 求期望的平均算积分结果
    enorm = sum(y) * (r-l) / acc;
    % 绘制阶梯图
    stairs(x,y);
    title(sprintf("%dsamples\nnorm=%d",acc,enorm));
endfunction
