Imports WebFormsVBNetChallenge.Model

Public Class EditProduct
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If ProductId Is Nothing Then Response.Redirect("Default.aspx")

            Try
                lblDescriptionValidation.Visible = False
                lblPriceValidation.Visible = False

                ddlProductType.DataSource = _ProductTypeService.GetAll
                ddlProductType.DataValueField = "Id"
                ddlProductType.DataTextField = "Name"
                ddlProductType.DataBind()

                SelectedProduct = _ProductService.GetById(ProductId)
                btnEdit.CommandArgument = ProductId.ToString
                ProductId = Nothing

                lblIdentifier.Text = SelectedProduct.Identifier
                lblCreationDate.Text = SelectedProduct.CreationDate.ToString("yyyy/MM/dd hh:mm:ss")
                txtDescription.Text = SelectedProduct.Description
                txtPrice.Text = SelectedProduct.Price.ToString
                ddlProductType.SelectedValue = SelectedProduct.ProductTypeId.ToString

                ddlProductStatus.Items.Add(New ListItem With {.Value = Convert.ToInt32(ProductStatus.Active).ToString, .Text = ProductStatus.Active.ToString, .Selected = SelectedProduct.ProductStatus = ProductStatus.Active})
                ddlProductStatus.Items.Add(New ListItem With {.Value = Convert.ToInt32(ProductStatus.Inactive).ToString, .Text = ProductStatus.Inactive.ToString, .Selected = SelectedProduct.ProductStatus = ProductStatus.Inactive})
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If

        Title = "Edit product (" & SelectedProduct.Description & ")"
    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs)
        If ValidateForm() Then
            SelectedProduct.Id = Integer.Parse(sender.CommandArgument)
            SelectedProduct.Description = txtDescription.Text
            SelectedProduct.Price = Decimal.Parse(txtPrice.Text)
            SelectedProduct.ProductTypeId = Integer.Parse(ddlProductType.SelectedValue)
            SelectedProduct.ProductStatus = Integer.Parse(ddlProductStatus.SelectedValue)

            Try
                _ProductService.Update(SelectedProduct)
                SuccessMessage = "Product " & txtDescription.Text & " was updated successfully"
                SelectedProduct = Nothing
                Response.Redirect("Default.aspx")
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If
    End Sub

    Private Function ValidateForm() As Boolean
        Dim isValid As Boolean = True

        If String.IsNullOrWhiteSpace(txtDescription.Text) Then
            isValid = False
            lblDescriptionValidation.Visible = True
            lblDescriptionValidation.Text = "You must provide a description"
        Else
            lblDescriptionValidation.Visible = False
        End If

        If String.IsNullOrWhiteSpace(txtPrice.Text) Then
            isValid = False
            lblPriceValidation.Visible = True
            lblPriceValidation.Text = "You must provide a price"
        ElseIf Not IsNumeric(txtPrice.Text) Then
            isValid = False
            lblPriceValidation.Visible = True
            lblPriceValidation.Text = "You must provide a numeric value"
        ElseIf Decimal.Parse(txtPrice.Text) < 0 Or Decimal.Parse(txtPrice.Text) > Integer.MaxValue Then
            isValid = False
            lblPriceValidation.Visible = True
            lblPriceValidation.Text = "You must provide a value between 0 and " & Integer.MaxValue.ToString
        Else
            lblPriceValidation.Visible = False
        End If

        Return isValid
    End Function

    Protected Sub BtnGoBack_Click(sender As Object, e As EventArgs)
        Response.Redirect("Default.aspx")
    End Sub
End Class

