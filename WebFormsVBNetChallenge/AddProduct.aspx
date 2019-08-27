﻿<%@ Page Title="Add Product" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="AddProduct.aspx.vb" Inherits="WebFormsVBNetChallenge.AddProduct" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="form-group">
        <asp:Label runat="server" ID="lblDescription" AssociatedControlID="txtDescription" Text="Description" />
        <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" />
        <div class="row mt-1">
            <asp:Label runat="server" ID="lblDescriptionValidation" CssClass="alert alert-danger" />
        </div>
    </div>

    <div class="form-group">
        <asp:Label runat="server" ID="lblPrice" AssociatedControlID="txtPrice" Text="Price" />
        <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" />
        <div class="row mt-1">
            <asp:Label runat="server" ID="lblPriceValidation" CssClass="alert alert-danger" />
        </div>
    </div>

    <div class="form-group">
        <asp:Label runat="server" ID="lblProductType" AssociatedControlID="ddlProductType" Text="Product type" />
        <asp:DropDownList runat="server" ID="ddlProductType" CssClass="form-control" />
    </div>

    <asp:Button ID="btnAdd" runat="server" Text="Add product" CssClass="btn btn-primary" OnClick="BtnAdd_Click" />
</asp:Content>
