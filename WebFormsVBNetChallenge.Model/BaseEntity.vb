Public MustInherit Class BaseEntity
    Private idField As Integer
    Public Property Id() As Integer
        Get
            Return idField
        End Get
        Set(ByVal value As Integer)
            idField = value
        End Set
    End Property
End Class
