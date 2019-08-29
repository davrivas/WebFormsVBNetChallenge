Imports WebFormsVBNetChallenge.Model

Public Class AddProductType
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            lblNameValidation.Visible = False
        End If

        If ErrorMessage IsNot Nothing Then ShowErrorMessage()
    End Sub

    Protected Sub BtnAdd_Click(sender As Object, e As EventArgs)
        If ValidateForm() Then
            Dim newProductType = New ProductType With {
                .Name = txtName.Text
            }

            Try
                _ProductTypeService.Insert(newProductType)
                SuccessMessage = "Product type " & txtName.Text & " was added successfully"
                Response.Redirect("ProductTypes.aspx")
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If
    End Sub

    Private Function ValidateForm() As Boolean
        Dim isValid As Boolean = True

        If String.IsNullOrWhiteSpace(txtName.Text) Then
            isValid = False
            lblNameValidation.Visible = True
            lblNameValidation.Text = "You must provide a name"
        Else
            lblNameValidation.Visible = False
        End If

        Return isValid
    End Function

    Protected Sub BtnGoBack_Click(sender As Object, e As EventArgs)
        Response.Redirect("ProductTypes.aspx")
    End Sub
End Class