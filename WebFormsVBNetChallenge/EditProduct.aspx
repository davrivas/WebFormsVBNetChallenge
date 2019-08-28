<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="EditProduct.aspx.vb" Inherits="WebFormsVBNetChallenge.EditProduct" EnableEventValidation="false" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <label>Identifier</label>
                <asp:Label runat="server" ID="lblIdentifier" CssClass="form-control" />
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <label>Creation date</label>
                <asp:Label runat="server" ID="lblCreationDate" CssClass="form-control" />
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" ID="lblDescription" AssociatedControlID="txtDescription" Text="Description" />
                <asp:TextBox runat="server" ID="txtDescription" CssClass="form-control" />
                <div class="row mt-1">
                    <asp:Label runat="server" ID="lblDescriptionValidation" CssClass="alert alert-danger" />
                </div>
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" ID="lblPrice" AssociatedControlID="txtPrice" Text="Price" />
                <asp:TextBox runat="server" ID="txtPrice" CssClass="form-control" />
                <div class="row mt-1">
                    <asp:Label runat="server" ID="lblPriceValidation" CssClass="alert alert-danger" />
                </div>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" ID="lblProductType" AssociatedControlID="ddlProductType" Text="Product type" />
                <asp:DropDownList runat="server" ID="ddlProductType" CssClass="form-control" />
            </div>
        </div>
        <div class="col-md-6">
            <div class="form-group">
                <asp:Label runat="server" ID="lblProductStatus" AssociatedControlID="ddlProductStatus" Text="Product status" />
                <asp:DropDownList runat="server" ID="ddlProductStatus" CssClass="form-control" />
            </div>
        </div>
    </div>

    <div class="row">
        <asp:Button ID="btnEdit" runat="server" Text="Edit product" CssClass="btn btn-warning mr-1" OnClick="BtnEdit_Click" />
        <asp:Button ID="btnGoBack" runat="server" Text="Go back" CssClass="btn btn-secondary" OnClick="BtnGoBack_Click" />
    </div>
</asp:Content>
