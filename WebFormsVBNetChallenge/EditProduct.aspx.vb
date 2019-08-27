Imports WebFormsVBNetChallenge.Model

Public Class EditProduct
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            If Session("ProductId") Is Nothing Then Response.Redirect("Default.aspx")

            Try
                lblDescriptionValidation.Visible = False
                lblPriceValidation.Visible = False

                ddlProductType.DataSource = _ProductTypeService.GetAll
                ddlProductType.DataValueField = "Id"
                ddlProductType.DataTextField = "Name"
                ddlProductType.DataBind()

                _SelectedProduct = _ProductService.GetById(Session("ProductId"))
                btnEdit.CommandArgument = Session("ProductId").ToString
                Session("ProductId") = Nothing
                Title = "Edit product (" & _SelectedProduct.Description & ")"
                lblIdentifier.Text = _SelectedProduct.Identifier
                lblCreationDate.Text = _SelectedProduct.CreationDate.ToString("yyyy/MM/dd hh:mm:ss")
                txtDescription.Text = _SelectedProduct.Description
                txtPrice.Text = _SelectedProduct.Price.ToString
                ddlProductType.SelectedValue = _SelectedProduct.ProductTypeId.ToString

                Dim productStatuses As List(Of ProductStatusClass) = New List(Of ProductStatusClass)

                If _SelectedProduct.ProductStatus = ProductStatus.Active Then
                    productStatuses.Add(New ProductStatusClass With {.Value = Convert.ToInt32(ProductStatus.Active), .Text = ProductStatus.Active.ToString})
                    productStatuses.Add(New ProductStatusClass With {.Value = Convert.ToInt32(ProductStatus.Inactive), .Text = ProductStatus.Inactive.ToString})
                Else
                    productStatuses.Add(New ProductStatusClass With {.Value = Convert.ToInt32(ProductStatus.Inactive), .Text = ProductStatus.Inactive.ToString})
                    productStatuses.Add(New ProductStatusClass With {.Value = Convert.ToInt32(ProductStatus.Active), .Text = ProductStatus.Active.ToString})
                End If

                ddlProductStatus.DataSource = productStatuses
                ddlProductStatus.DataValueField = "Value"
                ddlProductStatus.DataTextField = "Text"
                ddlProductStatus.DataBind()
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If
    End Sub

    Protected Sub BtnEdit_Click(sender As Object, e As EventArgs)
        If ValidateForm() Then
            If _SelectedProduct Is Nothing Then _SelectedProduct = New Product
            _SelectedProduct.Id = Integer.Parse(sender.CommandArgument)
            _SelectedProduct.Description = txtDescription.Text
            _SelectedProduct.Price = Decimal.Parse(txtPrice.Text)
            _SelectedProduct.ProductTypeId = Integer.Parse(ddlProductType.SelectedValue)
            _SelectedProduct.ProductStatus = Integer.Parse(ddlProductStatus.SelectedValue)

            Try
                _ProductService.Update(_SelectedProduct)
                Session("Success") = "Product " & txtDescription.Text & " updated successfully"
                _SelectedProduct = Nothing
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

    Private Class ProductStatusClass
        Public Property Value As Integer
        Public Property Text As String
    End Class
End Class

