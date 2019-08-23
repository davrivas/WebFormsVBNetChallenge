Imports System.Data.SqlClient
Imports WebFormsVBNetChallenge.Model

Public Class ProductService
    Inherits BaseService(Of Product)

    Public Overrides Sub Insert(entity As Product)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Update(entity As Product)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Delete(entity As Product)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Function GetAll() As List(Of Product)
        Try
            Dim products As List(Of Product) = New List(Of Product)

            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                connection.Open()

                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "GetProducts"
                    command.CommandType = CommandType.StoredProcedure

                    Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                        Dim product As Product
                        Dim productType As ProductType

                        While reader.Read
                            productType = New ProductType() With
                            {
                                .Id = Integer.Parse(reader("ProductTypeId").ToString),
                                .Name = reader("ProductTypeName").ToString
                            }
                            product = New Product() With
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
                            products.Add(product)
                        End While
                    End Using
                End Using

                connection.Close()
            End Using

            Return products
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function SearchProduct(search As String)
        Try
            Dim products As List(Of Product) = New List(Of Product)

            Using connection As SqlConnection = New SqlConnection(ConnectionString)


                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "SearchProduct"
                    command.CommandType = CommandType.StoredProcedure

                    Dim parameter1 = command.Parameters.Add("@Search", SqlDbType.NVarChar)

                    parameter1.Value = IIf(String.IsNullOrWhiteSpace(search), DBNull.Value, String.Format("%{0}%", search))

                    connection.Open()

                    Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                        Dim product As Product
                        Dim productType As ProductType

                        While reader.Read
                            productType = New ProductType() With
                            {
                                .Id = Integer.Parse(reader("ProductTypeId").ToString),
                                .Name = reader("ProductTypeName").ToString
                            }
                            product = New Product() With
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
End Class
