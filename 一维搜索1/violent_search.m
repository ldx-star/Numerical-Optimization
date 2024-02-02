function [min_x,min_y,k]=violent_search(fun_input,x_min,x_max,epsilon)
%暴力搜素方法
%min_x表示计算的输入的自变量     %min_y表示计算的输入的因变量
%k表示迭代的次数
%fun_input表示的是输入的函数
%x_min表示的是输入变量最小值     %x_max表示的是输入变量最大值
%epsilon表示的是精度


%先等间距分割num份
num = ceil((x_max - x_min)/epsilon);

%先给最小值一个初始的数值
min_x = x_min;
min_y = 10e10;

%循环搜索
  for i = 1:(num+1)

    %依次便利不同的坐标
    x_temp = x_min + (i-1) * epsilon;
    y_temp = fun_input(x_temp);

    if y_temp < min_y

      %更新极小值的点
      min_x = x_temp;
      min_y = y_temp;

    end

  end

  %迭代的次数赋值
  k=num+1;
end



