function A=myQSort(A,bR)
  high = columns(A);
  A=myqsort(A,1,high,bR);
endfunction

function A=myqsort(A,low,high,bR)

  if low<high
    [A,key]=get(A,low,high,bR);
    A=myqsort(A,low,key-1,bR);
    A=myqsort(A,key+1,high,bR);
  endif

endfunction

function [A,index]=get(A,i,j,bR)

  if (bR)>0
    key=A((randi((j-i))+i));
  else
    key=A(i);
  endif


  while i<j
    while i<j&&A(j)>=key
      j=j-1;
    endwhile
    tmp = A(j);

    while i<j&&A(i)<=key
      i=i+1;
    endwhile
    A(j)=A(i);
    A(i)=tmp;
  endwhile
  %A(i)=key;
  index=i;
endfunction


