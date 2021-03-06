function f_sg_reg_save(app)

reg1 = f_sg_reg_read(app);

idx1 = strcmpi(app.SelectRegionDropDown.Value, [app.region_list.name_tag]);
if sum(idx1)
    old_reg = app.region_list(idx1);

    save_exists = 0;
    save_lut = reg1.lut_correction;
    if ~isempty(old_reg.lut_correction)
        save_ind = strcmpi(app.LUTDropDown.Value, old_reg.lut_correction{:,1});
        if sum(save_ind)
            save_exists = 1;
        end
    end

    if save_exists
        if size(old_reg.lut_correction,1)>1
            if isempty(reg1.lut_correction)
                reg1.lut_correction = old_reg.lut_correction(~save_ind,:);
            else
                reg1.lut_correction = [reg1.lut_correction; old_reg.lut_correction(~save_ind,:)];
            end
        end
    else
        reg1.lut_correction = [save_lut; old_reg.lut_correction];
    end
    
    app.region_list(idx1) = reg1;
    app.SelectRegionDropDown.Items = [app.region_list.name_tag];
    app.SelectRegionDropDown.Value = reg1.name_tag;
    app.CurrentregionDropDown.Items = [app.region_list.name_tag];
else
   disp('save did not work');
end

end