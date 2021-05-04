function [errP , minV , maxV ] = ...
         overall_error_net( net , X_Train , Y_Train )
% Error in predict of all samples
mn   = size(X_Train) ;
errP = zeros(1,mn(2)) ;
for i=1:mn(2)
    mn2 = size(X_Train{1,i});
    err = zeros(1,mn2(2)) ;
    for k = 1 : mn2(2)
        
      Y =   net(X_Train{1,i}(:,k));
        
      err(k) = norm( Y - Y_Train{1,i}(:,k)) ;
    end
    errP(i) = mean(err) ;
end 

figure, 
    plot(errP) ;

minV = Minimo(errP) ;
maxV = Maximo(errP) ;

end