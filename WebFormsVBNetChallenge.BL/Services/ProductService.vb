Imports System.Data.SqlClient
Imports WebFormsVBNetChallenge.Model

Public Class ProductService
    Inherits BaseService(Of Product)

    Public Overrides Sub Insert(entity As Product)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Update(oldEntity As Product, newEntity As Product)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Delete(entity As Product)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Async Function GetAllAsync() As Task(Of List(Of Product))
        Try
            Dim products As List(Of Product) = New List(Of Product)

            Using connection = New SqlConnection(ConnectionString)
                Using command = New SqlCommand("GetProducts", connection)
                    command.CommandType = CommandType.StoredProcedure

                    Await connection.OpenAsync()



                    connection.Close()
                End Using
            End Using
        Catch ex As Exception
            Throw New Exception(ex.Message)
        End Try
    End Function
End Class
