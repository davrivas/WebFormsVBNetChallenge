Imports WebFormsVBNetChallenge
Imports WebFormsVBNetChallenge.BL
Imports WebFormsVBNetChallenge.Model

Public Class ChallengePage
    Inherits Page

    Protected Property SelectedProduct As Product
        Get
            Return Session("SelectedProduct")
        End Get
        Set(value As Product)
            Session("SelectedProduct") = value
        End Set
    End Property

    Protected Property SelectedProductType As ProductType
        Get
            Return Session("SelectedProductType")
        End Get
        Set(value As ProductType)
            Session("SelectedProductType") = value
        End Set
    End Property

    Protected Property SuccessMessage As String
        Get
            Return Session("SuccessMessage")
        End Get
        Set(value As String)
            Session("SuccessMessage") = value
        End Set
    End Property

    Protected Property ErrorMessage As String
        Get
            Return Session("ErrorMessage")
        End Get
        Set(value As String)
            Session("ErrorMessage") = value
        End Set
    End Property

    Protected Property ProductId As Integer?
        Get
            Return Session("ProductId")
        End Get
        Set(value As Integer?)
            Session("ProductId") = value
        End Set
    End Property

    Protected Property ProductTypeId As Integer?
        Get
            Return Session("ProductTypeId")
        End Get
        Set(value As Integer?)
            Session("ProductTypeId") = value
        End Set
    End Property

    Protected ReadOnly _ProductService As ProductService = New ProductService
    Protected ReadOnly _ProductTypeService As ProductTypeService = New ProductTypeService

    Protected Sub GoBack(page As String)
        Response.Redirect(page)
    End Sub

    Private Sub ShowMessage(message As String, messageType As MessageType)
        Dim sb As StringBuilder = New StringBuilder

        Select Case messageType
            Case MessageType.Success
                sb.Append($"<div class='alert alert-success'>{message}</div>")
                Exit Select
            Case MessageType.ErrorM
                sb.Append($"<div class='alert alert-danger'>{message}</div>")
                Exit Select
        End Select

        Response.Write(sb.ToString)
    End Sub

    Protected Sub HandleException(ex As Exception)
        Debug.WriteLine(ex.StackTrace)
        ErrorMessage = ex.Message
    End Sub

    Protected Sub ShowSuccessMessage()
        ShowMessage(SuccessMessage, MessageType.Success)
    End Sub

    Protected Sub ShowErrorMessage()
        If Not ErrorMessage.Equals("Thread was being aborted.") Then
            ShowMessage(ErrorMessage, MessageType.ErrorM)
        End If
    End Sub

End Class

Public Enum MessageType
    Success
    ErrorM
End Enum
