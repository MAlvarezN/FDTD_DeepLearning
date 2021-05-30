%{
create_Unet_ResBlock_FullConection


This script is to generate a Unet (Encoder-Decoder based) network with
 custom layers and a full-conection unit using residual blocks

2020 - michael.alvarez2@upr.edu

%}
%% 
% imageInputLayer([128 128 3],"Name","imageinput")
% switch info.architecture 
%     case 'carlos'
% vecInput = [sequence_info.patches_row,sequence_info.patches_column,sequence_info.reduced_bands+1] ;
%     case 'michael'
    vecInput = [128 128 2] ;
% end
% close all
% -------------------------------------------------------------------------
%% Encoder start
lgraph = layerGraph();

tempLayers = imageInputLayer(vecInput,"Name","imageinput") ;
lgraph = addLayers(lgraph,tempLayers);

lgraph = ResConvLayer_v2( lgraph , 8 , 8 , [3 3], "1") ;
lgraph = ResConvLayer_v2( lgraph , 8 , 8 , [3 3], "2") ;

tempLayers = [
%     imageInputLayer(vecInput,"Name","imageinput")
%      ResConvLayer("Encoder_1_1",8,[3 3],vecInput(3))
%      ResConvLayer("Encoder_2_1",8,[3 3],8)
    maxPooling2dLayer(2,"Stride",2,"Name","maxpool_1","Padding","same")];
lgraph = addLayers(lgraph,tempLayers);

lgraph = connectLayers(lgraph,"imageinput","conv3_1");
lgraph = connectLayers(lgraph,"imageinput","conv1_1");
lgraph = connectLayers(lgraph,"add1_1","conv3_2");
lgraph = connectLayers(lgraph,"add1_1","conv1_2");
lgraph = connectLayers(lgraph,"add1_2","maxpool_1");

lgraph = ResConvLayer_v2( lgraph , 16 , 16 , [3 3], "3") ;
lgraph = ResConvLayer_v2( lgraph , 16 , 16 , [3 3], "4") ;
tempLayers = [
%      ResConvLayer("Encoder_1_2",16,[3 3],8)
%      ResConvLayer("Encoder_2_2",16,[3 3],16)
    maxPooling2dLayer(2,"Stride",2,"Name","maxpool_2","Padding","same")];
lgraph = addLayers(lgraph,tempLayers);

lgraph = connectLayers(lgraph,"maxpool_1","conv3_3");
lgraph = connectLayers(lgraph,"maxpool_1","conv1_3");
lgraph = connectLayers(lgraph,"add1_3","conv3_4");
lgraph = connectLayers(lgraph,"add1_3","conv1_4");
lgraph = connectLayers(lgraph,"add1_4","maxpool_2");

lgraph = ResConvLayer_v2( lgraph , 32 , 32 , [3 3], "5") ;
lgraph = ResConvLayer_v2( lgraph , 32 , 32 , [3 3], "6") ;
tempLayers = [
%      ResConvLayer("Encoder_1_3",32,[3 3],16)
%      ResConvLayer("Encoder_2_3",32,[3 3],32)
    maxPooling2dLayer(2,"Stride",2,"Name","maxpool_3","Padding","same")];
lgraph = addLayers(lgraph,tempLayers);

lgraph = connectLayers(lgraph,"maxpool_2","conv3_5");
lgraph = connectLayers(lgraph,"maxpool_2","conv1_5");
lgraph = connectLayers(lgraph,"add1_5","conv3_6");
lgraph = connectLayers(lgraph,"add1_5","conv1_6");
lgraph = connectLayers(lgraph,"add1_6","maxpool_3");

lgraph = ResConvLayer_v2( lgraph , 64 , 64 , [3 3], "7") ;
lgraph = ResConvLayer_v2( lgraph , 64 , 64 , [3 3], "8") ;
tempLayers = [
%      ResConvLayer("Encoder_1_4",64,[3 3],32)
%      ResConvLayer("Encoder_2_4",64,[3 3],64)
    maxPooling2dLayer(2,"Stride",2,"Name","maxpool_4","Padding","same")];
lgraph = addLayers(lgraph,tempLayers);

lgraph = connectLayers(lgraph,"maxpool_3","conv3_7");
lgraph = connectLayers(lgraph,"maxpool_3","conv1_7");
lgraph = connectLayers(lgraph,"add1_7","conv3_8");
lgraph = connectLayers(lgraph,"add1_7","conv1_8");
lgraph = connectLayers(lgraph,"add1_8","maxpool_4");

lgraph = ResConvLayer_v2( lgraph , 128 , 128 , [3 3], "9") ;
lgraph = ResConvLayer_v2( lgraph , 128 , 128 , [3 3], "10") ;
tempLayers = [
%      ResConvLayer("Encoder_1_5",128,[3 3],64)
%      ResConvLayer("Encoder_2_5",128,[3 3],128)
    maxPooling2dLayer(2,"Stride",2,"Name","maxpool_5","Padding","same")];
lgraph = addLayers(lgraph,tempLayers);

lgraph = connectLayers(lgraph,"maxpool_4","conv3_9");
lgraph = connectLayers(lgraph,"maxpool_4","conv1_9");
lgraph = connectLayers(lgraph,"add1_9","conv3_10");
lgraph = connectLayers(lgraph,"add1_9","conv1_10");
lgraph = connectLayers(lgraph,"add1_10","maxpool_5");

