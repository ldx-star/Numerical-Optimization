function [min_x,min_y,k]=fibonacci_search(fun_input,x_min,x_max,epsilon)
%斐波那契法
%min_x表示计算的输入的自变量     %min_y表示计算的输入的因变量
%k表示迭代的次数
%fun_input表示的是输入的函数
%x_min表示的是输入变量最小值     %x_max表示的是输入变量最大值
%epsilon表示的是精度

%先计算Fibonacci数列
Fibonacci_up  = (x_max - x_min)/epsilon;
Fibonacci_set = [1,2];
Fibonacci_num = 2;

%计算Fibonacci数列，并合适终止条件
while(1)
  Fibonacci_set(Fibonacci_num + 1) = Fibonacci_set(Fibonacci_num) + ...
                                     Fibonacci_set(Fibonacci_num - 1);
  if(Fibonacci_set(Fibonacci_num + 1) >= Fibonacci_up)
    Fibonacci_num = Fibonacci_num + 1;
    break;
  else
    Fibonacci_num = Fibonacci_num + 1;
  end
end

N = Fibonacci_num - 1;
%输入的比例项目成为了一个序列
ruo    = zeros(1,N);
ruo(1) = 1 - Fibonacci_set(N)/Fibonacci_set(N + 1);

%初始化
x_left_side    = x_min;
x_right_side   = x_max;
x_left_center  = x_left_side  + ruo(1)*(x_right_side - x_left_side);
x_right_center = x_right_side - ruo(1)*(x_right_side - x_left_side);
y_left_center  = fun_input(x_left_center);
y_right_center = fun_input(x_right_center);

%循环搜索
  for i = 2:N

    if(N == i)
      ruo(i) = 1/2 - 0.1*epsilon;
    else
      ruo(i) = 1-Fibonacci_set(N-i+1)/Fibonacci_set(N-i+2);
    end

    if (y_left_center >= y_right_center)
      %更新区间，继续计算
      x_left_side    = x_left_center;
      x_right_side   = x_right_side;
      x_left_center  = x_right_center;%x_left_side  + ruo*(x_right_side - x_left_side);
      x_right_center = x_right_side - ruo(i)*(x_right_side - x_left_side);
      y_left_center  = y_right_center;%fun_input(x_left_center);
      y_right_center = fun_input(x_right_center);
    else
      %更新区间，继续计算
      x_left_side    = x_left_side;
      x_right_side   = x_right_center;
      x_right_center = x_left_center;%x_right_side - ruo*(x_right_side - x_left_side);
      x_left_center  = x_left_side  + ruo(i)*(x_right_side - x_left_side);
      y_right_center = y_left_center;%fun_input(x_right_center);
      y_left_center  = fun_input(x_left_center);
    end

  end

  %输出的最近点和迭代的步长赋值
  min_x = (x_left_side + x_right_side)*0.5;
  min_y = fun_input(min_x);
  k     = N - 1;

end




