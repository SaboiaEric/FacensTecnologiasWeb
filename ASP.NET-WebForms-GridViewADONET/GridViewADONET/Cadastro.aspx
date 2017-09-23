<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="GridViewADONET.Cadastro" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <asp:GridView ID="gvCliente" runat="server" AutoGenerateColumns="false" DataKeyNames="Id"
        OnRowDataBound="OnRowDataBound" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
        OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="No records has been added.">

        <Columns>

            <asp:TemplateField HeaderText="Nome" ItemStyle-Width="150">

                <ItemTemplate>

                    <asp:Label ID="lblNome" runat="server" Text='<%# Eval("Nome") %>'></asp:Label>

                </ItemTemplate>

                <EditItemTemplate>

                    <asp:TextBox ID="txtNome" runat="server" Text='<%# Eval("Nome") %>'></asp:TextBox>

                </EditItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="CPF" ItemStyle-Width="150">

                <ItemTemplate>

                    <asp:Label ID="lblCPF" runat="server" Text='<%# Eval("CPF") %>'></asp:Label>

                </ItemTemplate>

                <EditItemTemplate>

                    <asp:TextBox ID="txtCPF" runat="server" Text='<%# Eval("CPF") %>'></asp:TextBox>

                </EditItemTemplate>

            </asp:TemplateField>

            <asp:TemplateField HeaderText="Endereço" ItemStyle-Width="150">

                <ItemTemplate>

                    <asp:Label ID="lblEndereco" runat="server" Text='<%# Eval("Endereco") %>'></asp:Label>

                </ItemTemplate>

                <EditItemTemplate>

                    <asp:TextBox ID="txtEndereco" runat="server" Text='<%# Eval("Endereco") %>'></asp:TextBox>

                </EditItemTemplate>

            </asp:TemplateField>

            <asp:CommandField ButtonType="Link" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="150" />

        </Columns>

    </asp:GridView>

    <table border="1" cellpadding="0" cellspacing="0" style="border-collapse: collapse">

        <tr>

            <td style="width: 150px">Nome:<br />

                <asp:TextBox ID="txtNome" runat="server" Width="140" />

            </td>

            <td style="width: 150px">CPF:<br />

                <asp:TextBox ID="txtCPF" runat="server" Width="140" />

            </td>

            <td style="width: 150px">Endereco:<br />

                <asp:TextBox ID="txtEndereco" runat="server" Width="140" />

            </td>

            <td style="width: 100px">

                <asp:Button ID="btnSalvar" runat="server" Text="Salvar" OnClick="btnSalvar_Click" />

            </td>

        </tr>

    </table>

</asp:Content>
