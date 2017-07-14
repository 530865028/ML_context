function outputmap = conv2d(image, key_word, kernel, stride)

if length(size(image)) == 3
    image = rgb2gray(image); % ��ͼƬ��ɵ�ͨ��
end

[ih, iw] = size(image);
[kh, kw] = size(kernel);
ph = floor(kh/2); %pad �ĸ�
pw = floor(kw/2); %pad �Ŀ�

if strcmp(key_word, 'Same') 
    Inputmap = zeros([ih+2*ph, iw+2*pw]); 
    Inputmap(ph+1:ih+ph, pw+1:iw+pw) = image;
    oh = (ih+2*ph-kh)/stride+1; %���ͼ�ĸ�
    ow = (iw+2*pw-kw)/stride+1; %���ͼ�Ŀ�
else
    Inputmap = image;
    oh = (ih-kh)/stride+1;
    ow = (iw-kw)/stride+1;
end

for i=1:oh
    for j=1:ow
        outputmap(i,j) = sum(sum(double(Inputmap(i:i+kh-1,j:j+kw-1)) .* double(kernel))); %���
    end
end
end