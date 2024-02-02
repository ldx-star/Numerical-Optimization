function [min_x,min_y,k]=interval_elimination_search(fun_input,x_min,x_max,epsilon)
%区间消去法
%min_x表示计算的输入的自变量     %min_y表示计算的输入的因变量
%k表示迭代的次数
%fun_input表示的是输入的函数
%x_min表示的是输入变量最小值     %x_max表示的是输入变量最大值
%epsilon表示的是精度

ruo = 1/2 - 0.1*epsilon;

%初始化
x_left_side    = x_min;
x_right_side   = x_max;
x_left_center  = x_left_side  + ruo*(x_right_side - x_left_side);
x_right_center = x_right_side - ruo*(x_right_side - x_left_side);
y_left_center  = fun_input(x_left_center);
y_right_center = fun_input(x_right_center);

%初始的迭代次数
num = 0;

%循环搜索
while(1)
  num = num + 1;
  %更新区间
  if (y_left_center >= y_right_center)
    %更新区间，继续计算
    x_left_side    = x_left_center;
    x_right_side   = x_right_side;
    x_left_center  = x_left_side  + ruo*(x_right_side - x_left_side);
    x_right_center = x_right_side - ruo*(x_right_side - x_left_side);
    y_left_center  = fun_input(x_left_center);
    y_right_center = fun_input(x_right_center);
  else
    %更新区间，继续计算
    x_left_side    = x_left_side;
    x_right_side   = x_right_center;
    x_left_center  = x_left_side  + ruo*(x_right_side - x_left_side);
    x_right_center = x_right_side - ruo*(x_right_side - x_left_side);
    y_left_center  = fun_input(x_left_center);
    y_right_center = fun_input(x_right_center);
  end

  %满足条件就退出
  if((x_right_side - x_left_side) <= epsilon)
    break;
  end

  end

  %输出的最近点和迭代的步长赋值
  min_x = (x_left_side + x_right_side)*0.5;
  min_y = fun_input(min_x);
  k     = num;

end




