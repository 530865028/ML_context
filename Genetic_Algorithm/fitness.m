function fit = fitness(num_popu_decode, num_city)
min_popu = min(num_popu_decode); %距离最短的个体
num_popu_decode = num_popu_decode - min_popu; %每个个体相对最短路径的增量
fit = num_city*2./(num_popu_decode+0.5); %适应度，可以自己修改，路径最短的为最优个体
end