<%@ Page Title="Product types" Language="vb" AutoEventWireup="false" MasterPageFile="~/Site.Master" CodeBehind="ProductTypes.aspx.vb" Inherits="WebFormsVBNetChallenge.ProductTypes" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="mb-3">
        <asp:Button ID="btnAdd" CssClass="btn btn-primary" runat="server" Text="Create product type" OnClick="BtnAdd_Click" />
    </div>

    <table class="table table-striped">
        <thead>
            <tr>
                <th>Name</th>
                <th>Edit</th>
                <th>Delete</th>
            </tr>
        </thead>
        <tbody>
            <asp:Repeater runat="server" ID="productTypesRepeater" ItemType="WebFormsVBNetChallenge.Model.ProductType">
                <ItemTemplate>
                    <tr>
                        <td><%# Eval("Name") %></td>
                        <td>
                            <asp:Button ID="btnEdit" CommandArgument='<%# Eval("Id") %>' Text="Edit" runat="server" CssClass="btn btn-warning" OnClick="BtnEdit_Click" />
                        </td>
                        <td>
                            <asp:Button ID="btnDelete" CommandArgument='<%# Eval("Id") %>' Text="Delete" runat="server" CssClass="btn btn-danger" OnClick="BtnDelete_Click" />
                        </td>
                    </tr>
                </ItemTemplate>
            </asp:Repeater>
        </tbody>
    </table>
</asp:Content>
