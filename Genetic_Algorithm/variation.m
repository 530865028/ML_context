function num_popu_var = variation(var_rate, num_popu)
for i=1:size(num_popu,1)
    if rand(1)<=var_rate %判断该个体是否需要变异
        index = randperm(size(num_popu,2)); %随机选择两个DNA（城市编号）
        %交换两个城市的位置
        temp = num_popu(i,index(1)); 
        num_popu(i,index(1)) = num_popu(i,index(2));
        num_popu(i,index(2)) = temp; 
    end
end
num_popu_var = num_popu;
end