Public Class Product
    Inherits BaseEntity
    Private identifierField As String
    Public Property Identifier() As String
        Get
            Return identifierField
        End Get
        Set(ByVal value As String)
            identifierField = value
        End Set
    End Property

    Private descriptionField As String
    Public Property Description() As String
        Get
            Return descriptionField
        End Get
        Set(ByVal value As String)
            descriptionField = value
        End Set
    End Property

    Private productTypeIdField As Integer
    Public Property ProductTypeId() As Integer
        Get
            Return productTypeIdField
        End Get
        Set(ByVal value As Integer)
            productTypeIdField = value
        End Set
    End Property

    Private productTypeField As ProductType
    Public Property ProductType() As ProductType
        Get
            Return productTypeField
        End Get
        Set(ByVal value As ProductType)
            productTypeField = value
        End Set
    End Property

    Private priceField As Decimal
    Public Property Price() As Decimal
        Get
            Return priceField
        End Get
        Set(ByVal value As Decimal)
            priceField = value
        End Set
    End Property

    Private creationDateField As Date
    Public Property CreationDate() As Date
        Get
            Return creationDateField
        End Get
        Set(ByVal value As Date)
            creationDateField = value
        End Set
    End Property

    Private productStatusField As ProductStatus
    Public Property ProductStatus() As ProductStatus
        Get
            Return productStatusField
        End Get
        Set(ByVal value As ProductStatus)
            productStatusField = value
        End Set
    End Property
End Class
