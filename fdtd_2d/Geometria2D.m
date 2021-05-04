function out = Geometria2D( param , tipo)
% ---------------------------------------------------------
% Make geometry for FDTD 2D   :: 2007-simon.pdf
% ---------------------------------------------------------
%  Esta funcion se encarga de generar la geometria de 
% 2007-simon.pdf en los primeros tres casos, los parametros
% por defecto son:
% Size in pixels and equivalent 
% M = 200 ; % X-axis length in pixels
% N = 150 ; % Y-axis length in pixels
% 
% xL = 110 ; % X-axis length in micrometers
% yL = 75 ;  % Y-axis length in micrometers
% 
% xBead = 55 ; % Position x of bead in micrometers
% yBead = 45 ; % Position y of bead in micrometers
% rBead = .8 ; % radious of bead in micrometers
% 
% Ingresar los datos en la siguiente forma:
% out = prueba_geometria( tipo , param ) ;
% tipo  = 'B' ; % A B C de la Fig. 2.
% param.M = 200 ; % X-axis length in pixels
% param.N = 150 ; % Y-axis length in pixels
% param.xL= 110 ; % X-axis length in micrometers
% param.yL= 75 ;  % Y-axis length in micrometers
% param.xBead = 55 ; % Position x of bead in micrometers
% param.yBead = 45 ; % Position y of bead in micrometers
% param.rBead = .8 ; % Radious of bead in micrometers
% 
% (*) Si nargin == 2 , entonces el segundo es el tipo, y el primero 
%  sera 0 para no cambiar todo lo demas...
% 
% ---------------------------------------------------------
% Hecho por Michael Alvarez ::michael.alvarez2@upr.edu
% ---------------------------------------------------------

% close all
% figure
% clear 
% clc
if nargin == 1 
    tipo = param.tipo_geometria ;
    M = param.M ;
    N = param.N ;
    xL = param.xL ;
    yL = param.yL ;
    xBead = param.xBead ;
    yBead = param.yBead ;
    rBead = param.rBead ;   
elseif nargin == 2
    % Size in pixels and equivalent 
% %     % 20 / 01 / 30 - Larry
% %     M = 2500 ; % X-axis length in pixels
% %     N = 1800 ; % Y-axis length in pixels
    M = 2531 ; % X-axis length in pixels
    N = 1853 ; % Y-axis length in pixels

    xL = 102.94 ; % X-axis length in micrometers
    yL = 75 ;  % Y-axis length in micrometers

    % Position and radious of bead
    xBead = xL/2 ; % in micrometers
    yBead = 45 ; % in micrometers
    rBead = .8; % in micrometers   ***********
    isPML = 1 ; % Para incluir la region con PML **************
else
    % To test function    
    tipo = 'Fig2a' ;
    % Size in pixels and equivalent 
    M = 2531 ; % X-axis length in pixels
    N = 1853 ; % Y-axis length in pixels

    xL = 102.94 ; % X-axis length in micrometers
    yL = 75 ;  % Y-axis length in micrometers

    % Position and radious of bead
    xBead = xL/2 ; % in micrometers
    yBead = 45 ; % in micrometers
    rBead =.8 ; %  in micrometers 
    isPML = 0 ; % Para incluir la region con PML **************
end

% Size in pixels
MwidthPML = M ; % X-axis length in pixels with PML
NdepthPML = N ; % Y-axis length in pixels with PML
if isPML == 1
    disp('PML')
    % Region sin PML:
    %  x direction
    pis = 16 ;
    pie = 2516 ;
    Mwidth = pie - pis + 1 ;
    %  y direction
    pjs = 16 ;
    pje = 1838 ;
    Ndepth = pje - pjs + 1 ;
else
    Mwidth = M ; % X-axis length in pixels
    Ndepth = N ; % Y-axis length in pixels
end

