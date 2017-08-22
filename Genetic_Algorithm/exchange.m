function num_popu = exchange(fit_rate, num_popu, cross_rate)
fit_rate = fit_rate/sum(fit_rate); %将适应度进行归一化
cp = cumsum(fit_rate); %累加，后面选取交叉个体时需要
N = length(fit_rate); %个体数
for i=1:N
    if rand()<cross_rate %判断是否交叉
        [~, m_index] = find(rand() < cp); %按适应度选择交叉个体，适应度越高的被选定的概率大
        m_ = m_index(1); %选择到的个体的索引
        cross_point = randi(2,1,size(num_popu,2))-1; %随机选择交叉点
        p = num_popu(i,:).*cross_point(); %提取该个体不改变的位置
        [~, index] = find(p==0); %提取需要改变（交叉）位置的索引
        m_get = num_popu(i, index); %提取该个体需要做交叉的位置对应的DNA（城市编号）
        [~, m] = intersect(num_popu(m_,:), m_get); %从选定的交叉个体（[~, m_index] = find(rand() < cp)）中选择城市索引
        m_sort = sort(m); %按选定的交叉个体自身顺序排列
        p(index) = num_popu(m_,m_sort); %用选定的新顺序的城市编号代替原来需要交换点的位置
        num_popu(i,:) = p; %用新的序列替换原来的序列
    end
end
end