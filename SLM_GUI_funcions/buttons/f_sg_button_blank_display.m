function f_sg_button_blank_display(app)

app.SLM_Image = app.SLM_blank_im;
app.current_SLM_coord = f_sg_mpl_get_coords(app, 'zero');

app.SLM_Image_gh_preview = app.SLM_Image;
app.SLM_Image_plot.CData = app.SLM_Image;

f_sg_upload_image_to_SLM(app);   
disp('SLM blank uploaded');

end