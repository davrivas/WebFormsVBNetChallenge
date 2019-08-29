<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditProductType.aspx.vb" Inherits="WebFormsVBNetChallenge.EditProductType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-group">
        <asp:Label runat="server" ID="lblName" AssociatedControlID="txtName" Text="Name" />
        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
        <div class="row mt-1">
            <asp:Label runat="server" ID="lblNameValidation" CssClass="alert alert-danger" />
        </div>
    </div>

    <div class="row">
        <asp:Button ID="btnEdit" runat="server" Text="Edit product" CssClass="btn btn-warning mr-1" OnClick="BtnEdit_Click" />
        <asp:Button ID="btnGoBack" runat="server" Text="Go back" CssClass="btn btn-secondary" OnClick="btnGoBack_Click" />
    </div>
</asp:Content>
