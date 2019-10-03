%
% Function: [ret] = ViewMatrixAfterReordering (A, A_rcm, nz, pct, bw, bw_rcm)
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
function [ret] = ViewMatrixAfterReordering (A, A_rcm, nz, pct, bw, bw_rcm)
  
  fh = figure();

  subplot(1, 2, 1);
  spy(A);
  title(sprintf('Original (n=%d)', size(A,2)));
  xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d',nz,nz*pct, bw));


  subplot(1, 2, 2);
  spy(A_rcm);
  title('After Reordering');
  xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d',nz, nz*pct, bw_rcm));
  
endfunction
