Imports WebFormsVBNetChallenge.BL

Public Class _Default
    Inherits Page
    Private productService As ProductService


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs) Handles Me.Load
        productService = New ProductService
        productsTable.DataSource = productService.GetAll
        productsTable.DataBind()
    End Sub
End Class