clc;clear;close all
%��������[x1,x2]��ȡֵ��Χ����[-2,2]
%���ɶ�ά��������,ʹ�����溯���������ɣ�30����[-2,2]��������30��
%Ȼ���Ƕ�ά�������������ɵ�������900*2��
x =gridsamp([-2 -2;2 2], 30);
% Ŀ�꺯����ʽ��
obj= [1-exp(-(x(:,1)-1/sqrt(2)).^2 - (x(:,2)-1/sqrt(2)).^2),1-exp(-(x(:,1)+1/sqrt(2)).^2 - (x(:,2)+1/sqrt(2)).^2)];
% �������溯����ʶ900��Ŀ����������Щ������paretoǰ�أ�
% ��paretoǰ�صı�ʶΪ1�������index,index������Ҫô0��Ҫô1��
index = Paretoset(obj);   
% ����ʶΪ1��paretoǰ�ص㣩��������ȡ������
TruePareto = obj(index,:); 
% ��������Ŀ��㡣
scatter(obj(:,1),obj(:,2));
hold on
%����paretoǰ�ص�
scatter(TruePareto(:,1),TruePareto(:,2),'r');
xlabel('f1');
ylabel('f2');
%�¿�һ�����ڻ��Ʊ����ռ�
figure
scatter(x(:,1),x(:,2))
xlabel('x1');
ylabel('x2');
hold on
paretoset = x(index,:);%ȡ��900��������������Щ��pareto�⼯
scatter(paretoset(:,1),paretoset(:,2),'r') %����pareto�⼯

%�¿����ڻ���Ŀ�꺯����
x1 = reshape(x(:,1),30,30); %��x��900x2�ĵ�һ��ת����30x30��
x2 = reshape(x(:,2),30,30);%ͬ�ϣ� B = reshape(A,m,n)  ������A��Ԫ�ط��ص�һ��m��n�ľ���B�����A��û��m��n��Ԫ���򷵻�һ������
%���ƺ���1
figure
y1 = reshape(obj(:,1), size(x1));%��obj��900x2�ĵ�һ��ת����30x30��������1��Ŀ��ֵ
mesh(x1, x2, y1);
%���ƺ���2
figure
y2 = reshape(obj(:,2), size(x1));
mesh(x1, x2, y2);
%֪���ĺ�����ͼ���õ�רҵ��ͼ������Ƶ�

