function [min_x,min_y,k] = dichotomy(fun_input,dfun_input,x_min,x_max,epsilon)
%二分法
%min_x表示计算的输入的自变量     %min_y表示计算的输入的因变量
%k表示迭代的次数
%fun_input表示的是输入的函数    d_fun_input表示的是输入的函数的导数
%x_min表示的是输入变量最小值     %x_max表示的是输入变量最大值
%epsilon表示的是精度

%初始化
x_left_side    = x_min;
x_right_side   = x_max;
x_center       = (x_left_side + x_right_side)*0.5;
y_center       = fun_input(x_center);
dy_center      = dfun_input(x_center);

%初始的迭代次数
num = 0;

%循环搜索
while(1)
  num = num + 1;
  %更新区间
  if (dy_center     > 1e-10)
    %更新区间，继续计算
    x_left_side    = x_left_side;
    x_right_side   = x_center;
    x_center       = (x_left_side + x_right_side)*0.5;
    y_center       = fun_input(x_center);
    dy_center      = dfun_input(x_center);
  elseif (dy_center < -1e-10)
    %更新区间，继续计算
    x_left_side    = x_center;
    x_right_side   = x_right_side;
    x_center       = (x_left_side + x_right_side)*0.5;
    y_center       = fun_input(x_center);
    dy_center      = dfun_input(x_center);
  else
    %如果导数维0就直接退出，输出的最近点和迭代的步长赋值
    min_x = x_center;
    min_y = y_center;
    k     = num;
  endif

  %满足条件就退出
  if((x_right_side - x_left_side) <= epsilon)
    %输出的最近点和迭代的步长赋值
    min_x = (x_left_side + x_right_side)*0.5;
    min_y = fun_input(min_x);
    k     = num;
    break;
  endif

endwhile




endfunction
