<%@ Page Title="Add Product" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddProduct.aspx.vb" Inherits="WebFormsVBNetChallenge.AddProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-group">
        <asp:Label runat="server" ID="lblDescription" AssociatedControlID="txtDescription" Text="Description" />
        <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" />
        <asp:Label runat="server" ID="lblDescriptionValidation" Text="" CssClass="alert alert-danger" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" ID="lblPrice" AssociatedControlID="txtAddPrice" Text="Price" />
        <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" />
        <asp:Label runat="server" ID="lblPriceValidation" Text="" CssClass="alert alert-danger" />
    </div>

    <div class="form-group">
        <asp:Label runat="server" ID="lblProductType" AssociatedControlID="ddlAddProductType" Text="Product type" />
        <asp:DropDownList runat="server" ID="ddlAddProductType" CssClass="form-control" />
    </div>

    <asp:Button ID="btnAdd" runat="server" Text="Add product" CssClass="btn btn-primary" />
</asp:Content>
