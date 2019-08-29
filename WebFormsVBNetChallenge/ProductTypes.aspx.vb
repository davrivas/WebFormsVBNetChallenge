Public Class ProductTypes
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If ProductTypeId IsNot Nothing Then ProductTypeId = Nothing

        If Not Page.IsPostBack Then
            Try
                productTypesRepeater.DataSource = _ProductTypeService.GetAll
                productTypesRepeater.DataBind()
            Catch ex As Exception
                HandleException(ex)
            End Try

        End If

        If SuccessMessage IsNot Nothing Then ShowSuccessMessage()
        If ErrorMessage IsNot Nothing Then ShowErrorMessage()
    End Sub

    Protected Sub BtnAdd_Click(sender As Object, e As EventArgs)
        Response.Redirect("AddProductType.aspx")
    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs)
        Dim button As Button = sender

        If button IsNot Nothing Then
            Dim id As Integer = Integer.Parse(button.CommandArgument)
            ProductTypeId = id
            Response.Redirect("EditProductType.aspx")
        End If
    End Sub

    Protected Sub BtnDelete_Click(sender As Object, e As EventArgs)
        Dim button As Button = sender

        If button IsNot Nothing Then
            Dim id As Integer = Integer.Parse(button.CommandArgument)
            ProductTypeId = id
            Response.Redirect("DeleteProductType.aspx")
        End If
    End Sub
End Class