function num_popu_encode = encoding(num_city, num_popu)
num_popu_encode = zeros(num_popu, num_city);
    for i = 1:num_popu
        city_idex = randperm(num_city); 
        num_popu_encode(i,:) = city_idex;
    end
end