function fit = fitness(num_popu_decode, num_city)
min_popu = min(num_popu_decode); %������̵ĸ���
num_popu_decode = num_popu_decode - min_popu; %ÿ������������·��������
fit = num_city*2./(num_popu_decode+0.5); %��Ӧ�ȣ������Լ��޸ģ�·����̵�Ϊ���Ÿ���
end