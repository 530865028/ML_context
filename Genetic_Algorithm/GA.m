%%%
%https://github.com/hnVfly/ML_context
%Author: shaun
%%%

clc
clear
close all

NUM_CITY = 20; %���и���
NUM_POPU = 1000; %û��������
MAX_AXIS = 100; %���зֲ���Χ
VARI_RATE = 0.2; %������
CROSS_RATE = 0.8; %������
MAX_ITER = 300; %����Ŵ�����

DT = init_distance(NUM_CITY, MAX_AXIS); %��ʼ�����зֲ�
num_popu = encoding(NUM_CITY, NUM_POPU); %��ʼ��������Ⱥ

Distance = [];
for i = 1:MAX_ITER
    num_popu_decode = decoding(num_popu, DT); %�ӱ���ת��Ϊʵ�ʾ���
    fit = fitness(num_popu_decode,NUM_CITY); %����ÿ���������Ӧ��
    %��ͼ��������Ӧ�����ĸ����·��
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
    num_popu = exchange(fit, num_popu, CROSS_RATE); %��Ⱥ���彻��
    num_popu = variation(VARI_RATE, num_popu); %��Ⱥ�������
end

figure(2)
plot(Distance)
xlabel('��������')
ylabel('���ž���仯')
