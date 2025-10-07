' *******************************************************************************
' In the Session class, add these properties:
' *******************************************************************************
Public MainShell as wp_MainShell
Public Navigation as WebNavigationManager
Public CurrentUserID as Integer = 0
Public CurrentUserName as String = ""
Public CurrentUserEmail as String = ""
Public IsAdmin as Boolean = False
Public DB as MySQLCommunityServer



' *******************************************************************************
' Session.opening event
' *******************************************************************************
DB = New MySQLCommunityServer
DB.Host = "127.0.0.1"
DB.Port = 3306
DB.DatabaseName = "echoscore"
DB.UserName = "root"
DB.Password = "your_mysql_root_password"

Try
  If Not DB.Connect Then
    MessageBox("Database connection failed: " + DB.ErrorMessage)
    Return
  End If
  
  System.DebugLog("Database connected successfully")
  
Catch e As RuntimeException
  MessageBox("Database error: " + e.Message)
  Return
End Try

MainShell = New wp_MainShell
MainShell.Show
Navigation = New WebNavigationManager(MainShell)

Var w As New wc_Login
w.ContainerID = "Login"
w.Position = wc_Base.PositionEnum.Center
Navigation.NavigateTo(w)