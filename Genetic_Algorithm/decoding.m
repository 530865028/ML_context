function num_popu_decode = decoding(num_popu, dt)
    num_popu_decode = zeros(1,size(num_popu,1)); %��ʼ����Ϊ0
    for i = 1:size(num_popu,1)
        dist = 0;
        for j = 1:(size(num_popu,2)-1)
            dist = dist + sqrt((dt(2,num_popu(i,j+1))-dt(2,num_popu(i,j)))^2+(dt(3,num_popu(i,j+1))-dt(3,num_popu(i, j)))^2);%�����б�ż���ŷʽ����
        end
        num_popu_decode(i)  = dist;
    end
end