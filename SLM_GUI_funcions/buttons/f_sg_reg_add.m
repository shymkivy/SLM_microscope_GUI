function f_sg_reg_add(app)

reg1 = f_sg_reg_read(app);

idx1 = strcmpi(app.RegionnameEditField.Value, [app.region_list.name_tag]);
if sum(idx1)
    disp('Region name already exists');
else
    app.region_list = [app.region_list; reg1];
    app.SelectRegionDropDown.Items = [app.region_list.name_tag];
    app.SelectRegionDropDown.Value = reg1.name_tag;
    app.CurrentregionDropDown.Items = [app.region_list.name_tag];
end

end