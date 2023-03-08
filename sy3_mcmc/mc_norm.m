% Author: tianq <tianq@tianq-Legion-Y7000>
% Created: 2022-11-26

function retval = mc_norm (l, r, mu=0, sigma=1, acc=10000)
  % 确定积分域
  w = r-l;
  h = 1/(sqrt(2*pi)*sigma);

  % 生成采样点
  x = rand(1,acc)*(r-l)+l;
  y = rand(1,acc)*(h);

  % 对应点的误差值，为正的是在积分域之外
  z = y - exp(-1*(x-mu).^2/(2*(sigma)^2))/(sqrt(2*pi)*sigma);
  z(z>0)+=1;

  % 统计积分域曲线下的点数，计算积分的值p
  an = sum(z<0);
  p = an/acc*w*h;

  %绘制散点图
  scatter(x,y,1,z);
  title(sprintf("%d/%d\np=%f",an,acc,p));
  saveas(gcf,"mcnorm.png");
endfunction

