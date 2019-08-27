Imports WebFormsVBNetChallenge.Model

Public Class EditProduct
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("ProductId") Is Nothing Then Response.Redirect("Default.aspx")

            Try
                lblDescriptionValidation.Visible = False
                lblPriceValidation.Visible = False

                ddlProductType.DataSource = _productTypeService.GetAll
                ddlProductType.DataValueField = "Id"
                ddlProductType.DataTextField = "Name"
                ddlProductType.DataBind()

                Dim selectedProduct As Product = _productService.GetById(Session("ProductId"))
                Session("ProductId") = Nothing
                Title = "Edit product (" & selectedProduct.Description & ")"
                lblIdentifier.Text = selectedProduct.Identifier
                lblCreationDate.Text = selectedProduct.CreationDate.ToString("yyyy/MM/dd hh:mm:ss")
                txtDescription.Text = selectedProduct.Description
                txtPrice.Text = selectedProduct.Price.ToString
                ddlProductType.SelectedValue = selectedProduct.ProductTypeId.ToString

                'check this (show text and store value)
                If selectedProduct.ProductStatus = ProductStatus.Active Then
                    ddlProductStatus.Items.Add(ProductStatus.Active)
                    ddlProductStatus.Items.Add(ProductStatus.Inactive)
                Else
                    ddlProductStatus.Items.Add(ProductStatus.Inactive)
                    ddlProductStatus.Items.Add(ProductStatus.Active)
                End If
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If
    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs)

    End Sub
End Class