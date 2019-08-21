Imports System.Configuration

Public MustInherit Class BaseService(Of T)
    Protected ReadOnly ConnectionString As String = ConfigurationManager.ConnectionStrings("ProductsConnection").ToString

    Public MustOverride Async Function GetAllAsync() As Task(Of List(Of T))
    Public MustOverride Sub Insert(entity As T)
    Public MustOverride Sub Update(oldEntity As T, newEntity As T)
    Public MustOverride Sub Delete(entity As T)
End Class
