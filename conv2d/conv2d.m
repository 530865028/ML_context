function outputmap = conv2d(image, key_word, kernel, stride)

if length(size(image)) == 3
    image = rgb2gray(image); % 将图片变成单通道
end

[ih, iw] = size(image);
[kh, kw] = size(kernel);
ph = floor(kh/2); %pad 的高
pw = floor(kw/2); %pad 的宽

if strcmp(key_word, 'Same') 
    Inputmap = zeros([ih+2*ph, iw+2*pw]); 
    Inputmap(ph+1:ih+ph, pw+1:iw+pw) = image;
    oh = (ih+2*ph-kh)/stride+1; %输出图的高
    ow = (iw+2*pw-kw)/stride+1; %输出图的宽
else
    Inputmap = image;
    oh = (ih-kh)/stride+1;
    ow = (iw-kw)/stride+1;
end

for i=1:oh
    for j=1:ow
        outputmap(i,j) = sum(sum(double(Inputmap(i:i+kh-1,j:j+kw-1)) .* double(kernel))); %卷积
    end
end
end