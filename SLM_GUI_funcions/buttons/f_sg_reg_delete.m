function f_sg_reg_delete(app)

idx1 = strcmpi(app.SelectRegionDropDown.Value, [app.region_list.name_tag]);
if sum(idx1)
    app.region_list(idx1) = [];
    app.SelectRegionDropDown.Items(idx1) = [];
    f_sg_reg_update(app);
    app.SelectRegionDropDown.Items = [app.region_list.name_tag];
    app.CurrentregionDropDown.Items = [app.region_list.name_tag];
else
    disp('Delete did not work')
end

end