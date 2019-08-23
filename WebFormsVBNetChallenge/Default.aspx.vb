Imports WebFormsVBNetChallenge.BL

Public Class _Default
    Inherits Page
    Private ReadOnly productService As ProductService = New ProductService

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        productsRepeater.DataSource = productService.GetAll
        productsRepeater.DataBind()
    End Sub

    Protected Sub BtnSearch_Click(sender As Object, e As EventArgs)
        productsRepeater.DataSource = productService.SearchProduct(txtProductName.Text)
        productsRepeater.DataBind()
    End Sub

    Protected Sub BtnAdd_Click(sender As Object, e As EventArgs)

    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs)
        Dim button As Button = sender

        If button IsNot Nothing Then
            Dim id = button.CommandArgument
            Response.Redirect("EditProduct")
        End If
    End Sub

    Protected Sub BtnDelete_Click(sender As Object, e As EventArgs)
        Dim button As Button = sender
    End Sub
End Class