classdef Gated_Layer < nnet.layer.Layer
    % Custom Gated layer.

    properties (Learnable)
        % Layer learnable parameters
       
    end
    
    methods
        function layer = Gated_Layer( name) 
            % layer = Gated_Layer( name) creates a gated layer
            % for 2-D image input specifies the layer name.

            % Set layer name.
            layer.Name = name;

        end
        
        function Z = predict(layer, X)
            % Z = predict(layer, X) forwards the input data X through the
            % layer and outputs the result Z.
            
            Y = sigmoid(X) ;
            Z = X .* Y ;
            
%             disp(size(Z))
            
        end
        
        
        function Y = sigmoid(X)
            Y = 1 / (1 + exp(-X) ) ;
        end
    end
end