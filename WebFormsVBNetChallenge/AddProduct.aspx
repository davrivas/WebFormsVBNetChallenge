<%@ Page Title="Add product" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddProduct.aspx.vb" Inherits="WebFormsVBNetChallenge.AddProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Add product</h2>

    <div class="form-group">
        <asp:Label runat="server" ID="lblDescription" Text="Description" />
        <asp:TextBox runat="server" ID="txtDescription" />
        <asp:Label runat="server" ID="lblDescriptionValidation" Text="" CssClass="alert alert-danger" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" ID="lblPrice" Text="Price" />
        <asp:TextBox runat="server" ID="txtPrice" />
        <asp:Label runat="server" ID="lblPriceValidation" Text="" CssClass="alert alert-danger" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" ID="lblProductType" Text="Product type" />
        <asp:ListBox runat="server" ID="lstProductType" />
        <asp:Label runat="server" ID="lblProductTypeValidation" Text="" CssClass="alert alert-danger" />
    </div>

    <asp:Button ID="btnAdd" runat="server" Text="Add product" CssClass="btn btn-primary" />
</asp:Content>
