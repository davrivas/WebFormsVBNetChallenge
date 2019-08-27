Imports WebFormsVBNetChallenge.BL

Public Class _Default
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Try
                Session("ProductId") = Nothing
                productsRepeater.DataSource = _productService.GetProductByDescription(txtProductName.Text)
                productsRepeater.DataBind()
            Catch ex As Exception
                HandleException(ex)
            Finally
                If Session("Success") IsNot Nothing Then
                    ShowMessage(Session("Success"), MessageType.Success)
                    Session("Success") = Nothing
                End If
            End Try
        End If
    End Sub

    Protected Sub BtnSearch_Click(sender As Object, e As EventArgs)
        Try
            productsRepeater.DataSource = _productService.GetProductByDescription(txtProductName.Text)
            productsRepeater.DataBind()
        Catch ex As Exception
            HandleException(ex)
        End Try
    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs)
        Dim button As Button = sender

        If button IsNot Nothing Then
            Dim id As Integer = Integer.Parse(button.CommandArgument)
            Session("ProductId") = id
            Response.Redirect("EditProduct.aspx")
        End If
    End Sub

    Protected Sub BtnDelete_Click(sender As Object, e As EventArgs)
        Dim button As Button = sender

        If button IsNot Nothing Then
            Dim id As Integer = Integer.Parse(button.CommandArgument)
            Session("ProductId") = id
            Response.Redirect("DeleteProduct.aspx")
        End If
    End Sub

    Protected Sub BtnAdd_Click(sender As Object, e As EventArgs)
        Response.Redirect("AddProduct.aspx")
    End Sub
End Class