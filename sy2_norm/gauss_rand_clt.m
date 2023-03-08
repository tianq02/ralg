%中心极限定理的正态分布生成,
%n即向量长度，acc即采样数，与精度相关
function r = gauss_rand_clt( len=1,acc = 100 )
    %rand(acc,n)均匀产生acc行n列0~1之间的随机数，后续sum列加和
    r = (sum(rand(acc,len),1) - acc * 0.5) ./ sqrt(acc / 12);
endfunction
