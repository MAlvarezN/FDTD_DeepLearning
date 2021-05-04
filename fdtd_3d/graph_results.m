% -------------------------------------------------------------------------
% disp('  Graph results')
% -------------------------------------------------------------------------

switch 3
        case 0
    % ---------------------
    %     plot section, comment to enhance speed        
    subplot(1,2,1)
        imagesc( Ex( : , : , 5 ) ); colorbar; drawnow
    subplot(1,2,2)
        imagesc( norm01( Ex( : , : , 5 ) ) ); drawnow
    title(strcat(['time ',num2str(nt)]))    
    % ---------------------
        case 1    
            plotall
    % ---------------------
        case 2
            plot_center_fields
    % ---------------------
        case 3
            % Plot Magnitude using slice function
            plot_E_magnitude_slice
    % ---------------------    
        case 23
            plot_center_fields
            figure(3)
            plot_E_magnitude_slice
end