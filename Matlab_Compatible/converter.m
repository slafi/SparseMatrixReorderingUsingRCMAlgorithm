clear all;
close all;
clc;
format long e;

%i_mtx_filename = 'data\nist\fea.mtx';
%i_mtx_filename = 'data\nist\mat.mtx';
%i_mtx_filename = 'data\CL_A_20249.mtx';
i_mtx_filename = 'data\CL_A_65721.mtx';

o_mtx_filename = 'rcm\CL_A_65721_rcm.mtx';

tic;
[A, A_rcm, nz, pct, bw, bw_rcm] = ReorderMarketMatrixUsingRCM (i_mtx_filename, o_mtx_filename, 'real', 5, 1);
elapsed_time = toc();

printf('File conversion took %f seconds.', elapsed_time);

fh = figure();

subplot(1, 2, 1);
spy(A);
title(sprintf('Original (n=%d)', size(A,2)));
xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d',nz,nz*pct, bw));


subplot(1, 2, 2);
spy(A_rcm);
title('Reverse Cuthill-McKee');
xlabel(sprintf('Nonzeros = %d (%.3f%%), BW=%d',nz, nz*pct, bw_rcm));

print(fh, '-dpng', 'data\ordering.png', '-r200');