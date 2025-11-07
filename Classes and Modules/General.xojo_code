#tag Module
Protected Module General
	#tag Method, Flags = &h0
		Function GetAppVersion(type as AppVersionType) As String
		  // short = v1.0, long = Version 1.0, Copyright = Version 1.0         © Dr S. Kapetanakis, 2025-2026
		  // use enum AppVersionType .Short .Long .Copyright
		  
		  select case type
		  case AppVersionType.Short
		    return "v" + app.kVersion
		  case AppVersionType.Long
		    return "Version " + app.kVersion
		  case AppVersionType.Copyright
		    Return "Version " + app.kVersion + chr(9) + chr(9) + "© Dr S. Kapetanakis, 2025-"+ str(DateTime.Now.Year + 1)
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function isValidEmail(email as string) As Boolean
		  var regex as new RegEx
		  regex.SearchPattern = "^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$"
		  return regex.Search(email) <> nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RemoveBadge(Extends control As WebUIControl)
		  Var js As String = "$('#" + control.ControlID + " .xojo-badge').remove();"
		  control.ExecuteJavaScript(js)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub selectAll(extends wtf as WebTextField)
		  wtf.ExecuteJavaScript("document.getElementById('"+wtf.ControlID+"_inner').select();")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetBadge(Extends control As WebUIControl, caption As String, indicator As String = "danger", top As Integer = -10, right As Integer = -10)
		  Var classes() As String = Array("xojo-badge", "d-flex", "p-2", _ 
		  "border", "border-light", "bg-" + indicator) 
		  classes.Add(If(caption.Length < 2, "rounded-circle", "rounded-pill"))
		  
		  ' Var styles() As String = Array("height: 21px", "font-size: 10px", _ 
		  Var styles() As String = Array("height: 24px", "font-size: 10px", _ 
		  "align-items: center", "color: white", "position: absolute", _ 
		  "top: " + top.ToString + "px", "right: " + Right.ToString + "px", _ 
		  "z-index: 10")
		  
		  If caption = "" Or caption = " " Then caption = "&nbsp;"
		  Var html As String = "<span class=""" + String.FromArray(classes) + _
		  """ style=""" + String.FromArray(styles, ";") + """>" + caption + "</span>"
		  
		  Var js() As String
		  js.Add("$('#" + control.ControlID + " .xojo-badge').remove();") 
		  js.Add("$('#" + control.ControlID + "').append(`" + html + "`);")
		  control.ExecuteJavaScript(String.FromArray(js))
		End Sub
	#tag EndMethod


	#tag Enum, Name = AppVersionType, Type = Integer, Flags = &h0
		Short
		  Long
		Copyright
	#tag EndEnum


	#tag ViewBehavior
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Module
#tag EndModule
