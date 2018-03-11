%% %%%%%%% cryET segmentation %%%%%%%%%%%%%%
%%%%%%%%% author: Shaobo Min   %%%%%%%%%%%%%%
%%
clear;
addpath(genpath('util'));
opt=struct;

% cryET param
cryET=struct;
cryET.bin_file_path = '../raw_data/pp676-bin2-5i.rec'; % path to cryET data
cryET.pixel_size = 0.87;%bin2:0.87 bin3:1.305
cryET.savepath = '../pp676';

cryET.matcaffe_path = '/home/mbobo/tools/caffe-deeplab/matlab'; % path to matcaffe
cryET.net_model = ['./config/deploy.prototxt']; % path to deploy.prototxt
cryET.net_weights = ['./model/vesicle_resnet101_iter_18000_0.92.caffemodel']; % path to trained caffemodel
cryET.gpu = 0; % gpu

cryET.cropsize = [321,321]; % the resolution of cropped img
cryET.mean_value = 137.485; % mean pixel value
cryET.batch_size = 1; % img size for one batch

% template model path
cryET.template_path = './model/templates.mat';
cryET.cmd_name = 'vesicle_pp676.txt';

%% begin
cryET_opt(cryET); % segmenting the cryet data