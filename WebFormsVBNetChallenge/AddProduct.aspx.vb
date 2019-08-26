Imports WebFormsVBNetChallenge.BL

Public Class AddProduct
    Inherits System.Web.UI.Page

    Private ReadOnly _productTypeService As ProductTypeService = New ProductTypeService

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        HideValidation()
        ddlAddProductType.DataSource = _productTypeService.GetAll
        ddlAddProductType.DataValueField = "Id"
        ddlAddProductType.DataTextField = "Name"
        ddlAddProductType.DataBind()
    End Sub

    Private Sub HideValidation()
        lblDescriptionValidation.Visible = False
        lblPriceValidation.Visible = False
    End Sub

End Class