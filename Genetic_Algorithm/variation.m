function num_popu_var = variation(var_rate, num_popu)
for i=1:size(num_popu,1)
    if rand(1)<=var_rate %�жϸø����Ƿ���Ҫ����
        index = randperm(size(num_popu,2)); %���ѡ������DNA�����б�ţ�
        %�����������е�λ��
        temp = num_popu(i,index(1)); 
        num_popu(i,index(1)) = num_popu(i,index(2));
        num_popu(i,index(2)) = temp; 
    end
end
num_popu_var = num_popu;
end