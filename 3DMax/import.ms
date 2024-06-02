-- 批量导入脚本
rollout mytools "批量导入"
(	
  -- 批量导入按钮
  button bt1 "批量导入" width:90 height:30 offset:[0,5] 
  -- 点击按钮后
  on bt1 pressed do 
	(
		Fn getnames Title FilterName =
         (
             dialog = DotNetObject "System.Windows.Forms.OpenFileDialog"
             dialog.title = Title
             dialog.filter = FilterName
			 dialog.Multiselect = true
             OpenFileResult = dialog.ShowDialog()
             if OpenFileResult.Equals OpenFileResult.OK then
				 (
                 dialog.FileNames
                 )
             else Undefined
 	     )
		
		-- 只导入obj格式的模型 
		file_names = getnames "选择导入文件"  "OBJ (*.obj)|*.obj"
		 
		-- file_names是导入的所有文件名
		if file_names != undefined do
			(
				-- 遍历所有文件名
				for f in file_names do
				(
					-- 如果当前文件存在
					if ( doesfileexist f ) do
					(
						importFile f #noPrompt using:Wavefront_Object 
						-- 修改文件名
						$.name = getFilenameFile f
					)
					for geo in geometry
						where (matchPattern geo.name pattern:"3D_Object*") do
						(
						  path11 = filterString (d as string) "//"
						  eo.name = path11[path11.count]
						)
				)
				actionMan.executeAction 0 "310"
			)
		)
 )
createdialog mytools width:150 height:100

