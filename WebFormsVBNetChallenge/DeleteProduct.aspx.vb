Public Class DeleteProduct
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If ProductId Is Nothing Then Response.Redirect("Default.aspx")

            Try
                SelectedProduct = _ProductService.GetById(ProductId)
                ProductId = Nothing
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If

        Title = $"Delete product {SelectedProduct.Description}"

        If ErrorMessage IsNot Nothing Then ShowErrorMessage()
    End Sub

    Protected Sub BtnDelete_Click(sender As Object, e As EventArgs)
        Try
            _ProductService.Delete(SelectedProduct.Id)
            SuccessMessage = "Product " & SelectedProduct.Description & " was removed successfully"
            SelectedProduct = Nothing
            Response.Redirect("Default.aspx")
        Catch ex As Exception
            HandleException(ex)
        End Try
    End Sub

    Protected Sub BtnGoBack_Click(sender As Object, e As EventArgs)
        Response.Redirect("Default.aspx")
    End Sub
End Class