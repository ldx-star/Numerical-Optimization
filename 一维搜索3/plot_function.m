%将坐标的字体变大一些
set(groot, 'DefaultAxesFontSize', 30);

x_min   = -5;
x_max   = 0;
delta_x = 1e-5;
epsilon = 1e-5;

x=x_min:delta_x:x_max;
%fun是一个未知的函数
y=fun(x);
plot(x,y);
%利用不同的算法计算最小值
[min_x,min_y,k] = quadratic3points_search(@fun,x_min,x_max,epsilon);
hold on;
plot(min_x,min_y,'o');
title(['精度',num2str(epsilon),'迭代次数为',num2str(k)]);


grid;
axis equal;





