function num_popu = exchange(fit_rate, num_popu, cross_rate)
fit_rate = fit_rate/sum(fit_rate); %����Ӧ�Ƚ��й�һ��
cp = cumsum(fit_rate); %�ۼӣ�����ѡȡ�������ʱ��Ҫ
N = length(fit_rate); %������
for i=1:N
    if rand()<cross_rate %�ж��Ƿ񽻲�
        [~, m_index] = find(rand() < cp); %����Ӧ��ѡ�񽻲���壬��Ӧ��Խ�ߵı�ѡ���ĸ��ʴ�
        m_ = m_index(1); %ѡ�񵽵ĸ��������
        cross_point = randi(2,1,size(num_popu,2))-1; %���ѡ�񽻲��
        p = num_popu(i,:).*cross_point(); %��ȡ�ø��岻�ı��λ��
        [~, index] = find(p==0); %��ȡ��Ҫ�ı䣨���棩λ�õ�����
        m_get = num_popu(i, index); %��ȡ�ø�����Ҫ�������λ�ö�Ӧ��DNA�����б�ţ�
        [~, m] = intersect(num_popu(m_,:), m_get); %��ѡ���Ľ�����壨[~, m_index] = find(rand() < cp)����ѡ���������
        m_sort = sort(m); %��ѡ���Ľ����������˳������
        p(index) = num_popu(m_,m_sort); %��ѡ������˳��ĳ��б�Ŵ���ԭ����Ҫ�������λ��
        num_popu(i,:) = p; %���µ������滻ԭ��������
    end
end
end