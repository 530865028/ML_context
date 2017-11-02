function net = upgrading(net)
net.d_mw = net.moment * net.d_mw + net.lr * net.d_w;
net.d_mv = net.moment * net.d_mv + net.lr * net.d_v;
net.d_mwb = net.moment * net.d_mwb + net.lr * net.d_wb;
net.d_mvb = net.moment * net.d_mvb + net.lr * net.d_vb;

net.w = net.w - net.d_mw;
net.v = net.v - net.d_mv;
net.wb = net.wb - net.d_mwb;
net.vb = net.vb - net.d_mvb;
end