% -------------------------------------------------------------------------
%% Transition: Encoder end
lgraph = ResConvLayer_v2( lgraph , 256 , 256 , [3 3], "11") ;
lgraph = ResConvLayer_v2( lgraph , 256 , 256 , [3 3], "12") ;
tempLayers = [
%      ResConvLayer("Encoder_1_6",256,[3 3],128)
%      ResConvLayer("Encoder_2_6",256,[3 3],256)
    maxPooling2dLayer(2,"Stride",2,"Name","maxpool_6","Padding","same")
%     ResTrConvLayer("Decoder_6",128,[3 3],256)
    ];   
lgraph = addLayers(lgraph,tempLayers);

lgraph = ResTrConvLayer_v2( lgraph , 128 , 128 , [3 3], "1") ;

lgraph = connectLayers(lgraph,"maxpool_5","conv3_11");
lgraph = connectLayers(lgraph,"maxpool_5","conv1_11");
lgraph = connectLayers(lgraph,"add1_11","conv3_12");
lgraph = connectLayers(lgraph,"add1_11","conv1_12");
lgraph = connectLayers(lgraph,"add1_12","maxpool_6");


%% Skip connection

% ----------- FullConnectionUnit_v1 ------------------------------
% lgraph = FullConnectionUnit_v1( lgraph , 8 , 8 , [3 3], "f1") ;
% 
% lgraph = connectLayers(lgraph,"maxpool_6","conv3_f1");
% lgraph = connectLayers(lgraph,"maxpool_6","conv1_f1");
% ----------- FullConnectionUnit_v1 ------------------------------

% ----------- FullConnectionUnit_v2 ------------------------------
lgraph = FullConnectionUnit_v2( lgraph , 8 , 8 , [3 3], "f1") ;

lgraph = connectLayers(lgraph,"maxpool_6","conv1_f1");
% ----------- FullConnectionUnit_v2 ------------------------------

lgraph = connectLayers(lgraph,"gated1_f1","trconv3_1");
lgraph = connectLayers(lgraph,"gated1_f1","trconv1_1");
% 
% figure,
%     plot(lgraph);
%     drawnow
%     return
% -------------------------------------------------------------------------
%% Decoder start
tempLayers = [     
    depthConcatenationLayer(2,"Name","depthcat_5")
%      ResTrConvLayer("Decoder_5",64,[3 3],256)
     ];
lgraph = addLayers(lgraph,tempLayers);

lgraph = ResTrConvLayer_v2( lgraph , 64 , 64 , [3 3], "2") ;

lgraph = connectLayers(lgraph,"maxpool_5","depthcat_5/in1");
lgraph = connectLayers(lgraph,"tradd1_1","depthcat_5/in2");
lgraph = connectLayers(lgraph,"depthcat_5","trconv3_2");
lgraph = connectLayers(lgraph,"depthcat_5","trconv1_2");
 
tempLayers = [
    depthConcatenationLayer(2,"Name","depthcat_4")
%      ResTrConvLayer("Decoder_4",32,[3 3],128)
    ];
lgraph = addLayers(lgraph,tempLayers);

lgraph = ResTrConvLayer_v2( lgraph , 32 , 32 , [3 3], "3") ;

lgraph = connectLayers(lgraph,"maxpool_4","depthcat_4/in1");
lgraph = connectLayers(lgraph,"tradd1_2","depthcat_4/in2");
lgraph = connectLayers(lgraph,"depthcat_4","trconv3_3");
lgraph = connectLayers(lgraph,"depthcat_4","trconv1_3");

tempLayers = [
    depthConcatenationLayer(2,"Name","depthcat_3")
%      ResTrConvLayer("Decoder_3",16,[3 3],64)
     ];
lgraph = addLayers(lgraph,tempLayers);

lgraph = ResTrConvLayer_v2( lgraph , 16 , 16 , [3 3], "4") ;

lgraph = connectLayers(lgraph,"maxpool_3","depthcat_3/in1");
lgraph = connectLayers(lgraph,"tradd1_3","depthcat_3/in2");
lgraph = connectLayers(lgraph,"depthcat_3","trconv3_4");
lgraph = connectLayers(lgraph,"depthcat_3","trconv1_4");

tempLayers = [
    depthConcatenationLayer(2,"Name","depthcat_2")
%      ResTrConvLayer("Decoder_2",8,[3 3],32)
     ];
lgraph = addLayers(lgraph,tempLayers);
    
lgraph = ResTrConvLayer_v2( lgraph , 8 , 8 , [3 3], "5") ;

lgraph = connectLayers(lgraph,"maxpool_2","depthcat_2/in1");
lgraph = connectLayers(lgraph,"tradd1_4","depthcat_2/in2");
lgraph = connectLayers(lgraph,"depthcat_2","trconv3_5");
lgraph = connectLayers(lgraph,"depthcat_2","trconv1_5");

tempLayers = [
    depthConcatenationLayer(2,"Name","depthcat_1")
%      ResTrConvLayer("Decoder_1",2,[3 3],16)
%     regressionLayer("Name","regressionoutput")
    ];
lgraph = addLayers(lgraph,tempLayers);

lgraph = ResTrConvLayer_v2( lgraph , 1 , 1 , [3 3], "6") ;

lgraph = connectLayers(lgraph,"maxpool_1","depthcat_1/in1");
lgraph = connectLayers(lgraph,"tradd1_5","depthcat_1/in2");
lgraph = connectLayers(lgraph,"depthcat_1","trconv3_6");
lgraph = connectLayers(lgraph,"depthcat_1","trconv1_6");

tempLayers = regressionLayer("Name","regressionoutput") ;
lgraph = addLayers(lgraph,tempLayers);

lgraph = connectLayers(lgraph,"tradd1_6","regressionoutput");

% -------------------------------------------------------------------------
%% plot
figure,
    plot(lgraph);
    drawnow
    return
    
% -------------------------------------------------------------------------