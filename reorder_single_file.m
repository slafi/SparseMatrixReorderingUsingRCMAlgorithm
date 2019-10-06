clear all;
close all;
clc;
format long e;

%% Adjust Octave file path to start in the current directory
script_dir = GetScriptFolderFromName('reorder_single_file');
cd(script_dir);
cur_dir = pwd();

%% Add NIST functions directory to Octave path
addpath('./NIST_functions');

%% Initialize input and output matrix market filenames
i_mtx_filename = './data/nist/s3rmt3m3.mtx';
o_mtx_filename = './data/nist/output/s3rmt3m3_rcm.mtx';

%% Invoke the single-file reordering and view function
ret = ReorderAndView(i_mtx_filename, o_mtx_filename, save_as_png=1);

