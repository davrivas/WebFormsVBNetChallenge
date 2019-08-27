<%@ Page Title="Products" Language="VB" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.vb" Inherits="WebFormsVBNetChallenge._Default" EnableEventValidation="false" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="mb-3">
        <asp:Button ID="btnAdd" CssClass="btn btn-primary mb-2" runat="server" Text="Create product" OnClick="BtnAdd_Click" />

        <div class="row">
            <asp:TextBox runat="server" ID="txtProductName" CssClass="form-control mr-1" placeholder="Type identifier or description" />
            <asp:Button runat="server" ID="btnSearch" Text="Search for products" CssClass="btn btn-primary" OnClick="BtnSearch_Click" />
        </div>
    </div>

    <table class="table table-striped table-responsive">
        <thead>
            <tr>
                <th>Identifier</th>
                <th>Description</th>
                <th>Product type</th>
                <th>Product status</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <% If productsRepeater.Items.Count > 0 %>
            <asp:Repeater runat="server" ID="productsRepeater" ItemType="WebFormsVBNetChallenge.Model.Product">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Identifier") %></td>
                        <td><%# Eval("Description") %></td>
                        <td><%# Eval("ProductType.Name") %></td>
                        <td><%# Eval("ProductStatus") %></td>
                        <td>
                            <%--maybe pass the whole object--%>
                            <asp:Button ID="btnEdit" CommandArgument='<%# Eval("Id") %>' Text="Edit" runat="server" CssClass="btn btn-warning" OnClick="BtnEdit_Click" />
                        </td>
                        <td>
                            <%--maybe pass the whole object--%>
                            <asp:Button ID="btnDelete" CommandArgument='<%# Eval("Id") %>' Text="Delete" runat="server" CssClass="btn btn-danger" OnClick="BtnDelete_Click" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
            <% Else %>
            <tr>
                <td colspan="6">
                    <span class="text-center">
                        <em>There are no products to show</em>
                    </span>
                </td>
            </tr>
            <% End If %>
        </tbody>
    </table>
</asp:Content>
