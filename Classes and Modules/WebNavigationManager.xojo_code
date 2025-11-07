#tag Class
Protected Class WebNavigationManager
	#tag Method, Flags = &h0
		Sub Constructor(host As wp_MainShell)
		  mHostPage = host
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LogNavigation(action As String, destination As WebContainer)
		  Var name As String = If(destination IsA wc_Base, wc_Base(destination).ContainerID, "Unknown")
		  System.DebugLog("Navigation: " + action + " → " + name)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NavigateBack()
		  If mHistory.Count > 0 Then
		    ' Save current to forward history
		    If mHostPage.ContentArea <> Nil Then
		      mForward.Add(mHostPage.ContentArea)
		      mHostPage.ContentArea.Visible = False
		    End If
		    
		    ' Get previous container
		    Var previousContainer As WebContainer = mHistory.Pop
		    mHostPage.ContentArea = previousContainer
		    
		    ' Re-embed if necessary
		    If previousContainer IsA wc_Base Then
		      Var wc As wc_Base = wc_Base(previousContainer)
		      
		      If wc.Parent = Nil Then
		        Var embedX, embedY, embedW, embedH As Integer
		        If wc.Position = wc_Base.PositionEnum.TopLeft Then
		          embedX = 0
		          embedY = 0
		          embedW = mHostPage.Placeholder.Width
		          embedH = mHostPage.Placeholder.Height
		        Else ' Center
		          embedW = wc.Width
		          embedH = wc.Height
		          embedX = (mHostPage.Placeholder.Width - embedW) / 2
		          embedY = (mHostPage.Placeholder.Height - embedH) / 2
		        End If
		        
		        previousContainer.EmbedWithin(mHostPage.Placeholder, embedX, embedY, embedW, embedH)
		      End If
		      
		      wc.EmbedInto(mHostPage.Placeholder)
		    Else
		      If previousContainer.Parent = Nil Then
		        previousContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
		      End If
		    End If
		    
		    previousContainer.Visible = True
		    
		    ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
		    If previousContainer IsA wc_Base Then
		      wc_Base(previousContainer).UpdateNavigation
		    End If
		    
		    LogNavigation("NavigateBack", previousContainer)
		  End If
		  
		  ' If mHistory.Count > 0 Then
		  ' ' Save current to forward history
		  ' If mHostPage.ContentArea <> Nil Then
		  ' mForward.Add(mHostPage.ContentArea)
		  ' mHostPage.ContentArea.Visible = False
		  ' End If
		  ' 
		  ' ' Get previous container
		  ' Var previousContainer As WebContainer = mHistory.Pop
		  ' mHostPage.ContentArea = previousContainer
		  ' 
		  ' ' Re-embed if necessary
		  ' If previousContainer IsA wc_Base Then
		  ' Var wc As wc_Base = wc_Base(previousContainer)
		  ' 
		  ' If wc.Parent = Nil Then
		  ' Var embedW, embedH As Integer
		  ' If wc.Position = wc_Base.PositionEnum.TopLeft Then
		  ' embedW = mHostPage.Placeholder.Width
		  ' embedH = mHostPage.Placeholder.Height
		  ' Else
		  ' embedW = wc.Width
		  ' embedH = wc.Height
		  ' End If
		  ' 
		  ' previousContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, embedW, embedH)
		  ' End If
		  ' 
		  ' wc.EmbedInto(mHostPage.Placeholder)
		  ' Else
		  ' If previousContainer.Parent = Nil Then
		  ' previousContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
		  ' End If
		  ' End If
		  ' 
		  ' previousContainer.Visible = True
		  ' 
		  ' ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
		  ' If previousContainer IsA wc_Base Then
		  ' wc_Base(previousContainer).UpdateNavigation
		  ' End If
		  ' 
		  ' LogNavigation("NavigateBack", previousContainer)
		  ' End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NavigateForward()
		  If mForward.Count > 0 Then
		    ' Save current to history
		    If mHostPage.ContentArea <> Nil Then
		      mHistory.Add(mHostPage.ContentArea)
		      mHostPage.ContentArea.Visible = False
		    End If
		    
		    ' Get next container
		    Var nextContainer As WebContainer = mForward.Pop
		    mHostPage.ContentArea = nextContainer
		    
		    ' Re-embed if necessary
		    If nextContainer IsA wc_Base Then
		      Var wc As wc_Base = wc_Base(nextContainer)
		      
		      If wc.Parent = Nil Then
		        Var embedX, embedY, embedW, embedH As Integer
		        If wc.Position = wc_Base.PositionEnum.TopLeft Then
		          embedX = 0
		          embedY = 0
		          embedW = mHostPage.Placeholder.Width
		          embedH = mHostPage.Placeholder.Height
		        Else ' Center
		          embedW = wc.Width
		          embedH = wc.Height
		          embedX = (mHostPage.Placeholder.Width - embedW) / 2
		          embedY = (mHostPage.Placeholder.Height - embedH) / 2
		        End If
		        
		        nextContainer.EmbedWithin(mHostPage.Placeholder, embedX, embedY, embedW, embedH)
		      End If
		      
		      wc.EmbedInto(mHostPage.Placeholder)
		    Else
		      If nextContainer.Parent = Nil Then
		        nextContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
		      End If
		    End If
		    
		    nextContainer.Visible = True
		    
		    ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
		    If nextContainer IsA wc_Base Then
		      wc_Base(nextContainer).UpdateNavigation
		    End If
		    
		    LogNavigation("NavigateForward", nextContainer)
		  End If
		  
		  
		  
		  ' If mForward.Count > 0 Then
		  ' ' Save current to history
		  ' If mHostPage.ContentArea <> Nil Then
		  ' mHistory.Add(mHostPage.ContentArea)
		  ' mHostPage.ContentArea.Visible = False
		  ' End If
		  ' 
		  ' ' Get next container
		  ' Var nextContainer As WebContainer = mForward.Pop
		  ' mHostPage.ContentArea = nextContainer
		  ' 
		  ' ' Re-embed if necessary
		  ' If nextContainer IsA wc_Base Then
		  ' Var wc As wc_Base = wc_Base(nextContainer)
		  ' 
		  ' If wc.Parent = Nil Then
		  ' Var embedW, embedH As Integer
		  ' If wc.Position = wc_Base.PositionEnum.TopLeft Then
		  ' embedW = mHostPage.Placeholder.Width
		  ' embedH = mHostPage.Placeholder.Height
		  ' Else
		  ' embedW = wc.Width
		  ' embedH = wc.Height
		  ' End If
		  ' 
		  ' nextContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, embedW, embedH)
		  ' End If
		  ' 
		  ' wc.EmbedInto(mHostPage.Placeholder)
		  ' Else
		  ' If nextContainer.Parent = Nil Then
		  ' nextContainer.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
		  ' End If
		  ' End If
		  ' 
		  ' nextContainer.Visible = True
		  ' 
		  ' ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
		  ' If nextContainer IsA wc_Base Then
		  ' wc_Base(nextContainer).UpdateNavigation
		  ' End If
		  ' 
		  ' LogNavigation("NavigateForward", nextContainer)
		  ' End If
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NavigateTo(container as WebContainer)
		  ' Save current container to history
		  If mHostPage.ContentArea <> Nil Then
		    mHistory.Add(mHostPage.ContentArea)
		    mHostPage.ContentArea.Visible = False
		  End If
		  
		  ' Clear forward history on new navigation
		  mForward.RemoveAll
		  mHostPage.ContentArea = container
		  
		  ' Handle wc_Base positioning
		  If container IsA wc_Base Then
		    Var wc As wc_Base = wc_Base(container)
		    
		    Var embedX, embedY, embedW, embedH As Integer
		    If wc.Position = wc_Base.PositionEnum.TopLeft Then
		      embedX = 0
		      embedY = 0
		      embedW = mHostPage.Placeholder.Width
		      embedH = mHostPage.Placeholder.Height
		    Else ' Center
		      embedW = wc.Width
		      embedH = wc.Height
		      embedX = (mHostPage.Placeholder.Width - embedW) / 2
		      embedY = (mHostPage.Placeholder.Height - embedH) / 2
		    End If
		    
		    container.EmbedWithin(mHostPage.Placeholder, embedX, embedY, embedW, embedH)
		    wc.EmbedInto(mHostPage.Placeholder)
		  Else
		    container.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
		  End If
		  
		  container.Visible = True
		  
		  ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
		  If container IsA wc_Base Then
		    wc_Base(container).UpdateNavigation
		  End If
		  
		  LogNavigation("NavigateTo", container)
		  
		  
		  
		  ' ' Save current container to history
		  ' If mHostPage.ContentArea <> Nil Then
		  ' mHistory.Add(mHostPage.ContentArea)
		  ' mHostPage.ContentArea.Visible = False
		  ' End If
		  ' 
		  ' ' Clear forward history on new navigation
		  ' mForward.RemoveAll
		  ' mHostPage.ContentArea = container
		  ' 
		  ' ' Handle wc_Base positioning
		  ' If container IsA wc_Base Then
		  ' Var wc As wc_Base = wc_Base(container)
		  ' 
		  ' Var embedW, embedH As Integer
		  ' If wc.Position = wc_Base.PositionEnum.TopLeft Then
		  ' embedW = mHostPage.Placeholder.Width
		  ' embedH = mHostPage.Placeholder.Height
		  ' Else
		  ' embedW = wc.Width
		  ' embedH = wc.Height
		  ' End If
		  ' 
		  ' container.EmbedWithin(mHostPage.Placeholder, 0, 0, embedW, embedH)
		  ' wc.EmbedInto(mHostPage.Placeholder)
		  ' Else
		  ' container.EmbedWithin(mHostPage.Placeholder, 0, 0, mHostPage.Placeholder.Width, mHostPage.Placeholder.Height)
		  ' End If
		  ' 
		  ' container.Visible = True
		  ' 
		  ' ' UPDATE HEADER NAVIGATION - fires every time we navigate to update wp_Mainshell's header
		  ' If container IsA wc_Base Then
		  ' wc_Base(container).UpdateNavigation
		  ' End If
		  ' 
		  ' LogNavigation("NavigateTo", container)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private mForward() As WebContainer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHistory() As WebContainer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mHostPage As wp_MainShell
	#tag EndProperty


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
End Class
#tag EndClass
