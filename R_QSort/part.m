%%略有改进的划分，可以处理排序时的重复
%%输入的A:待划分的数组，l，r：划分界限
%%输出的rA：划分完成的数组，ri,rj:轴值所在的位置，下一步记得处理

function [rA,ri,rj] = part (A,i,j,r=1)

  %拷贝A到rA
  %rA = zeros(1,j-i+1);
  %rA = A(i,j);
  rA=A;
  ri = i;
  rj = j;

  %%使能随机化算法
  if r==1
    key = A(randi([i j]));
  else
    key = A(i);
  endif


  %遍历，存储划分后的到rA
  %结束后，ri是第一个轴值位置，rj是最后（都指到轴值区域）
  for k=i:j
    c = A(k);
    if c<key
      rA(ri)=c;
      ri++;
    elseif c>key
      rA(rj)=c;
      rj--;
    endif
  endfor

  %补全轴值区间
  for k=ri:rj
    rA(k)=key;
  endfor

  %额外输出
  %key,rA,ri,rj

endfunction
