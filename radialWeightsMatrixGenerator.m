% Code to generate the radial weights matrix
% M is the cells weights matrix
% r is the number of radial division
% R is a n x n x r matrix containing the weight of each cell in each radial
% division

function R=radialWeightsMatrixGenerator(M,r)

n=size(M,1);

for k=1:r
    
    r1=n/2/r*(k-1);  % inner radius
    r2=n/2/r*(k);    % outer radius
    if k==r
        r2=2*r2;     % last radial division must include all the outer cells
    end
    th = 0:pi/50:2*pi;
    x=n/2;
    y=n/2;
    
    xunit1 = r1 * cos(th)+x;
    yunit1 = r1 * sin(th)+y;
    circle1 = polyshape(xunit1(1:end-1),yunit1(1:end-1));    % inner circle
    
    xunit2 = r2 * cos(th)+x;
    yunit2 = r2 * sin(th)+y;
    circle2 = polyshape(xunit2(1:end-1),yunit2(1:end-1));    % outer circle 
    
    ring=xor(circle1,circle2);   % ring between inner and outer circles

    % calculate the weights as the area of each cell inside each ring
    for i=1:n   
        for j=1:n       
            square= polyshape([i-1,i-1,i,i],[j-1,j,j,j-1]);
            areaCell=intersect(ring,square);
            R(i,j,k)=M(i,j)*area(areaCell);  
        end
    end
    
    % normalize the weights in each radial division
    R(:,:,k)=R(:,:,k)/sum(sum(R(:,:,k)));
    
end

