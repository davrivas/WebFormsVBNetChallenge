<%@ Page Title="Products" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebFormsVBNetChallenge._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div>
        <asp:TextBox runat="server" ID="txtProductName" />
    </div>

    <asp:GridView runat="server" ID="productsTable" ItemType="WebFormsVBNetChallenge.Model.Product" DataKeyNames="Id">
        <Columns>
            <asp:DynamicField DataField="Identifier" />
            <asp:DynamicField DataField="Description" />
            <asp:DynamicField DataField="ProductTypeName" />
            <asp:DynamicField DataField="ProductStatus" />
        </Columns>
        <%--<asp:TableHeaderRow>
            <asp:TableHeaderCell>Identifier</asp:TableHeaderCell>
            <asp:TableHeaderCell>Description</asp:TableHeaderCell>
            <asp:TableHeaderCell>Product type</asp:TableHeaderCell>
            <asp:TableHeaderCell>Product status</asp:TableHeaderCell>
        </asp:TableHeaderRow>
       <asp:TableRow 
        <asp:Repeater runat="server" ID="ProductTypeRepeater" >
            <asp:TableRow></asp:TableRow>
        </asp:Repeater>--%>
    </asp:GridView>

    

</asp:Content>
