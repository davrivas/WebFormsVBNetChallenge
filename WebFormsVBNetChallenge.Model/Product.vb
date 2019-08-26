Public Class Product
    Inherits BaseEntity

    Public Property Identifier() As String
    Public Property Description() As String
    Public Property ProductTypeId() As Integer
    Public Property ProductType() As ProductType
    Public Property Price() As Decimal
    Public Property CreationDate() As Date
    Public Property ProductStatus() As ProductStatus

End Class
