%
% Function: function ret = ReorderAndView(i_mtx_filename, o_mtx_filename, save_as_png=1)
%
%    This function reorders a matrix using the function ReorderMarketMatrixUsingRCM and
%    views the final result using the function ViewMatrixAfterReordering.
%
% Required arguments: 
%
%    i_mtx_filename - input Matrix Market filename
%    o_mtx_filename - output Matrix Market  filename
%    save_as_png - a flag which enables to save the plot as PNG (default: 1)
%
% Returned values: 
%
%    ret - 0 if success, -1 if the input file is unreachable
%
function ret = ReorderAndView(i_mtx_filename, o_mtx_filename, save_as_png=1)
  
  ret = 0;
  
  %% Check if the input file exists
    err = exist(i_mtx_filename);
    
    %% Check if the input file exists
    if(err == 0)
      ret = -1;
      error('The input file does not exist!\n');
      return
    endif

  %% Invoke the RCM reordering function
  printf('Processing file %s . . . . . . ', i_mtx_filename);

  tic;
  [A, A_rcm, nz, pct, bw, bw_rcm] = ReorderMarketMatrixUsingRCM (i_mtx_filename, o_mtx_filename, get_stats=1);
  elapsed_time = toc();

  printf('DONE\nFile conversion took %f seconds.\n', elapsed_time);

  %% Plot the original and RCM-matrices side by side
  ViewMatrixAfterReordering (A, A_rcm, nz, pct, bw, bw_rcm, save_as_png);

endfunction
