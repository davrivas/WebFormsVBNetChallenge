<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DeleteProduct.aspx.vb" Inherits="WebFormsVBNetChallenge.DeleteProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2><asp:Label runat="server" ID="lblConfirmation" /></h2>
    <asp:Button Text="Delete" runat="server" ID="btnDelete" CssClass="btn btn-danger" OnClick="BtnDelete_Click" />
</asp:Content>
