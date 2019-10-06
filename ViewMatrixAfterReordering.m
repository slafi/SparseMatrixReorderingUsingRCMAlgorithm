%
% Function: [ret] = ViewMatrixAfterReordering (A, A_rcm, nz, pct, bw, bw_rcm, save_as_png=0)
%
%    This function views two matrices side by side. It also shows the fill in percentage,
%    number of non-zeros, and bandwidth of each matrix.
%
% Required arguments: 
%
%    A - first matrix
%    A_rcm - ordered matrix
%    nz - number of non-zeros
%    pct - fill in percentage
%    bw - bandwidth of the first matrix
%    bw_rcm - bandwidth of the reordered matrix
%    save_as_png - a flag which allows to save the plot as a PNG picture
%
%
% Returned values: 
%
%    ret - error code: 0  = success
%                      -1 = The folder does not exist / unreachable
%                      -2 = The folder does not contain any market matrix files
%
function [ret] = ViewMatrixAfterReordering (A, A_rcm, nz, pct, bw, bw_rcm, save_as_png=0)
  
  fh = figure();

  subplot(1, 2, 1);
  spy(A);
  title(sprintf('Original (n=%d)', size(A, 2)));
  xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d', nz, nz*pct, bw));


  subplot(1, 2, 2);
  spy(A_rcm);
  title('After Reordering');
  xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d', nz, nz*pct, bw_rcm));
  
  %% Save as picture if required
  if (save_as_png == 1)
    output_image = strcat('output_', int2str(nz) ,'.png');
    print(fh, '-dpng', output_image, '-r200');
    printf('Plot saved as image in the file %s.\n', output_image);
  endif
  
endfunction
