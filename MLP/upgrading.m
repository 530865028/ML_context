function net = upgrading(net)

net.d_sw = net.moment * net.d_sw + net.lr*net.d_w
net.d_sv = net.moment * net.d_sv + net.lr*net.d_v
net.d_swb = net.moment * net.d_swb + net.lr*net.d_wb
net.d_svb = net.moment * net.d_svb + net.lr*net.d_vb
net.w = net.w - net.d_sw;
net.v = net.v - net.d_sv;
net.wb = net.wb - sum(net.d_swb,2)/net.batch_size;
net.vb = net.vb - sum(net.d_svb,2)/net.batch_size;

end
