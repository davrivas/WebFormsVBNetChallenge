Public Class DeleteProduct
    Inherits ChallengePage

    Private _productId As Integer

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("ProductId") Is Nothing Then Response.Redirect("Default.aspx")
            _productId = Session("ProductId")

            Try
                _SelectedProduct = _ProductService.GetById(Session("ProductId"))
                Session("ProductId") = Nothing
                lblConfirmation.Text = "Do you want to delete this product (" & _SelectedProduct.Description & ")?"
                _SelectedProduct = Nothing
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If
    End Sub

    Protected Sub BtnDelete_Click(sender As Object, e As EventArgs)

    End Sub
End Class