function net = build_net(Input, Hidden, Output, learning_rate, batch_size, moment)
% initializing param
net.num_input = Input;
net.num_hidden = Hidden;
net.num_output = Output;
net.lr = learning_rate;
net.batch_size = batch_size;
net.moment = moment;

%初始权值
net.w = rand([net.num_hidden, net.num_input]) - 0.5;
net.v = rand([net.num_output, net.num_hidden]) - 0.5;
% net.w = normrnd(0,1,net.num_hidden, net.num_input);
% net.v = normrnd(0,1,net.num_output, net.num_hidden);
net.wb = zeros(net.num_hidden,1);
net.vb = zeros(net.num_output,1);

%初始梯度
net.d_w = zeros(size(net.w));
net.d_v = zeros(size(net.v));
net.d_wb = zeros(size(net.wb));
net.d_vb = zeros(size(net.vb));

%初始迭代动量
net.d_mw = zeros(size(net.w));
net.d_mv = zeros(size(net.v));
net.d_mwb = zeros(size(net.wb));
net.d_mvb = zeros(size(net.vb));

end
