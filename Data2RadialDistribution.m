


function VF_R=Data2RadialDistribution(Data,R)

DataMean=mean(Data,3);

for r=1:size(R,3)
    VF_R(r)=sum(sum((DataMean.*R(:,:,r))));
end

end