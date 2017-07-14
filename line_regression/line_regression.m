clc
clear
close all
x_data = [0:0.1:5];
y_data = 5*(x_data-2).^2 + 2*rand(1,length(x_data)) + 1;
figure(1)
plot(x_data,y_data,'k*');hold on
plot(x_data,5*(x_data-2).^2+2);

%% ≥ı ºªØ
a = 0;
b = 0;
c = 0;
iter = 200;
learning_rate = 0.001;
iter_init = 0;
loss = [];
count_data = length(x_data);
batch_size = 1;

while(iter_init<iter)
    y_temp = [];
    for i = 1:count_data/batch_size
        batch_x = x_data(i);
        batch_y = y_data(i);
        
        %y = a*batch_x'.^2 + b*batch_x' + c;
        y = a*(batch_x + b) .^2 + c;
        error = 1/2*(y - batch_y').^2;
        deta_a = ((y-batch_y')' * batch_x'.^2 + 2*b*batch_x + b^2)/ length(batch_x);
        deta_b = (y-batch_y')' * (2*a*batch_x' + 2*a*b )/ length(batch_x);
        deta_c = sum((y-batch_y')) / length(batch_x);
        a = a - learning_rate*deta_a;
        b = b - learning_rate*deta_b;
        c = c - learning_rate*deta_c;
        loss = [loss;error];
        y_temp = [y_temp;y];
        w = [a,b,c];
    end
    figure(2)
    plot(x_data,y_data, 'r*'),hold on
    plot(x_data,y_temp);
    hold off
    pause(2)
    
    iter_init = iter_init + 1;
%     learning_rate = learning_rate*2;
end