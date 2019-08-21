Public Class ProductType
    Inherits BaseEntity
    Private nameField As String
    Public Property Name() As String
        Get
            Return nameField
        End Get
        Set(ByVal value As String)
            nameField = value
        End Set
    End Property
End Class
