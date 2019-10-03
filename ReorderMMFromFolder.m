%
% Function: [ret] = ReorderMMFromFolder (ifolder)
%
%    This function uses GetScriptFolderFromName in order to read,
%    reorder and save all the matrix market files stored in a given
%    directory.
%
% Required arguments: 
%
%    ifolder - input folder
%
%
% Returned values: 
%
%    ret - error code: 0  = success
%                      -1 = The folder does not exist / unreachable
%                      -2 = The folder does not contain any market matrix files
%
function [ret] = ReorderMMFromFolder (ifolder)
    
    ret = 0
    
    %% Check if the folder exists
    err = exist(ifolder);
    
    %% Check if the folder exists
    if(err == 0)
      ret = -1;
      error('The folder does not exist!\n');
      return
    endif   

    %% substr for compatibility with GNU Octave, endswith can be used on Matlab
    if(substr(ifolder, length(ifolder)) == '/' || substr(ifolder, length(ifolder)) == '\')
      pattern = strcat (ifolder, '*.mtx');
      lfolder = ifolder;
    else
      pattern = strcat (ifolder , '/*.mtx');
      lfolder = strcat (ifolder, '/');
    endif
    
    ofolder = strcat (lfolder, 'Output/');      %% output folder
    
    %% Check if market files are available in the folder
    listing = struct2cell(dir(pattern));
    
    files = listing(1,:);
    
    err = isempty(files);
    if(err == 1)
      ret = -2;
      error('The folder does not contain any market matrix files!\n');
      return
    endif
    
    %% Create output directory    
    err = mkdir(ofolder);
    if(err == 0)
      ret = -3;
      error('The output folder %s could not be created!\n', ofolder);
      return
    endif
    
    %% reorder and save each market matrix file    
    for i=1:1:length(files)
      
      file = files{i};
      
      i_mtx_filename = strcat(lfolder, file);
      o_mtx_filename = strcat(ofolder, substr(file, 1, length(file) - 4), '_rcm.mtx');
      
      printf('Processing file: %s . . . . . . ', i_mtx_filename);
      
      tic;
      [A, A_rcm, nz, pct, bw, bw_rcm] = ReorderMarketMatrixUsingRCM (i_mtx_filename, o_mtx_filename, get_stats=0);
      elapsed_time = toc();
      
      printf('Done!\nFile conversion took %f seconds.\n\n', elapsed_time);
        
    endfor
    
endfunction

