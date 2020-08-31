function f_SLM_upload_image_to_SLM(app)

% add AO correction if on
if app.ApplyAOcorrectionButton.Value
    SLM_image = f_SLM_AO_add_correction(app, app.SLM_Image);
else
    SLM_image = app.SLM_Image;
end

app.SLM_Image_pointer.Value = f_SLM_convert_to_pointer(app,SLM_image);
f_SLM_update_YS(app.SLM_ops, app.SLM_Image_pointer);

end