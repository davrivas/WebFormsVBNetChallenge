Imports WebFormsVBNetChallenge.BL
Imports WebFormsVBNetChallenge.Model

Public Class ChallengePage
    Inherits Page

    Protected ReadOnly _ProductService As ProductService = New ProductService
    Protected ReadOnly _ProductTypeService As ProductTypeService = New ProductTypeService

    Protected _SelectedProduct As Product
    Protected _SelectedProductType As ProductType

    Public Sub ShowMessage(message As String, messageType As MessageType)
        Dim sb As StringBuilder = New StringBuilder
        sb.Append("$(function() { ")

        Select Case messageType
            Case MessageType.Success
                sb.Append($"    toastr.error({message}, 'Error');")
                Exit Select
            Case MessageType.ErrorM
                sb.Append($"    toastr.error({message}, 'Error');")
                Exit Select
        End Select

        sb.Append("});")

        Page.ClientScript.RegisterStartupScript(Me.GetType(), "myKey", sb.ToString(), True)
    End Sub

    Protected Sub HandleException(ex As Exception)
        Debug.WriteLine(ex.StackTrace)
        ShowMessage(ex.Message, MessageType.ErrorM)
    End Sub
End Class

Public Enum MessageType
    Success
    ErrorM
End Enum
