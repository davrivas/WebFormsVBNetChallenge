<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DeleteProduct.aspx.vb" Inherits="WebFormsVBNetChallenge.DeleteProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>Do you want to delete this product?"</h2>
    <div class="row">
        <asp:Button Text="Yes" runat="server" ID="btnDelete" CssClass="btn btn-danger mr-1" OnClick="BtnDelete_Click" />
        <asp:Button Text="No" runat="server" ID="btnGoBack" CssClass="btn btn-secondary" OnClick="btnGoBack_Click" />
    </div>
</asp:Content>
