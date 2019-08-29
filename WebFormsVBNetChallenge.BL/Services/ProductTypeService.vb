Imports System.Data.SqlClient
Imports WebFormsVBNetChallenge.Model

Public Class ProductTypeService
    Inherits BaseService(Of ProductType)

    Public Overrides Sub Insert(entity As ProductType)
        Try
            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "InsertProductType"
                    command.CommandType = CommandType.StoredProcedure

                    connection.Open()

                    Dim nameParameter = command.Parameters.Add("@Name", SqlDbType.NVarChar)
                    nameParameter.Value = entity.Name

                    command.ExecuteNonQuery()
                    connection.Close()
                End Using
            End Using
        Catch ex As Exception
            Throw ex
        End Try
    End Sub

    Public Overrides Sub Update(entity As ProductType)
        Try
            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "UpdateProductType"
                    command.CommandType = CommandType.StoredProcedure

                    connection.Open()

                    Dim idParameter = command.Parameters.Add("@Id", SqlDbType.NVarChar)
                    idParameter.Value = entity.Id

                    Dim descriptionParameter = command.Parameters.Add("@Name", SqlDbType.NVarChar)
                    descriptionParameter.Value = entity.Name

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
                    command.CommandText = "DeleteProductType"
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

    Public Overrides Function GetAll() As List(Of ProductType)
        Try
            Dim productTypes As List(Of ProductType) = New List(Of ProductType)

            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                connection.Open()

                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "GetProductTypes"
                    command.CommandType = CommandType.StoredProcedure

                    Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                        Dim productType As ProductType

                        While reader.Read
                            productType = New ProductType() With
                            {
                                .Id = Integer.Parse(reader("Id").ToString),
                                .Name = reader("Name").ToString
                            }
                            productTypes.Add(productType)
                        End While
                    End Using
                End Using

                connection.Close()
            End Using

            Return productTypes
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Overrides Function GetById(id As Integer) As ProductType
        Try
            Dim productType As ProductType = New ProductType

            Using connection As SqlConnection = New SqlConnection(ConnectionString)
                Using command As SqlCommand = connection.CreateCommand()
                    command.CommandText = "GetProductTypeById"
                    command.CommandType = CommandType.StoredProcedure

                    Dim idParameter = command.Parameters.Add("@Id", SqlDbType.NVarChar)
                    idParameter.Value = id

                    connection.Open()

                    Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                        If reader.Read Then
                            productType = New ProductType() With
                            {
                                .Id = Integer.Parse(reader("Id").ToString),
                                .Name = reader("Name").ToString
                            }
                        End If
                    End Using

                    connection.Close()
                End Using
            End Using

            Return productType
        Catch ex As Exception
            Throw ex
        End Try
    End Function

    Public Function GetProductTypeProductsCount(id As Integer) As Integer
        Dim count As Integer = 0

        Using connection As SqlConnection = New SqlConnection(ConnectionString)
            Using command As SqlCommand = connection.CreateCommand()
                command.CommandText = "GetProductTypeProductsCount"
                command.CommandType = CommandType.StoredProcedure

                Dim idParameter = command.Parameters.Add("@ProductTypeId", SqlDbType.Int)
                idParameter.Value = id

                connection.Open()

                Using reader As SqlDataReader = command.ExecuteReader(CommandBehavior.CloseConnection)
                    If reader.Read Then
                        count = Integer.Parse(reader("ProductCount").ToString)
                    End If
                End Using

                connection.Close()
            End Using
        End Using

        Return count
    End Function
End Class
