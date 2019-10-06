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

%% Specify the folder where the Matrix Market files are stored
folder = './data/nist';

%% Invoke batch reordering function to process files one by one
ReorderMMFromFolder(folder);

