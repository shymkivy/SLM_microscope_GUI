function f_SLM_upload_image_to_SLM(app, add_ao)
% add AO correction if on

if ~exist('add_ao', 'var')
    add_ao = 1;
end

if add_ao
    AO_wf = f_SLM_AO_get_correction(app);
    SLM_image = f_SLM_AO_add_correction(app, app.SLM_Image, AO_wf);
    app.current_SLM_AO_Image = AO_wf;
else
    SLM_image = app.SLM_Image;
end

holo_phase = angle(SLM_image)+pi;
app.SLM_Image_pointer.Value = f_SLM_im_to_pointer(holo_phase);
f_SLM_BNS_update(app.SLM_ops, app.SLM_Image_pointer);

end