classdef CReLU_Layer < nnet.layer.Layer
    % Custom CReLU layer.
    % 2020 - michael.alvarez2@upr.edu

    properties (Learnable)
        % Layer learnable parameters
            
        % Dont need
        % cte % for customize
    end
    
    methods
        function layer = CReLU_Layer( name ) 
            % layer = CReluLayer(name) creates a CReLU layer
            % for 2-D image input specifies the layer name.

            % Set layer name.
            layer.Name = name;
            % layer.cte = cte ;
            
        end
        
        function Z = predict( layer , X)
            
            % layer is no need but if you replace by ~ the checknet fail
            
            % Y = cat(3,X , layer.cte .* X) ; % for customize
            Y = cat(3,X , - X) ;
            Z = relu(Y) ;
        end
    end
end