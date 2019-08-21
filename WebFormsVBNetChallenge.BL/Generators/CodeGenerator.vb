Public Class CodeGenerator
    Private Const CODE_CHARACTERS As String = "abcdefghijklmnopqrstuvwxyz1234567890"
    Private Shared ReadOnly _charactersLength As Integer = CODE_CHARACTERS.Length
    Private Shared ReadOnly _random As Random = New Random()

    Public Shared Function GenerateCode() As String
        Dim code As String = String.Empty

        For i = 1 To 5
            Dim index As Integer = _random.Next(_charactersLength)
            code += CODE_CHARACTERS(index)
        Next

        Return code
    End Function
End Class
