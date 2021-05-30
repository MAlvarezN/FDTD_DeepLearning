function lgraph = FullConnectionUnit_v2(lgraph ,...
                                  NumFilters1 ,...
                                  NumFilters2 ,...
                                  FilterSize , ...
                                  id )
% This function make a ResConvLayer without cocatenate the input/output
%
% ResConvLayer_v2: as function
%  Connect: conv3_    conv1_   add1_
%  
%  The comment lines are part of design, just ignore
% 
% 2020 - michael.alvarez2@upr.edu

% lgraph = layerGraph();

% tempLayers = imageInputLayer([128 128 3],"Name","imageinput");
% lgraph = addLayers(lgraph,tempLayers);

% tempLayers = convolution2dLayer([1 1],NumFilters1,"Name","conv3_"+id,"Padding","same");
% lgraph = addLayers(lgraph,tempLayers);

tempLayers = [
    convolution2dLayer(FilterSize,NumFilters2,"Name","conv1_"+id,"Padding","same")
    CReLU_Layer("crelu1_"+id)
    convolution2dLayer(FilterSize,NumFilters1,"Name","conv2_"+id,"Padding","same")
    Gated_Layer("gated1_"+id)];
%     additionLayer(2,"Name","add1_"+id)];
lgraph = addLayers(lgraph,tempLayers);

% lgraph = connectLayers(lgraph,"imageinput","conv_3");
% lgraph = connectLayers(lgraph,"imageinput","conv_1");
% lgraph = connectLayers(lgraph,"conv3_"+id,"add1_"+id+"/in2");
% lgraph = connectLayers(lgraph,"gated_1","addition_1/in1");

end