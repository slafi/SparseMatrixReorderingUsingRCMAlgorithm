%
% Function: [A, A_rcm, nz, pct, bw, bw_rcm] = ReorderMarketMatrixUsingRCM (i_mtx_filename, o_mtx_filename, field='real', precision=5, get_stats=1)
%
%    Reads a sparse matrix A from a Matrix Market (MM)-formatted file, 
%    applies Reverse Cuthill-McKee reordoering to it and writes it to 
%    an output MM file. It also can optionnally return few statistics 
%    about both matrices.
%
% Required arguments: 
%
%    i_mtx_filename - input MM filename
%
%    o_mtx_filename - output MM filename
%
% Optional arguments: 
%
%
%    field     - 'real'
%                'complex'
%                'integer'
%                'pattern'
%                If ommitted, data will determine type.
%
%    precision - number of digits to display for real 
%                or complex values
%                If ommitted, full working precision is used.
%
%    get_stats - A flag which determines if the statistics
%                will be computed for both matrices
%
% Returned values:
%
%
%    A - the input sparse matrix
%                      
%    A_rcm - the output sparse matrix
% 
%    nz - the number of matrix non-zeros
%
%    pct - the percentage of non-zeros
% 
%    bw - the bandwidth of the input matrix
%         
%    bw_rcm - the bandwidth of the reordered matrix
%
% Disclaimer: This function uses mmread() and mmwrite() provided by the NIST as part of the
%             MatrixMarket I/O Functions for Matlab 
%             For more information, see: https://math.nist.gov/MatrixMarket/mmio/matlab/mmiomatlab.html
%  
function [A, A_rcm, nz, pct, bw, bw_rcm] = ReorderMarketMatrixUsingRCM (i_mtx_filename, o_mtx_filename, field, precision, get_stats)
  
    %% Check if the input file already exists
    err = exist(i_mtx_filename);
    
    if(err == 0)
      %printf("The file %s does not exist", i_mtx_filename)
      error('The file %s does not exist', i_mtx_filename);
      return
    end 
    
    %% Read sparse matrix file (matrix market format)
    [A, rows, cols, entries, rep, field, symm] = mmread(i_mtx_filename);
    
    %% Reorder sparse matrix using reverse Cuthill-McKee algorithm
    p = symrcm(A);
    A_rcm = A(p, p);
    
    %% Read sparse matrix file (matrix market format)
    %comment = sprintf('Created on %s\n', datetime('now'));
    comment = sprintf('Created on %s', datestr(now));
    %comment = sprintf('Created on %s', asctime (localtime(time())));
    
    mmwrite(o_mtx_filename, A_rcm, comment);
    
    %% Initialize stats parameters
    nz = -1;
    pct = -1;
    bw = -1;
    bw_rcm = -1;
    A = [];
    A_rcm = [];
    
    if(get_stats == 1)
      
      %% Percentage of fill
      pct = 100 / numel(A);
      
      %% Number of non-zeros
      nz = nnz(A);
      
      %% Input matrix bandwidth
      [i, j] = find(A);
      bw = max(i-j) + 1;
          
      %% Output matrix bandwidth
      [i, j] = find(A_rcm);
      bw_rcm = max(i-j) + 1;
      
    end    
    
    end