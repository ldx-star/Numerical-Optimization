function [x_best,y_best,f_best,k]=best_speed_down(fun,dfun,x_init,y_init,tolerance)
  %最速下降法程序
  %fun：输入函数
  %dfun：输入函数梯度
  %x_init：初始横坐标
  %y_init：初始纵坐标
  %tolerance：初始航向角
  %x_best：最小值横坐标
  %y_best：最小值纵坐标
  %f_best：最小值函数值
  %k：迭代的次数


  %初始化
  k=1;
  x_cur  = x_init;
  y_cur  = y_init;
  f_cur  = fun(x_cur,y_cur);

  x_cur_set(1) = x_cur;
  y_cur_set(1) = y_cur;
  f_cur_set(1) = f_cur;

  %获取当前函数值的梯度向量
  [gx_cur,gy_cur]=dfun(x_cur,y_cur);

  %构造当前分割平面函数
  temp_fun = @(alpha) fun(x_cur - alpha*gx_cur,y_cur -alpha*gy_cur);

  %使用三点二次插值法在当前的分割平面内查询最优值
  alpha_min = 0;
  alpha_max = 100;
  epsilon   = 1e-5;
  [min_alpha,next_f,kk] = quadratic3points_search(temp_fun,alpha_min,alpha_max,epsilon);
   min_alpha=0.1;

  %如果没有满足条件就继续迭代
  while(abs(next_f - f_cur)>tolerance)
    k=k+1;
    x_cur  = x_cur - min_alpha*gx_cur;
    y_cur  = y_cur - min_alpha*gy_cur;
    f_cur  = fun(x_cur,y_cur);
    x_cur_set(k) = x_cur;
    y_cur_set(k) = y_cur;
    f_cur_set(k) = f_cur;

    %获取当前函数值的梯度向量
    [gx_cur,gy_cur]=dfun(x_cur,y_cur);
    %构造当前分割平面函数
    temp_fun = @(alpha) fun(x_cur - alpha*gx_cur,y_cur -alpha*gy_cur);

    %使用三点二次插值法在当前的分割平面内查询最优值
    alpha_min = 0;
    alpha_max = 100;
    epsilon   = 1e-5;
    [min_alpha,next_f,kk] = quadratic3points_search(temp_fun,alpha_min,alpha_max,epsilon);
    min_alpha=0.1;
  end;

  %最优值赋值就行
  x_best = x_cur - min_alpha*gx_cur;
  y_best = y_cur - min_alpha*gy_cur;
  f_best = fun(x_best,y_best);

  plot(x_cur_set,y_cur_set,'r');
  plot(x_cur_set,y_cur_set,'r.');
  plot3(x_cur_set,y_cur_set,f_cur_set+0.5,'r.');
  for i=1:length(x_cur_set)
    plot3([x_cur_set(i),x_cur_set(i)],[y_cur_set(i),y_cur_set(i)],[0,f_cur_set(i)],'k-.');
  end


end
