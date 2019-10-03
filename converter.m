clear all;
close all;
clc;
format long e;

#i_mtx_filename = 'J:\Tests\Python\SparseMatrixVisualizor\data\nist\fea.mtx';
i_mtx_filename = 'J:\Tests\Python\SparseMatrixVisualizor\data\nist\mat.mtx';
#i_mtx_filename = 'J:\Tests\Python\SparseMatrixVisualizor\data\CL_A_20249.mtx';
#i_mtx_filename = 'J:\Tests\Python\SparseMatrixVisualizor\data\CL_A_65721.mtx';

o_mtx_filename = 'J:\Tests\Python\SparseMatrixVisualizor\data\nist\rcm\CL_A_65721_rcm.mtx';

tic;
[A, A_rcm, nz, pct, bw, bw_rcm] = ReorderMarketMatrixUsingRCM (i_mtx_filename, o_mtx_filename, get_stats=1);
elapsed_time = toc();

printf('File conversion took %f seconds.\n', elapsed_time);

ViewMatrixAfterReordering (A, A_rcm, nz, pct, bw, bw_rcm);

##fh = figure();
##
##subplot(1, 2, 1);
##spy(A);
##title(sprintf('Original (n=%d)', size(A,2)));
##xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d',nz,nz*pct, bw));
##
##
##subplot(1, 2, 2);
##spy(A_rcm);
##title('Reverse Cuthill-McKee');
##xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d',nz, nz*pct, bw_rcm));
##
##print(fh, '-dpng', 'J:\Tests\Python\SparseMatrixVisualizor\data\ordering.png', '-r200');