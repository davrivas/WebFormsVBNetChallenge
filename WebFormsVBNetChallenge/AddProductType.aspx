<%@ Page Title="Add product type" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddProductType.aspx.vb" Inherits="WebFormsVBNetChallenge.AddProductType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-group">
        <asp:Label runat="server" ID="lblName" AssociatedControlID="txtName" Text="Name" />
        <asp:TextBox runat="server" ID="txtName" CssClass="form-control" />
        <div class="row mt-1">
            <asp:Label runat="server" ID="lblNameValidation" CssClass="alert alert-danger" />
        </div>
    </div>

    <div class="row">
        <asp:Button ID="btnAdd" runat="server" Text="Add product" CssClass="btn btn-primary mr-1" OnClick="BtnAdd_Click" />
        <asp:Button ID="btnGoBack" runat="server" Text="Go back" CssClass="btn btn-secondary" OnClick="BtnGoBack_Click" />
    </div>
</asp:Content>
