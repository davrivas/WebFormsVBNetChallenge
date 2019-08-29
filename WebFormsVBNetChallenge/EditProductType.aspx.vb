Public Class EditProductType
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If ProductTypeId Is Nothing Then Response.Redirect("ProductTypes.aspx")

            Try
                lblNameValidation.Visible = False

                SelectedProductType = _ProductTypeService.GetById(ProductTypeId)
                btnEdit.CommandArgument = ProductTypeId.ToString
                ProductTypeId = Nothing

                txtName.Text = SelectedProductType.Name
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If

        Title = "Edit product type (" & SelectedProductType.Name & ")"

        If ErrorMessage IsNot Nothing Then ShowErrorMessage()
    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs)
        If ValidateForm() Then
            SelectedProductType.Id = Integer.Parse(sender.CommandArgument)
            SelectedProductType.Name = txtName.Text

            Try
                _ProductTypeService.Update(SelectedProductType)
                SuccessMessage = "Product type " & txtName.Text & " was updated successfully"
                SelectedProductType = Nothing
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