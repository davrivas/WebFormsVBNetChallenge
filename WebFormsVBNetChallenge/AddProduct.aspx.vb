Imports WebFormsVBNetChallenge.BL
Imports WebFormsVBNetChallenge.Model

Public Class AddProduct
    Inherits ChallengePage

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Try
                lblDescriptionValidation.Visible = False
                lblPriceValidation.Visible = False

                ddlProductType.DataSource = _productTypeService.GetAll
                ddlProductType.DataValueField = "Id"
                ddlProductType.DataTextField = "Name"
                ddlProductType.DataBind()
            Catch ex As Exception
                HandleException(ex)
            End Try
        End If
    End Sub

    Protected Sub BtnAdd_Click(sender As Object, e As EventArgs)
        If ValidateForm() Then
            Dim newProduct As Product = New Product With {
                .Description = txtDescription.Text,
                .Price = Decimal.Parse(txtPrice.Text),
                .ProductTypeId = Integer.Parse(ddlProductType.SelectedValue)
            }

            Try
                _productService.Insert(newProduct)
                Session("Success") = "Product " & txtDescription.Text & " added successfully"
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
End Class