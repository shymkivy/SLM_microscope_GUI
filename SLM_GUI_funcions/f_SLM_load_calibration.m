function f_SLM_load_calibration(app)

ops = app.SLM_ops;

%% load calibratio files

% load LUT files
if ~exist([ops.GUI_dir '\' ops.lut_dir], 'dir')
    mkdir([ops.GUI_dir '\' ops.lut_dir])
end

[ops.lut_names, ops.lut_data] = f_SLM_get_file_names(ops.lut_dir, '*.lut', true);
for n_lut = 1:numel(ops.lut_names)
    [~, fname, ~] = fileparts(ops.lut_names{n_lut});
    if ~exist([ops.GUI_dir '\' ops.lut_dir '\' fname '_correction'], 'dir')
        mkdir([ops.GUI_dir '\' ops.lut_dir '\' fname '_correction'])
    end
end


% xyz calibration
if ~exist([ops.GUI_dir '\' ops.xyz_calibration_dir], 'dir')
    mkdir([ops.GUI_dir '\' ops.xyz_calibration_dir])
end

% load axial
axial_calibration_fnames = f_SLM_get_file_names([ops.GUI_dir '\' ops.xyz_calibration_dir], '*axial_calibration*.mat', false);
if ~isempty(axial_calibration_fnames)
    ops.axial_calib_file = axial_calibration_fnames{1};
else
    ops.axial_calib_file = '';
end

% load lateral
lateral_calib_fnames = f_SLM_get_file_names([ops.GUI_dir '\' ops.xyz_calibration_dir], '*lateral_affine*.mat', false);
if ~isempty(lateral_calib_fnames)
    ops.lateral_calib_affine_transf_file = lateral_calib_fnames{1};
else
    ops.lateral_calib_affine_transf_file = '';
end

% pixel um
lateral_calib_pixel_um_fnames = f_SLM_get_file_names([ops.GUI_dir '\' ops.xyz_calibration_dir], '*lateral_calibration_pixel*.mat', false);
if ~isempty(lateral_calib_pixel_um_fnames)
    ops.lateral_calib_pixel_um_file = lateral_calib_pixel_um_fnames{1};
else
    ops.lateral_calib_pixel_um_file = '';
end

% load Zernike files
if ~exist([ops.GUI_dir '\' ops.AO_correction_dir], 'dir')
    mkdir([ops.GUI_dir '\' ops.AO_correction_dir])
end
ops.zernike_file_names = f_SLM_get_file_names([ops.GUI_dir '\' ops.AO_correction_dir], '*ernike*.mat', false);

%%
app.SLM_ops = ops;
end