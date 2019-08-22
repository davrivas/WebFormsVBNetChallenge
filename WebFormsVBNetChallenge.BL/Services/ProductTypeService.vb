Imports System.Data.SqlClient
Imports WebFormsVBNetChallenge.Model

Public Class ProductTypeService
    Inherits BaseService(Of ProductType)

    Public Overrides Sub Insert(entity As ProductType)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Update(entity As ProductType)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Delete(entity As ProductType)
        Throw New NotImplementedException()
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
End Class