xBeadPix = round(xBead/xL*MwidthPML) ; % in Pixels
yBeadPix = round(yBead/yL*NdepthPML) ; % in Pixels
% Mwidth/xL
% Ndepth/yL
rxBeadPix = rBead/xL*Mwidth ; % r_x in Pixels
ryBeadPix = rBead/yL*Ndepth ; % r_y in Pixels
% sqrt( rxBeadPix^2 + ryBeadPix^2 )
% rPix = round(sqrt( rxBeadPix^2 + ryBeadPix^2 ))  % r in Pixels
dx = 4.1170e-08 ;
rPix = rBead*1e-6/dx ;
Bead = circunferencia(rPix); % Rectangulo que contiene circunferencia
% return
% Refraction index
nBead  = 1.48 ; % bead  n = 1.48 
nWater = 1.33 ; % water n = 1.33
nJunct = 1.37 ; % flat junction and sinusoidal junction n = 1.37
nDermi = 1.40 ; % dermis    n = 1.4
nNucle = 1.39 ; % nucleus   n = 1.39
nCytop = 1.37 ; % cytoplasm n = 1.37
nInter = 1.34 ; % intercellular fluid n = 1.34
nMitoc = 1.42 ; % mitochondria n = 1.42
nMelan = 1.70 ; % melanin      n = 1.7

switch tipo
    case 'vacio' % Solo el agua
% Create Matrices of Fig 2
A = ones(N,M) ;
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(A,3); % descomentar si la anterior es comentada
    
case 'Fig2a0' % Solo el agua % Antes '0' % Solo el agua 04 / Marzo
% Create Matrices of Fig 2
A = ones(N,M)*nWater ;
% --------------------------- Actualizar la bead
% temp = A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
% temp(Bead) = nBead ;
% A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
imagesc(A)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(A,3); % descomentar si la anterior es comentada
% -----------------
% out = A ; % comentar si ya existe out en la anterior
case 'Fig2a' % El bead % Antes   case 'A' % El bead
% Create Matrices of Fig 2

A = ones(N,M)*nWater ;
% --------------------------- Actualizar la bead
temp = A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
temp(Bead) = nBead ;
A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
imagesc(A)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(A,3); % descomentar si la anterior es comentada
% -----------------
% out = A ; % comentar si ya existe out en la anterior
Xgeo = out ;

case 'A0' % El bead en medio de vacio
% Create Matrices of Fig 2
A = ones(N,M)*nWater ;
% --------------------------- Actualizar la bead
temp = A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
temp(Bead) = nBead ;
A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
imagesc(A)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
% out = rot90(A,3)/nWater; % descomentar si la anterior es comentada
out = rot90(A,3); % test_K
% -----------------
% out = A ; % comentar si ya existe out en la anterior

%
case 'bead_only' % El bead en medio de vacio
% Create Matrices of Fig 2
A = ones(N,M) ;
A(pjs:pje,pis:pie) = nWater ;
% --------------------------- Actualizar la bead
temp = A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
temp(Bead) = nBead ;
A(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
imagesc(A)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(A,3); 
%
    case 'Fig2b'
B = ones(N,M)*nWater ;          % Definir el fondo
B(floor(N/2):N , : ) = nJunct ; % Definir la junction
% --------------------------- Actualizar la bead
temp = B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
temp(Bead) = nBead ;
B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
% B = rot90(B,3); % descomentar 
% -----------------
imagesc(B)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(B,3); % descomentar si la anterior es comentada
%
    case 'Fig2b0'
B = ones(N,M)*nWater ;          % Definir el fondo
B(floor(N/2):N , : ) = nJunct ; % Definir la junction
% --------------------------- Actualizar la bead
% temp = B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
% temp(Bead) = nBead ;
% B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
% B = rot90(B,3); % descomentar 
% -----------------
imagesc(B)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(B,3); % descomentar si la anterior es comentada

%
    case 'B'
B = ones(N,M)*nWater ;          % Definir el fondo
B(floor(N/2):N , : ) = nJunct ; % Definir la junction
% --------------------------- Actualizar la bead
temp = B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
temp(Bead) = nBead ;
B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
% B = rot90(B,3); % descomentar 
% -----------------
imagesc(B)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(B,3); % descomentar si la anterior es comentada
% -----------------
% out = B ; % comentar si ya existe out en la anterior

case 'B0'
B = ones(N,M)*nWater ;          % Definir el fondo
B(floor(N/2):N , : ) = nJunct ; % Definir la junction
% --------------------------- Actualizar la bead
temp = B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
temp(Bead) = nBead ;
B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
% B = rot90(B,3); % descomentar 
% -----------------
imagesc(B)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(B,3)/nWater; % descomentar si la anterior es comentada
% -----------------
% out = B ; % comentar si ya existe out en la anterior

case 'B00' % solo flat ,  sin bead
B = ones(N,M)*nWater ;          % Definir el fondo
B(floor(N/2):N , : ) = nJunct ; % Definir la junction
% --------------------------- Actualizar la bead
% temp = B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix);
% temp(Bead) = nBead ;
% B(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix)=temp;
% ---------------------------
figure;
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
% B = rot90(B,3); % descomentar 
% -----------------
imagesc(B)
colormap gray
colorbar
% -----------------
% anexo para rotar la matriz como lo requiere la nueva geometria
out = rot90(B,3)/nWater; % descomentar si la anterior es comentada
% -----------------
% out = B ; % comentar si ya existe out en la anterior

    case 'Fig2c0' % 'C00' % sin junction sin Bead
        C = ones(N,M)*nWater ;
        x = 0:1:M-1;
        y = 100*sin(2*pi * (x / M) );
        dy = 4.1170e-08 ;
        y0_pix = 40*1e-6 / dy ;
        for k_col = 1 : M
        C(round(y(k_col)+y0_pix):N , k_col) = nJunct ;
        end
        % C(floor(N/2):N , : ) = nJunct ;
        % C((yBead:yBead)+5 , xBead:xBead) = nBead ; % Cambiar ubicacion por el radio
        figure;
        imagesc(C)
        colormap gray
        colorbar
        % out = C ;
