%将坐标的字体变大一些
set(groot, 'DefaultAxesFontSize', 30);

x=-10:0.5:10;
y=-10:0.5:10;

%绘制图形
[X,Y]=meshgrid(x,y);
Z=fun(X,Y);
%mesh(X,Y,Z);
hold on;
contour(X,Y,Z,100);

x_init=-8;
y_init=-8;
tolerance=1e-5;

[x_best,y_best,f_best,k]=best_speed_down(@fun,@dfun,x_init,y_init,tolerance);



xlabel('x');
ylabel('y');
zlabel('z');

%配置一下绘制的格式
hold off;
grid;
axis square;


