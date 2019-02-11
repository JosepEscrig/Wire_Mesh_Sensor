% Rotates WMS void fraction data an angle depending on the R rotation matrix

function DataR=rotateData(Data,R)

Data=double(Data);

DataR=zeros(size(Data));

for i=1:size(Data,1)
    for j=1:size(Data,2)
        
        DataR(i,j,:)=sum(sum(Data.*repmat(squeeze(R(i,j,:,:)),[1,1,size(Data,3)])));
        
    end
end

end
