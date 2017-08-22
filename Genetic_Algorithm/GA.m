%%%
%https://github.com/hnVfly/ML_context
%Author: shaun
%%%

clc
clear
close all

NUM_CITY = 20; %城市个数
NUM_POPU = 1000; %没代个体数
MAX_AXIS = 100; %城市分布范围
VARI_RATE = 0.2; %变异率
CROSS_RATE = 0.8; %交叉率
MAX_ITER = 300; %最大遗传代数

DT = init_distance(NUM_CITY, MAX_AXIS); %初始化城市分布
num_popu = encoding(NUM_CITY, NUM_POPU); %初始化初代种群

Distance = [];
for i = 1:MAX_ITER
    num_popu_decode = decoding(num_popu, DT); %从编码转换为实际距离
    fit = fitness(num_popu_decode,NUM_CITY); %计算每个个体的适应度
    %作图，画出适应度最大的个体的路径
    [num, index] = max(fit);
    path = num_popu(index,:);
    figure(1)
    axis([0,100,0,100])
    plot(DT(2,:),DT(3,:),'ro')
    title('TSP')
    grid on
    hold on
    for j = 1:length(path)-1
        plot([DT(2,path(j)),DT(2,path(j+1))],[DT(3,path(j)),DT(3,path(j+1))],'b-')
    end
    hold off
    pause(0.01)
    disp(['iter:',num2str(i),' | best distance is :',num2str(num_popu_decode(index))])
    Distance = [Distance;num_popu_decode(index)];
    num_popu = exchange(fit, num_popu, CROSS_RATE); %种群个体交叉
    num_popu = variation(VARI_RATE, num_popu); %种群个体变异
end

figure(2)
plot(Distance)
xlabel('迭代次数')
ylabel('最优距离变化')
