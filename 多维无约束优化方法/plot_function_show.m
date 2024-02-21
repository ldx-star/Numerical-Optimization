%将坐标的字体变大一些
set(groot, 'DefaultAxesFontSize', 20);

%绘制三维空间的曲线
x=-10:0.5:10;
y=-10:0.5:10;
[X,Y]=meshgrid(x,y);
Z=(X.^2) + (Y.^2) + 100;
mesh(X,Y,Z);
hold on;
contour(X,Y,Z,50);
grid;

%绘制其等高线
x=-10:1:10;
y=-10:1:10;
[X,Y]=meshgrid(x,y);
quiver(X,Y,(2*X),(2*Y));

%绘制分割的平面
y=-10:2:10;
z=-50:70:300;
[Y,Z]=meshgrid(y,z);
X = (Y+Z)*0-5;
mm = mesh(X,Y,Z);

%绘制第二个分割平面
x=-10:2:10;
z=-50:70:300;
[X,Z]=meshgrid(x,z);
Y = (X+Z)*0-5;
mm = mesh(X,Y,Z);

%绘制第三个分割平面
x=-10:2:10;
y=-10:2:10;
z=-50:70:300;
[X,Z]=meshgrid(x,z);
Y=y.*ones(size(X));
mm = mesh(X,Y,Z);

%绘制方向函数
x=-10:0.5:10;
y=-10:0.5:10;
ff=(x.^2) + (x.^2) + 100;
plot3(x,y,ff,'k','linewidth',2);

x=-10:0.5:10;
y=-10:0.5:10;
plot(x,y,'k','linewidth',2);

tt=-(5-5*sqrt(2)/2);
plot3([tt,tt],[tt,tt],[0,tt.^2+tt.^2+100],'k-.','linewidth',2);
plot3([tt,tt],[tt,tt],[0,tt.^2+tt.^2+100],'ko','linewidth',2);


%绘制横坐标的两个点
plot3([-5,-5],[-5,-5],[0,150],'r-.','linewidth',2);
plot3([-5,-5],[-5,-5],[0,150],'ko','linewidth',2);

text(-5,-5,130,'f(x^(^k^))','fontsize', 30);

plot3([-5,-5],[0,0],[0,125],'r-.','linewidth',2);
plot3([-5,-5],[0,0],[0,125],'ko','linewidth',2);

text(-5,0,20,'x^(^k^) + a^(^k^)dy^(^k^)','fontsize', 30);
text(-5,0,105,'f(x^(^k^) + a^(^k^)dy^(^k^))','fontsize', 30);

%绘制分割线段
y=-10:1:10;
x=y*0-5;
plot(x,y,'r','linewidth',2);
plot3(x,y,x.^2+y.^2+100,'r','linewidth',2);

%绘制纵坐标的两个点
plot3([0,0],[-5,-5],[0,125],'b-.','linewidth',2);
plot3([0,0],[-5,-5],[0,125],'ko','linewidth',2);

text(0,-5,20,'x^(^k^) + a^(^k^)dx^(^k^)','fontsize', 30);
text(0,-5,105,'f(x^(^k^) + a^(^k^)dx^(^k^))','fontsize', 30);

%绘制分割线段
x=-10:1:10;
y=x*0-5;
plot(x,y,'b','linewidth',2);
plot3(x,y,x.^2+y.^2+100,'b','linewidth',2);


%绘制一个圆锥
PlotCylinder([-5,-5,0],5,300);



%绘制切割平面
x=-10:0.5:10;
y=-10:0.5:10;
[X,Y]=meshgrid(x,y);
Z=-5*X -5*Y + 100;
mesh(X,Y,Z);


%绘制第4个分割的平面
y=-10:2:10;
z=-50:70:300;
[Y,Z]=meshgrid(y,z);
X = (Y+Z)*0-(5-5*sqrt(2)/2);;
mm = mesh(X,Y,Z);

%绘制第5个分割平面
x=-10:2:10;
z=-50:70:300;
[X,Z]=meshgrid(x,z);
Y = (X+Z)*0-(5-5*sqrt(2)/2);;
mm = mesh(X,Y,Z);






xlabel('x');
ylabel('y');
zlabel('z');



%配置一下绘制的格式
hold off;
grid;
axis square;








