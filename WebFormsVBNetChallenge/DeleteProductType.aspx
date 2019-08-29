<%@ Page Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="DeleteProductType.aspx.vb" Inherits="WebFormsVBNetChallenge.DeleteProductType" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h2>
        <asp:Label Text="Do you want to delete this product?" runat="server" ID="lblValidDelete" />
        <asp:Label runat="server" ID="lblInvalidDelete" />
    </h2>
    <div class="row">
        <asp:Button Text="Yes" runat="server" ID="btnDelete" CssClass="btn btn-danger mr-1" OnClick="BtnDelete_Click" />
        <asp:Button Text="No" runat="server" ID="btnGoBack" CssClass="btn btn-secondary" OnClick="btnGoBack_Click" />
    </div>
</asp:Content>
