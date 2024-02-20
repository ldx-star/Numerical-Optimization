function [min_x,min_y,k] = quadratic3points_search(fun_input,x_min,x_max,epsilon)
%三点二次法
%min_x表示计算的输入的自变量     %min_y表示计算的输入的因变量
%k表示迭代的次数
%fun_input表示的是输入的函数
%x_min表示的是输入变量最小值     %x_max表示的是输入变量最大值
%epsilon表示的是精度

%初始化
x_left    = x_min;
x_right   = x_max;
x_center  = (x_left + x_right)*0.5;

y_left    = fun_input(x_left);
y_right   = fun_input(x_right);
y_center  = fun_input(x_center);

%计算差值后的抛物线系数
the_matrix = [x_left.^2,   x_left,  1;
              x_center.^2, x_center,1;
              x_right.^2,  x_right, 1];
the_vector = [y_left;y_center;y_right];
the_para   = inv(the_matrix)*the_vector;

a=the_para(1);
b=the_para(2);

x = -5:1e-5:0;
y1 = a*(x.^2)+b*x;
y2 = fun(x);
plot(x,y2);
hold on;
plot(x,y1);
hold on;
plot(x_center,fun(x_center),'ro');
hold on;
plot(-b/(2*a),a*((-b/(2*a)).^2)+b*(-b/(2*a)),'go');


%计算抛物线的最小值点
x_center_star = -b/(2*a);
y_center_star = fun_input(x_center_star);

%初始的迭代次数
num = 0;

while(1)
  num = num + 1;

  %判断是否要退出
  if(abs(x_center_star - x_center) <= epsilon)
    break;
  end;

  %更新区间
  if(x_center_star < x_center)
    if(y_center_star <= y_center)
      x_left    = x_left;
      x_right   = x_center;
      x_center  = x_center_star;
    else
      x_left    = x_center_star;
      x_right   = x_right;
      x_center  = x_center;
    end
  end

  %更新区间
  if(x_center_star > x_center)
    if(y_center_star <= y_center)
      x_left    = x_center;
      x_right   = x_right;
      x_center  = x_center_star;
    else
      x_left    = x_left;
      x_right   = x_center_star;
      x_center  = x_center;
    end
  end

  %重复计算，进行下一步的迭代
  y_left    = fun_input(x_left);
  y_right   = fun_input(x_right);
  y_center  = fun_input(x_center);

  %计算差值后的抛物线系数
  the_matrix = [x_left.^2,   x_left,  1;
                x_center.^2, x_center,1;
                x_right.^2,  x_right, 1];
  the_vector = [y_left;y_center;y_right];
  the_para   = inv(the_matrix)*the_vector;

  a=the_para(1);
  b=the_para(2);

  %计算抛物线的最小值点
  x_center_star = -b/(2*a);
  y_center_star = fun_input(x_center_star);

end

  %退出后就给最小值赋值
  if(y_center_star < y_center)
    min_x = x_center_star;
    min_y = y_center_star;
    k     = num;
  else
    min_x = x_center;
    min_y = y_center;
    k     = num;
  end

end
