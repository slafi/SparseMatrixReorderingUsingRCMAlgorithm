


function [ret] = ReorderMMFromFolder (ifolder)

    %% Check if the folder exists
    err = exist(ifolder);
    
    %% Check if the folder exists
    if(err == 0)
      error('The folder does not exist!\n');
      ret = -1;
      return
    end   
    
    folder = char(ifolder);
    %% substr for compatibility with GNU Octave, endswith can be used on Matlab
    if((folder(length(folder)-1) == '/') || (folder(length(folder)-1) == '\'))
      pattern = strcat (ifolder, '*.mtx');
      lfolder = ifolder;
    else
      pattern = strcat (ifolder , '/*.mtx');
      lfolder = strcat (ifolder, '/');
    end
    
    ofolder = strcat (lfolder, 'Output/');      %% output folder
    
    %% Check if market files are available in the folder
    listing = struct2cell(dir(pattern));
    
    files = (listing(1,:));
    
    err = isempty(files);
    if(err == 1)
      error('The folder does not contain any market matrix files!\n');
      ret = -2;
      return
    end
    
    %% Create output directory    
    err = mkdir(ofolder);
    if(err == 0)
      error('The output folder %s could not be created!\n', ofolder);
      ret = -3;
      return
    end
    
    %% reorder and save each market matrix file    
    for i=1:1:length(files)
      
      file = files{i};
      
      i_mtx_filename = strcat(lfolder, file);
      %o_mtx_filename = strcat(ofolder, substring(file, 1, length(file) - 4), '_rcm.mtx');
      o_mtx_filename = strcat(ofolder, strrep(file, '.mtx', ''), '_rcm.mtx');
      
      fprintf('Processing file: %s . . . . . . ', i_mtx_filename);
      
      tic;
      [A, A_rcm, nz, pct, bw, bw_rcm] = ReorderMarketMatrixUsingRCM (i_mtx_filename, o_mtx_filename, 'real', 5, 1);
      elapsed_time = toc();
      
      fprintf('Done!\nFile conversion took %f seconds.\n\n', elapsed_time);
        
    end
    
end