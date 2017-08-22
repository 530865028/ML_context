function output = init_distance(num_city, max_axis)
output = zeros(3,num_city); 
output(1,:) = [1:num_city]; %保存城市编号
rand_index = randperm(max_axis); 
output(2,:) = rand_index(1:num_city); %保存x轴坐标
output(3,:) = rand_index(num_city+1:2*num_city); %保存y轴坐标
end