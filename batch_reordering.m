clear all;
close all;
clc;
format short;

%% Adjust Octave file path to start in the current directory
script_dir = GetScriptFolderFromName('batch_reordering');
cd(script_dir);
cur_dir = pwd();

%% Add NIST functions directory to Octave path
addpath('./NIST_functions');

%% Specify the file of Matrix Market files
folder = './data/nist';

%% Invoke batch reordering function
ReorderMMFromFolder(folder);

