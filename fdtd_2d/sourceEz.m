function Ez = sourceEz(t,x,param)
% ---------------------------------------------------------
%                      2007-simon.pdf
% ---------------------------------------------------------
% 
% ----------------- Eq. (2):
%- x  = is the location in the lateral direction in the pupil plane
%- y0 = is the vertical location of the pupil
%- t  = is the current time
%- w  = is 2.69 peta-radians per second (the angular frequency)
%  lamda = 700 nm (vacuum wavelength)
%- Xmax  = 102.94 um, which represents the farthest location laterally
%   in the computational area 
%- k is the wave number
%- f is the focal length of the Gaussian wave
% 
%------------------ Eq. (3)
%-  t0 = 4.58 fs 
%-  T  = 0.408 fs (rise time )
%
% The Gaussian is defined only in the left half of the pupil. 
% The location of the source and receiver is 411 nm from the top of
%   the computational area.

% Paramters by 2007-simon.pdf
t0 = 4.580 * 1e-15 ;
T  = 0.408 * 1e-15 ;
w  = 2.69  * 1e+15 ;
% w  = 2.69 / 1.48  * 1e+15 ; % division index
lambda = 700 * 1e-9 ;
Xmax  = 102.94 * 1e-6 ;
k = 2*pi / (lambda/1.33) ; % 'test_27_K'; % _k133
f = 45 * 1e-6 ;

if nargin == 0   % To test function
    t  = t0 ; % temporal input
%     t  = 5.68 * 1e-15 ; % temporal input    
    dx = 41.17 * 1e-9 ;
    x0 = 0 : dx : Xmax ;    
    x = x0 ;
%     x0 = 1:0.01:103 ; % spatial input to test
%    x  = x0* 1e-6 ; % input in meters
elseif nargin == 3 % To change parameters
    t0 = param.t0 + 2*8.7395 * 1e-17 ;
    T  =  param.T ; 
    w  = param.w ; 
    lambda = param.lambda ; 
    Xmax  = param.Xmax ; 
    k = 2*pi / lambda ; 
    f = param.f ; 
elseif nargin == 1
    disp('Error:: faltan argumentos de entrada')
    return 
end

% Eq. (3):
f_erf = .5 * ( 1 + erf( ( t - t0 ) / ( sqrt( 2 ) * T ) ) ) ;

% Eq. (2):abs
Ez = real( f_erf .* ...
           exp( 1i * w * t ) .* ...
           exp( -(( x - (Xmax/4) )./( Xmax/3 )).^2 ) .* ...
           exp( 1i * k * (sqrt( f.^2 + ( x - (Xmax/2)).^2 ) - f ) ));

if nargin == 0   % To test function
    w01 = figure; w01.Name = 'Incident Ez (default test)';
    f01 = plot(x0,Ez,'.-b'); 
    f01.Parent.Title.String = 'Amplitude of the source Ez along to x direction';
    f01.Parent.XLabel.String = 'x [\mu m]';
    f01.Parent.YLabel.String = 'Ez [V/m]';
        
    % Load sampled vector of Experiment 1
%     load Expto_01_samples_50percent % x_sampled
    load Expto_03_samples_chunks_50percent % x_sampled with chunks
    mn = size(x_sampled) ;
    w01 = figure; 
    w01.Name = 'Sampled Incident Ez';
    subplot(2,1,1)
    f01 = plot(x0(1:mn(2)),Ez(1:mn(2)),'.-b'); 
    f01.Parent.Title.String = 'Amplitud of the soource Ez (left pupil) ';
    f01.Parent.XLabel.String = 'x source [\mu m]';
    f01.Parent.YLabel.String = 'Ez [V/m]';
    subplot(2,1,2)
    f01 = plot(x0(1:mn(2)),Ez(1:mn(2)).*x_sampled,'.b'); 
    f01.Parent.Title.String = 'Sampled of the source Ez';
    f01.Parent.XLabel.String = 'x source [\mu m]';
    f01.Parent.YLabel.String = 'Ez [V/m]';
    
    % Fourier de la fuente de entrada:
%     fourierEzT = fftshift(fft(Ez)) ;
%     figure;
%     f01 = plot(real(fourierEzT)/max(real(fourierEzT)),'.-b'); 
%     f01.Parent.Title.String = 'Real \{ FT ( Ez ) \}';
    w01 = figure; 
    w01.Name = 'Fourier';
    subplot(2,1,1)
    fourierEz = fftshift(fft(Ez(1:mn(2)))) ;   
    f01 = plot(real(fourierEz)/max(real(fourierEz)),'.-b'); 
    f01.Parent.Title.String = 'Normalized Real \{ FT (source Ez) \}';
    f01.Parent.YLabel.String = 'Ez [V/m]';
    subplot(2,1,2)
    fourierEzS = fftshift(fft(Ez(1:mn(2)).*x_sampled)) ;
    f01 = plot(real(fourierEzS)/max(real(fourierEzS)),'.-b'); 
    f01.Parent.Title.String = 'Normalized Real \{ FT (sampled source Ez) \}';
    f01.Parent.XLabel.String = 'index freq of roots unit';
    f01.Parent.YLabel.String = 'Ez [V/m]';
    
%      Absoluted value
    w01 = figure; 
    w01.Name = 'Fourier Abs';
    subplot(2,1,1)
    f01 = plot(abs(fourierEz)/max(abs(fourierEz)),'.-b'); 
    f01.Parent.Title.String = 'Normalized Abs \{ FT (source Ez) \}';
    f01.Parent.YLabel.String = 'Ez [V/m]';
    subplot(2,1,2)
    fourierEzS = fftshift(fft(Ez(1:mn(2)).*x_sampled)) ;
    f01 = plot(abs(fourierEzS)/max(abs(fourierEzS)),'.-b'); 
    f01.Parent.Title.String = 'Normalized Abs \{ FT (sampled source Ez) \}';
    f01.Parent.XLabel.String = 'index freq of roots unit';
    f01.Parent.YLabel.String = 'Ez [V/m]';
    % Output
    Ez = [];
end
end



