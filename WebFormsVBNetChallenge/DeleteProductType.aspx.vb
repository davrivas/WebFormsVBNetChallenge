Public Class DeleteProductType
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If ProductTypeId Is Nothing Then Response.Redirect("ProductTypes.aspx")

        If Not Page.IsPostBack Then
            Try
                SelectedProductType = _ProductTypeService.GetById(ProductTypeId)
                Dim associatedProducts As Integer = _ProductTypeService.GetProductTypeProductsCount(ProductTypeId)

                If associatedProducts = 0 Then
                    lblInvalidDelete.Visible = False
                    btnDelete.CommandArgument = ProductTypeId.ToString
                Else
                    lblValidDelete.Visible = False
                    lblInvalidDelete.Text = "You cannot delete this products because it has associated products(s). Please delete " & SelectedProductType.Name & " products to delete this product type."
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

    End Sub

    Protected Sub BtnGoBack_Click(sender As Object, e As EventArgs)

    End Sub
End Class