%         out = rot90(C,3)/nWater;% 04/March/2019
        out = rot90(C,3);

    case 'Fig2c' %'C0' % sin junction con Bead
        C = ones(N,M)*nWater ;
        x = 0:1:M-1;
        y = 100*sin(2*pi * (x / M) );
        dy = 4.1170e-08 ;
        y0_pix = 40*1e-6 / dy ;
        for k_col = 1 : M
        C(round(y(k_col)+y0_pix):N , k_col) = nJunct ;
        end
        % --------------------------- Actualizar la bead
        temp = C(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix) ;
        temp(Bead) = nBead ;
        C(yBeadPix-rPix:yBeadPix+rPix , xBeadPix-rPix:xBeadPix+rPix) = temp ;
        % ---------------------------figure;
        imagesc(C)
%         whos C
        colormap gray
        colorbar
        % out = C ;
%         out = rot90(C,3)/nWater; % 04/March/2019
        out = rot90(C,3); % Fig2c
        
    case 'D0' % Skin with Cells and Nucleus
              %  tomado de la tesis, ver load_geometria
        [X,~] = imread('Geometrias_SimonBlair\figure55_only_geo.png'); 
%         size(X)
        Xgray = double(X(:,:,1))+double(X(:,:,2));
        Xgray(Xgray==0)   = 1.33;
        Xgray(Xgray==270) = 1.37;
        Xgray(Xgray==430) = 1.39;
        Xgray(Xgray==31)  = 1.34;
        Xgray(Xgray==510) = 1.40;
        Xgray(Xgray==127) = 1.47;
        Xgeo = imresize(Xgray,[1853 2531],'nearest');
        imagesc(Xgeo)
        colormap jet
%         whos Xgeo
%         out = rot90(Xgeo,3)/nWater;     
        out = rot90(Xgeo,3); % test_k
    
    case 'D00' % Skin with Cells and Nucleus no bead
              %  tomado de la tesis, ver load_geometria
        [X,~] = imread('Geometrias_SimonBlair\figure56_only_geo.png'); 
        Xgray = double(X(:,:,1))+double(X(:,:,2));
        Xgray(Xgray==0)   = 1.33;
        Xgray(Xgray==270) = 1.37;
        Xgray(Xgray==430) = 1.39;
        Xgray(Xgray==31)  = 1.34;
        Xgray(Xgray==510) = 1.40;
        Xgray(Xgray==127) = 1.47;
        Xgeo = imresize(Xgray,[1853 2531],'nearest');
        imagesc(Xgeo)
        colormap jet
