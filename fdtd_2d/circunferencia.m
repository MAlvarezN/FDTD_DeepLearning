function out = circunferencia(r,ploting,h,k,M,N)


if nargin == 0   % To test function    

    M = 100 ;
    N = 200 ;

    Xindex = 1:M ;
    Yindex = [1:N]' ;

    Y = kron(ones(1,M),Yindex);
    X = kron(ones(N,1),Xindex);

    % Cetro
    h = 50 ;
    k = 100 ;

    % Radio
    r = 30 ;

    out = sqrt( (X-h).^2 + (Y-k).^2 ) <= r  ;

    figure, imshow(out)
    % colormap gray
elseif nargin ==1 % solo radio
%     r = (floor(2*r)+1)/2 ;
    r = floor(r) ;
    M = 2*r+1 ;
    N = 2*r+1 ;

    Xindex = 1:M ;
    Yindex = (1:N)' ;

    Y = kron(ones(1,M),Yindex);
    X = kron(ones(N,1),Xindex);

    % Cetro
    h = M/2;%r+2
    k = N/2;%r+1;

    % Radio
%     r = 30

    out = sqrt( (X-h).^2 + (Y-k).^2 ) <= r  ;

    imshow(out)
    
    elseif nargin ==2 % radio and ploting
%     r = (floor(2*r)+1)/2 ;
    r = floor(r) ;
    M = 2*r+1 ;
    N = 2*r+1 ;

    Xindex = 1:M ;
    Yindex = (1:N)' ;

    Y = kron(ones(1,M),Yindex);
    X = kron(ones(N,1),Xindex);

    % Cetro
    h = M/2;%r+2
    k = N/2;%r+1;

    % Radio
%     r = 30

    out = sqrt( (X-h).^2 + (Y-k).^2 ) <= r  ;
    if ploting == 'y'
        imshow(out)
    end
end
if nargout == 0   
    out = [] ;
end

end
