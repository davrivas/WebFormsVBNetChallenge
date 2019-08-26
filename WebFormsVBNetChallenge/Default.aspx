<%@ Page Title="Products" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebFormsVBNetChallenge._Default" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="mb-3">
        <button class="btn btn-primary mb-2" data-toggle="modal" data-target="#addProductModal">
            Create product
        </button>

        <div class="row">
            <div class="col-6">
                <asp:TextBox runat="server" ID="txtProductName" CssClass="form-control" placeholder="Type identifier or description" />
            </div>
            <div class="col-6">
                <asp:Button runat="server" ID="btnSearch" Text="Search for products" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
            </div>
        </div>
    </div>

    <table class="table table-striped table-responsive">
        <asp:Repeater runat="server" ID="productsRepeater" ItemType="WebFormsVBNetChallenge.Model.Product">
            <HeaderTemplate>
                <tr>
                    <th>Identifier</th>
                    <th>Description</th>
                    <th>Product type</th>
                    <th>Product status</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>
            </HeaderTemplate>
            <ItemTemplate>
                <tr>
                    <td><%# Eval("Identifier") %></td>
                    <td><%# Eval("Description") %></td>
                    <td><%# Eval("ProductType.Name") %></td>
                    <td><%# Eval("ProductStatus") %></td>
                    <td>
                        <asp:Button ID="btnEdit" CommandArgument='<%# Eval("Id") %>' Text="Edit" runat="server" CssClass="btn btn-warning" OnClick="BtnEdit_Click" />
                    </td>
                    <td>
                        <asp:Button ID="btnDelete" CommandArgument='<%# Eval("Id") %>' Text="Delete" runat="server" CssClass="btn btn-danger" OnClick="BtnDelete_Click" />
                    </td>
                </tr>
            </ItemTemplate>
        </asp:Repeater>
    </table>
</asp:Content>