%         whos Xgeo
%         out = rot90(Xgeo,3)/nWater;  
        out = rot90(Xgeo,3); % test_k
        
    case 'E0' % Skin with Cell, Nucleus and Mitochondria
              %  tomado de la tesis, ver load_geometria
        [X,~] = imread('Geometrias_SimonBlair\figure61_only_geo.png'); 
        Xgray = double(X(:,:,1))+double(X(:,:,2));
        Xgray(Xgray==0)   = 1.33;
        Xgray(Xgray==270) = 1.37;
        Xgray(Xgray==430) = 1.39;
        Xgray(Xgray==31)  = 1.34;
        Xgray(Xgray==510) = 1.40;
        Xgray(Xgray==127) = 1.47;
        Xgray(Xgray==350) = 1.42;
        Xgeo = imresize(Xgray,[1853 2531],'nearest');
        imagesc(Xgeo)
        colormap jet
%         whos Xgeo
%         out = rot90(Xgeo,3)/nWater;     
        out = rot90(Xgeo,3);     % 'test_27_K';
    case 'E00' % Skin with Cell, Nucleus and Mitochondria no bead
              %  tomado de la tesis, ver load_geometria
        [X,~] = imread('Geometrias_SimonBlair\figure62_only_geo.png'); 
        Xgray = double(X(:,:,1))+double(X(:,:,2));
        Xgray(Xgray==0)   = 1.33;
        Xgray(Xgray==270) = 1.37;
        Xgray(Xgray==430) = 1.39;
        Xgray(Xgray==31)  = 1.34;
        Xgray(Xgray==510) = 1.40;
        Xgray(Xgray==127) = 1.47;
        Xgray(Xgray==350) = 1.42;
        Xgeo = imresize(Xgray,[1853 2531],'nearest');
        imagesc(Xgeo)
        colormap jet
%         whos Xgeo
%         out = rot90(Xgeo,3)/nWater;  
        out = rot90(Xgeo,3);     % 'test_28_K';

    case 'F0' % Skin with Cell, Nucleus, Mitochondria, and Melanin
              %  tomado de la tesis, ver load_geometria
        [X,~] = imread('Geometrias_SimonBlair\figure67_only_geo.png'); 
        Xgray = double(X(:,:,1))+double(X(:,:,2));
        Xgray(Xgray==0)   = 1.33;
        Xgray(Xgray==270) = 1.37;
        Xgray(Xgray==430) = 1.39;
        Xgray(Xgray==31)  = 1.34;
        Xgray(Xgray==510) = 1.40;
        Xgray(Xgray==127) = 1.70; % invertido por error en simon
        Xgray(Xgray==350) = 1.42;
        Xgray(Xgray==265) = 1.47; % invertido por error en simon
        Xgeo = imresize(Xgray,[1853 2531],'nearest');
        imagesc(Xgeo)
        colormap jet
%         whos Xgeo
%         out = rot90(Xgeo,3)/nWater;    
        out = rot90(Xgeo,3);     % 29_K
    
    case 'F00' % Skin with Cell, Nucleus, Mitochondria, and Melanin no bead
              %  tomado de la tesis, ver load_geometria
        [X,~] = imread('Geometrias_SimonBlair\figure68_only_geo.png'); 
        Xgray = double(X(:,:,1))+double(X(:,:,2));
        Xgray(Xgray==0)   = 1.33;
        Xgray(Xgray==270) = 1.37;
        Xgray(Xgray==430) = 1.39;
        Xgray(Xgray==31)  = 1.34;
        Xgray(Xgray==510) = 1.40;
        Xgray(Xgray==127) = 1.70; % invertido por error en simon
        Xgray(Xgray==350) = 1.42;
        Xgray(Xgray==265) = 1.40; % invertido por error en simon
        Xgeo = imresize(Xgray,[1853 2531],'nearest');
        imagesc(Xgeo)
        colormap jet
%         whos Xgeo
%         out = rot90(Xgeo,3)/nWater;  
        out = rot90(Xgeo,3);     % 30_K
        
end

if nargin == 0 % Only for test
    out = [] ;
    load xcoorycoor
    figure(1); 
        imagesc(xcoor,ycoor(end:-1:1),Xgeo)
        xlabel('x [\mu m]')
        ylabel('y [\mu m]')
        colormap jet
        colorbar
    % save each figure as .fig and jpg (or .png)
    namefile = strcat(['./geometrias/',tipo,'.fig']) ;
    savefig(namefile)
    namefile = strcat(['./geometrias/',tipo,'.png']) ;
    saveas(gcf,namefile)
end
% End of Function
end
