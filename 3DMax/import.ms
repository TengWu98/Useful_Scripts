-- ��������ű�
rollout mytools "��������"
(	
  -- �������밴ť
  button bt1 "��������" width:90 height:30 offset:[0,5] 
  -- �����ť��
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
		
		-- ֻ����obj��ʽ��ģ�� 
		file_names = getnames "ѡ�����ļ�"  "OBJ (*.obj)|*.obj"
		 
		-- file_names�ǵ���������ļ���
		if file_names != undefined do
			(
				-- ���������ļ���
				for f in file_names do
				(
					-- �����ǰ�ļ�����
					if ( doesfileexist f ) do
					(
						importFile f #noPrompt using:Wavefront_Object 
						-- �޸��ļ���
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
