Public Class DeleteProductType
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If ProductTypeId Is Nothing Then Response.Redirect("ProductTypes.aspx")

            Try
                SelectedProductType = _ProductTypeService.GetById(ProductTypeId)
                Dim associatedProducts As Integer = _ProductTypeService.GetProductTypeProductsCount(ProductTypeId)

                If associatedProducts = 0 Then
                    lblInvalidDelete.Visible = False
                Else
                    lblValidDelete.Visible = False
                    lblInvalidDelete.Text = "You cannot delete this product type because it has associated products(s). Please delete " & SelectedProductType.Name & " products to delete this product type."
                    btnDelete.Enabled = False
                End If

                ProductTypeId = Nothing
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If

        Title = $"Delete product type {SelectedProductType.Name}"

        If ErrorMessage IsNot Nothing Then ShowErrorMessage()
    End Sub

    Protected Sub BtnDelete_Click(sender As Object, e As EventArgs)
        Dim button As Button = sender

        If button Is Nothing Then Exit Sub

        If Not button.Enabled Then Exit Sub

        Try
            _ProductTypeService.Delete(SelectedProductType.Id)
            SuccessMessage = "Product type " & SelectedProductType.Name & " was removed successfully"
            SelectedProductType = Nothing
            Response.Redirect("ProductTypes.aspx")
        Catch ex As Exception
            HandleException(ex)
        End Try
    End Sub

    Protected Sub BtnGoBack_Click(sender As Object, e As EventArgs)
        Response.Redirect("ProductTypes.aspx")
    End Sub
End Class