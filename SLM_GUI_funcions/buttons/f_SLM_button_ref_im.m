function f_SLM_button_ref_im(app)

coords = f_SLM_mpl_get_coords(app, 'zero');
coords.xyzp = [app.SLM_ops.ref_offset, 0, 0;...
               -app.SLM_ops.ref_offset, 0, 0;...
                0, app.SLM_ops.ref_offset, 0;...
                0,-app.SLM_ops.ref_offset, 0];
            
holo_image = f_SLM_xyz_gen_holo(app, coords, app.CurrentregionDropDown.Value);
app.SLM_Image = holo_image;            
app.current_SLM_coord = coords;

app.SLM_Image_gh_preview = app.SLM_Image;
app.SLM_Image_plot.CData = app.SLM_Image;

f_SLM_upload_image_to_SLM(app);    
fprintf('SLM ref image, %d  offset uploaded\n', app.SLM_ops.ref_offset);


end