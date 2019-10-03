clear all;
close all;
clc;
format long e;

cur_dir = pwd();

%% Add NIST functions directory to path
addpath(strcat(cur_dir, '/Ordering/nist_functions'));

folder = strcat(cur_dir, '/data/nist');

ReorderMMFromFolder(folder);




