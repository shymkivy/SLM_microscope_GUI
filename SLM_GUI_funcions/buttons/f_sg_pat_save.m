function f_sg_pat_save(app)

idx1 = strcmpi(app.PatterngroupDropDown.Value, [app.xyz_patterns.name_tag]);

if sum(idx1)
    pat1.name_tag = {app.GroupnameEditField.Value};
    pat1.xyz_pts = app.UIImagePhaseTable.Data;
    pat1.SLM_region = app.CurrentregionDropDown.Value;
    
    app.xyz_patterns(idx1) = pat1;
    
    f_sg_pat_update(app, find(idx1));
    
    app.PatternDropDownCtr.Items = [{'None'}, app.xyz_patterns.name_tag];
    app.PatternDropDownAI.Items = [{'None'}, app.xyz_patterns.name_tag];
else
    disp('Pattern save failed')
end

end