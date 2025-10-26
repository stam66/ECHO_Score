' =============================================================================
' wp_MainShell WebPage
' Main page that hosts all WebContainers
' =============================================================================

' Insert → WebPage
' Name: wp_MainShell

' ******************************************************************
' Property:
' ******************************************************************
Public ContentArea As WebContainer

' ******************************************************************
' Controls
' ******************************************************************
' Add Control: WebContainer
' Name: Placeholder
' Properties:
'   - LockLeft = True
'   - LockTop = True
'   - LockRight = True
'   - LockBottom = True
' Position: Fill the entire page (or leave room for header/footer if desired)

' =============================================================================
' Notes:
' * Placeholder is the container where all navigation happens
' * ContentArea property tracks the currently visible container
' * WebNavigationManager uses this page for all container embedding
' * No code needed in events - all navigation is handled by WebNavigationManager
' =============================================================================