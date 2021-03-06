
%% read header file

% import from reconstruction package
import reconstruction.readbrukerconfigs
import reconstruction.multitesdc

% read Bruker output files (ACQP, METHOD) to make trajectory corrections
readbrukerconfigs( ...
    './sample/data_path/6', ...
    './sample/data_path/6/acqp', ...
    './sample/data_path/6/method', ...
    length(configStruct.settings.echo_times), ...
    configStruct.settings.num_points, ...
    configStruct.settings.interleaves, ...
    configStruct.settings.recon_mode, ...
    configStruct.settings.phi, ...
    configStruct.settings.zero_filling ...
);


%% reconstruct

multitesdc( ...
    './sample/data_path/6/fid', ...
    './sample/data_path/6/traj', ...
    './sample/processed_data/test_data', ...
    1, ... % CHANGED THIS FOR TEST W/O GATING
    configStruct.settings.num_projections, ...
    configStruct.settings.num_points, ...
    configStruct.settings.fid_points, ...
    configStruct.settings.num_threads, ...
    configStruct.settings.num_points_shift, ...
    configStruct.settings.lead_cut_projections, ... % check this
    configStruct.settings.end_cut_projections, ... % check this
    configStruct.settings.num_iterations, ... % check this
    configStruct.settings.osf, ... % check this
    configStruct.settings.verbose, ... % check this
    configStruct.settings.ram_points_mod, ... % check this
    configStruct.settings.alpha, ... % check this
    configStruct.settings.beta ... % check this
);