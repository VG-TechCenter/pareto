clc;clear;close all
%两个变量[x1,x2]，取值范围都是[-2,2]
%生成二维变量矩阵,使用下面函数即可生成，30代表[-2,2]均匀生成30份
%然后是二维变量，最终生成的数组是900*2；
x =gridsamp([-2 -2;2 2], 30);
% 目标函数公式；
obj= [1-exp(-(x(:,1)-1/sqrt(2)).^2 - (x(:,2)-1/sqrt(2)).^2),1-exp(-(x(:,1)+1/sqrt(2)).^2 - (x(:,2)+1/sqrt(2)).^2)];
% 调用下面函数标识900个目标样本中哪些样本是pareto前沿，
% 是pareto前沿的标识为1，并输出index,index的数据要么0，要么1；
index = Paretoset(obj);   
% 将标识为1（pareto前沿点）的数据提取出来；
TruePareto = obj(index,:); 
% 绘制所有目标点。
scatter(obj(:,1),obj(:,2));
hold on
%绘制pareto前沿点
scatter(TruePareto(:,1),TruePareto(:,2),'r');
xlabel('f1');
ylabel('f2');
%新开一个窗口绘制变量空间
figure
scatter(x(:,1),x(:,2))
xlabel('x1');
ylabel('x2');
hold on
paretoset = x(index,:);%取出900个样本点里面哪些是pareto解集
scatter(paretoset(:,1),paretoset(:,2),'r') %绘制pareto解集

%新开窗口绘制目标函数。
x1 = reshape(x(:,1),30,30); %把x的900x2的第一列转换成30x30，
x2 = reshape(x(:,2),30,30);%同上， B = reshape(A,m,n)  将矩阵A的元素返回到一个m×n的矩阵B。如果A中没有m×n个元素则返回一个错误
%绘制函数1
figure
y1 = reshape(obj(:,1), size(x1));%把obj的900x2的第一列转换成30x30，即函数1的目标值
mesh(x1, x2, y1);
%绘制函数2
figure
y2 = reshape(obj(:,2), size(x1));
mesh(x1, x2, y2);
%知乎的函数绘图是用的专业绘图软件绘制的

