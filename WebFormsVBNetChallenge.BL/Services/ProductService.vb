Imports System.Data.SqlClient
Imports WebFormsVBNetChallenge.Model

Public Class ProductService
    Inherits BaseService(Of Product)

    Public Overrides Sub Insert(entity As Product)
        Try
            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "InsertProduct"
                    command.CommandType = CommandType.StoredProcedure

                    connection.Open()

                    Dim identifierParameter = command.Parameters.Add("@Identifier", SqlDbType.NVarChar)

                    Dim code As String = String.Empty

                    Do
                        code = CodeGenerator.GenerateCode
                    Loop Until Not ProductIdentifierExists(code)

                    identifierParameter.Value = code

                    Dim descriptionParameter = command.Parameters.Add("@Description", SqlDbType.NVarChar)
                    descriptionParameter.Value = entity.Description

                    Dim productTypeIdParameter = command.Parameters.Add("@ProductTypeId", SqlDbType.Int)
                    productTypeIdParameter.Value = entity.ProductTypeId

                    Dim priceParameter = command.Parameters.Add("@Price", SqlDbType.Decimal)
                    priceParameter.Value = entity.Price

                    Dim creationDateParameter = command.Parameters.Add("@CreationDate", SqlDbType.DateTime)
                    creationDateParameter.Value = Date.Now

                    Dim productStatusParameter = command.Parameters.Add("@ProductStatus", SqlDbType.Int)
                    productStatusParameter.Value = Convert.ToInt32(ProductStatus.Active)

                    command.ExecuteNonQuery()
                    connection.Close()
                End Using
            End Using
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Overrides Sub Update(entity As Product)
        Try
            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "UpdateProduct"
                    command.CommandType = CommandType.StoredProcedure

                    connection.Open()

                    Dim idParameter = command.Parameters.Add("@Id", SqlDbType.NVarChar)
                    idParameter.Value = entity.Id

                    Dim descriptionParameter = command.Parameters.Add("@Description", SqlDbType.NVarChar)
                    descriptionParameter.Value = entity.Description

                    Dim productTypeIdParameter = command.Parameters.Add("@ProductTypeId", SqlDbType.Int)
                    productTypeIdParameter.Value = entity.ProductTypeId

                    Dim priceParameter = command.Parameters.Add("@Price", SqlDbType.Decimal)
                    priceParameter.Value = entity.Price

                    Dim productStatusParameter = command.Parameters.Add("@ProductStatus", SqlDbType.Int)
                    productStatusParameter.Value = Convert.ToInt32(entity.ProductStatus)

                    command.ExecuteNonQuery()
                    connection.Close()
                End Using
            End Using
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Overrides Sub Delete(id As Integer)
        Try
            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "DeleteProduct"
                    command.CommandType = CommandType.StoredProcedure

                    connection.Open()

                    Dim idParameter = command.Parameters.Add("@Id", SqlDbType.NVarChar)
                    idParameter.Value = id

                    command.ExecuteNonQuery()
                    connection.Close()
                End Using
            End Using
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Overrides Function GetAll() As List(Of Product)
        Throw New NotImplementedException
    End Function

    Public Overrides Function GetById(id As Integer) As Product
        Try
            Dim product As Product = Nothing

            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "GetProductById"
                    command.CommandType = CommandType.StoredProcedure

                    Dim productIdParameter = command.Parameters.Add("@ProductId", SqlDbType.Int)

                    productIdParameter.Value = id

                    connection.Open()

                    Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                        product = IIf(reader.Read, GetProduct(reader), Nothing)
                    End Using

                    connection.Close()
                End Using
            End Using

            Return product
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function GetProductByDescriptionOrIdentifier(search As String)
        Try
            Dim products As List(Of Product) = New List(Of Product)

            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "GetProductByDescriptionOrIdentifier"
                    command.CommandType = CommandType.StoredProcedure

                    Dim searchParameter = command.Parameters.Add("@Search", SqlDbType.NVarChar)

                    searchParameter.Value = IIf(String.IsNullOrWhiteSpace(search), DBNull.Value, search)

                    connection.Open()

                    Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                        Dim product As Product

                        While reader.Read
                            product = GetProduct(reader)
                            products.Add(product)
                        End While
                    End Using

                    connection.Close()
                End Using
            End Using

            Return products
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function ProductIdentifierExists(identifier As String) As Boolean
        Try
            Dim exists As Boolean = True

            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "ProductIdentifierExists"
                    command.CommandType = CommandType.StoredProcedure

                    Dim productIdParameter = command.Parameters.Add("@Identifier", SqlDbType.NVarChar)

                    productIdParameter.Value = identifier

                    connection.Open()

                    Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                        If (reader.Read) Then
                            Dim number As Integer = Integer.Parse(reader("ProductCount").ToString)
                            exists = IIf(number.Equals(1), True, False)
                        Else
                            exists = False
                        End If
                    End Using

                    connection.Close()
                End Using
            End Using

            Return exists
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Private Function GetProduct(reader As SqlDataReader) As Product
        Dim productType As ProductType = New ProductType() With
        {
            .Id = Integer.Parse(reader("ProductTypeId").ToString),
            .Name = reader("ProductTypeName").ToString
        }
        Dim product As Product = New Product() With
        {
            .Id = Integer.Parse(reader("Id").ToString),
            .Identifier = reader("Identifier").ToString,
            .Description = reader("Description").ToString,
            .ProductTypeId = Integer.Parse(reader("ProductTypeId").ToString),
            .ProductType = productType,
            .Price = Decimal.Parse(reader("Price").ToString),
            .CreationDate = Date.Parse(reader("CreationDate").ToString),
            .ProductStatus = Integer.Parse(reader("ProductStatus").ToString)
        }

        Return product
    End Function
End Class
