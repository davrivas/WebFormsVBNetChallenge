Imports System.Configuration

Public MustInherit Class BaseService(Of T)
    Protected ReadOnly ConnectionString As String = ConfigurationManager.ConnectionStrings("ProductsConnection").ToString

    Public MustOverride Function GetAll() As List(Of T)
    Public MustOverride Function GetById(id As Integer) As T
    Public MustOverride Sub Insert(entity As T)
    Public MustOverride Sub Update(entity As T)
    Public MustOverride Sub Delete(id As Integer)
End Class
