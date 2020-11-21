function f_SLM_gh_defocus(app)

% get reg
[m_idx, n_idx] = f_SLM_gh_get_regmn(app);
SLMm = sum(m_idx);
SLMn = sum(n_idx);

idx_reg = strcmpi(app.SelectRegionDropDownGH.Value, [app.region_list.name_tag]);
wavelength = app.region_list(idx_reg).wavelength*10e-9;

defocus_weight = app.DeficusWeightEditField.Value*10e-6;

defocus = f_SLM_DefocusPhase_YS(SLMm, SLMn,...
                app.SLM_ops.objective_NA,...
                app.SLM_ops.objective_RI,...
                wavelength*10)*defocus_weight;
defocus = defocus - min(defocus(:));

defocus2=angle(sum(exp(1i*(defocus-pi)),3))+pi;

holo_image = app.SLM_blank_im;
holo_image(m_idx,n_idx) = defocus2;

app.SLM_Image_plot.CData = holo_image;
app.SLM_Image = holo_image;

end