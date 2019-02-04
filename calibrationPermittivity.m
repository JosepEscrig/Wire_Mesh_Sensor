% Code to obtain calibrated void fraction values from .cdat files
% Data is the two-phase flow data
% CalOil is the oil calibration data
% CalAir is the air calibration data
% Mask is the matrix that mask the frame of the grid
% erOil is the permittivity of the oil
% erAir is the permittivity of the air
% model is the permittivity model ('parellel' or 'series')

function DataVoid=calibrationPermittivity(Data,CalOil,CalAir,mask,erOil,erAir,model)

% Calculate Air and Oil average voltage values
CalAirM=(mean(double(CalAir),3));
CalOilM=(mean(double(CalOil),3));

Data=double(Data);

if and(size(CalAirM,1)~=size(Data,1),size(CalOilM,1)~=size(Data,1))
    disp('Data and calibration data have different dimensions')
    disp('Data will not be calibrated')
    return
end

%%%% Voltage to permittivity (er) %%%%
%Volatge output of the WMS and the permittivity between two wires have a
%relationship of the form of V=a*log(er)+b, which a and b can be found out
%considering er(V=CalAirM)=erAir and er(V=CalOilM)=erOil

 a=(CalOilM-CalAirM)./(log(erOil)-log(erAir));
 b=(CalAirM*log(erOil)-CalOilM*log(erAir))./(log(erOil)-log(erAir));

 er=exp((Data-b)./a); 
%er=exp((Data-repmat(b, [1 1 size(Data,3)]))./(repmat(a, [1 1 size(Data,3)])));

clear Data CalOil CalAir


%%%% Permittivity to void fraction %%%%

switch model
    case 'parallel'
% Parallel model
DataVoid=(erOil-er)./(erOil-erAir)*100;

    case 'series'
% Series model
DataVoid=(erOil-er)./(erOil-erAir)*erAir./er*100;

    case 'otherwise'
% Parallel model
DataVoid=(erOil-er)./(erOil-erAir)*100;

end

%%%% Truncated between 0 and 100
DataVoid(DataVoid<0)=0;
DataVoid(DataVoid>100)=100;


if size(mask,1)~=size(DataVoid,1)
    disp('Data and mask have different dimensions')
    disp('Data will not be calibrated')
    return
end

DataVoid(repmat(mask,[1 1 size(DataVoid,3)])==255)=255;

end



