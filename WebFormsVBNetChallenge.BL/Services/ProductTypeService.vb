Imports WebFormsVBNetChallenge.Model

Public Class ProductTypeService
    Inherits BaseService(Of ProductType)

    Public Overrides Sub Insert(entity As ProductType)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Update(oldEntity As ProductType, newEntity As ProductType)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Sub Delete(entity As ProductType)
        Throw New NotImplementedException()
    End Sub

    Public Overrides Function GetAllAsync() As Task(Of List(Of ProductType))
        Throw New NotImplementedException()
    End Function
End Class
