clear all;
close all;
clc;
format short;

%% Adjust Octave file path
script_dir = GetScriptFolderFromName('batch_reordering');
cd(script_dir);
cur_dir = pwd();

%% Add NIST functions directory to path
addpath('./NIST_functions');

folder = 'J:/Tests/Python/SparseMatrixVisualizor/data/nist';

ReorderMMFromFolder(folder);

