% fdtd_time_loop
disp('    script-> fdtd_time_loop')

disp(['Total number of time steps : ' ...
    num2str(number_of_time_steps)]); 

start_time = cputime; 
current_time = 4.580 * 1e-15; % michael:: change time0 = 0
% -------------------------------------------------------------------------
% % michael:: an option of Ez
% Ez(pis+1:pie-1,pje-1) = 1 ; disp(' Constant source')
medioX = round((pie - pis)/2)+pis;
xSource = ( 0 : medioX - pis - 1 ) * dx ; % in meters
% remember call sourceEz with xSource & current_time
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% To save one period of Ez 
nIterEz = 30 ;
Ez_save = zeros(size(Ez,1),size(Ez,2),nIterEz);
cont_Ez_save = 1 ; % cout for Ez(:,:,count)
% -------------------------------------------------------------------------

% -------------------------------------------------------------------------
% To save captures of Ez
nIterEz_500 = 13 ;
Ez_s_500 = zeros(size(Ez,1),size(Ez,2),nIterEz_500);
cont_Ez_s5 = 1 ; 
% -------------------------------------------------------------------------

figure
for time_step = 1 : number_of_time_steps  
    % ---------------------------------------------------------------------
    % Update Magnetic Components
    current_time  = current_time + dt/2;
    
    Hx(:,pjs:pje-1) = Chxh(:,pjs:pje-1) .* Hx(:,pjs:pje-1) ...
        + Chxez(:,pjs:pje-1) .* (Ez(:,pjs+1:pje)-Ez(:,pjs:pje-1)); 

    Hy(pis:pie-1,:) = Chyh(pis:pie-1,:) .* Hy(pis:pie-1,:) ...
        + Chyez(pis:pie-1,:) .* (Ez(pis+1:pie,:)-Ez(pis:pie-1,:)); 
    % ---------------------------------------------------------------------
    
    % ---------------------------------------------------------------------
    % Update PML Magnetic Components
    if is_pml_xn
        Hy(1:pis-1,2:ny) = Chyh_xn .* Hy(1:pis-1,2:ny) ...
            + Chyez_xn .* (Ez(2:pis,2:ny)-Ez(1:pis-1,2:ny));
    end    
    if is_pml_xp
        Hy(pie:nx,2:ny) = Chyh_xp .* Hy(pie:nx,2:ny) ...
            + Chyez_xp .* (Ez(pie+1:nxp1,2:ny)-Ez(pie:nx,2:ny));
    end    
    if is_pml_yn
        Hx(2:nx,1:pjs-1) = Chxh_yn .* Hx(2:nx,1:pjs-1) ...
            + Chxez_yn.*(Ez(2:nx,2:pjs)-Ez(2:nx,1:pjs-1));
    end    
    if is_pml_yp
        Hx(2:nx,pje:ny) = Chxh_yp .* Hx(2:nx,pje:ny) ...
            + Chxez_yp.*(Ez(2:nx,pje+1:nyp1)-Ez(2:nx,pje:ny));
    end    
    % ---------------------------------------------------------------------
    
    % ---------------------------------------------------------------------
    % Update Electric Components      
    current_time  = current_time + dt/2;
    Ez(pis+1:pie-1,pjs+1:pje-1) = ...
        Ceze(pis+1:pie-1,pjs+1:pje-1).*Ez(pis+1:pie-1,pjs+1:pje-1) ...
        + Cezhy(pis+1:pie-1,pjs+1:pje-1) ...
        .* (Hy(pis+1:pie-1,pjs+1:pje-1)-Hy(pis:pie-2,pjs+1:pje-1)) ...
        + Cezhx(pis+1:pie-1,pjs+1:pje-1) ...
        .* (Hx(pis+1:pie-1,pjs+1:pje-1)-Hx(pis+1:pie-1,pjs:pje-2));
    % ---------------------------------------------------------------------
    
    % ---------------------------------------------------------------------
    % Update Electric Source
   
    % % % Ez(pis+1:medioX,pje-1) = 1 ; 
    % % % Ez(pis+1:medioX,pje-1) = sourceEz(current_time, xSource) ;
    
    % % % Sampled source
    % % Ez(pis+1:medioX,pje-1) = sourceEz(current_time, xSource) .* x_sampled ;
    
    % 2019-09-04 Update Ez is a smooth way: E_fdtd + E_src
    Ez(pis+1:medioX,pje-1) = Ez(pis+1:medioX,pje-1) + ...
                    sourceEz(current_time, xSource).' ;
   
    % ---------------------------------------------------------------------
    
    % ---------------------------------------------------------------------
    % Update PML Electric Components
    if is_pml_xn
        Ezx_xn = Cezxe_xn .* Ezx_xn ...
            + Cezxhy_xn .* (Hy(2:pis,2:ny)-Hy(1:pis-1,2:ny));
        Ezy_xn = Cezye_xn .* Ezy_xn ...
            + Cezyhx_xn .* (Hx(2:pis,pjs+1:pje-1)-Hx(2:pis,pjs:pje-2));
    end
    if is_pml_xp
        Ezx_xp = Cezxe_xp .* Ezx_xp + Cezxhy_xp.*  ...
            (Hy(pie:nx,2:ny)-Hy(pie-1:nx-1,2:ny));
        Ezy_xp = Cezye_xp .* Ezy_xp ...
            + Cezyhx_xp .* (Hx(pie:nx,pjs+1:pje-1)-Hx(pie:nx,pjs:pje-2));
    end
    if is_pml_yn
        Ezx_yn = Cezxe_yn .* Ezx_yn ...
            + Cezxhy_yn .* (Hy(pis+1:pie-1,2:pis)-Hy(pis:pie-2,2:pjs));
        Ezy_yn = Cezye_yn .* Ezy_yn ...
            + Cezyhx_yn .* (Hx(2:nx,2:pjs)-Hx(2:nx,1:pjs-1));
    end
    if is_pml_yp
        Ezx_yp = Cezxe_yp .* Ezx_yp ...
            + Cezxhy_yp .* (Hy(pis+1:pie-1,pje:ny)-Hy(pis:pie-2,pje:ny));
        Ezy_yp = Cezye_yp .* Ezy_yp ...
            + Cezyhx_yp .* (Hx(2:nx,pje:ny)-Hx(2:nx,pje-1:ny-1));
    end
    Ez(2:pis,2:pjs)   = Ezx_xn(:,1:pjs-1) + Ezy_yn(1:pis-1,:);
    Ez(2:pis,pje:ny)  = Ezx_xn(:,pje-1:nym1) + Ezy_yp(1:pis-1,:);
    Ez(pie:nx,pje:ny) = Ezx_xp(:,pje-1:nym1) + Ezy_yp(pie-1:nxm1,:);
    Ez(pie:nx,2:pjs)  = Ezx_xp(:,1:pjs-1) + Ezy_yn(pie-1:nxm1,:);
    Ez(pis+1:pie-1,2:pjs)  = Ezx_yn + Ezy_yn(pis:pie-2,:);
    Ez(pis+1:pie-1,pje:ny) = Ezx_yp + Ezy_yp(pis:pie-2,:);
    Ez(2:pis,pjs+1:pje-1)  = Ezx_xn(:,pjs:pje-2) + Ezy_xn;
    Ez(pie:nx,pjs+1:pje-1) = Ezx_xp(:,pjs:pje-2) + Ezy_xp;
    % ---------------------------------------------------------------------
   

    % ---------------------------------------------------------------------
    % Save options
    if mod(time_step,500) == 0
    % if time_step > number_of_time_steps-30
        Ez_s_500(:,:,cont_Ez_s5) = Ez ;
        cont_Ez_s5 = cont_Ez_s5 +1 ;
    end

    if time_step > number_of_time_steps-nIterEz
        Ez_save(:,:,cont_Ez_save) = Ez ;
        cont_Ez_save = cont_Ez_save +1 ;
    end
    % ---------------------------------------------------------------------

    % ---------------------------------------------------------------------
    % Plot current time
    imagesc(xcoor,ycoor,Ez.');
    drawnow; axis equal; axis xy;
    title('Ez [V/m]')
    colormap jet; colorbar;     
    % ---------------------------------------------------------------------    
end 

end_time = cputime;
total_time_in_minutes = (end_time - start_time)/60;
disp(['Total simulation time is ' ...
    num2str(total_time_in_minutes) ' minutes.']);
% -------------------------------------------------------------------------