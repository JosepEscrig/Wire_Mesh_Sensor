% Code to calculate void fraction time series from void fraction matrices
% A is a Matlab matrix of dimensions n x n x number_of_frames
% M is the matrix of weights
% VF is the average void fraction time series in the cross-section where the wire
% mesh sensor is placed

function VF=Data2TimeSeries(A,M)

if size(A,1)~=size(M,1)
    disp('Data and weights matrix have different sizes')
    disp('Data will not be processed')
    return
end

VF=zeros(size(A,3),1);

for n=1:size(A,3)
    
   VF(n)=sum(sum(double(A(:,:,n)).*M));
    
end
    
end

