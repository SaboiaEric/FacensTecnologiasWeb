<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cadastro.aspx.cs" Inherits="Exemplo.Cadastro" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    
    <%--CADASTRO NOME--%>
    <div>
        <asp:Label ID="lblNome" runat="server" Text="Nome: " />
        <asp:TextBox ID="txtNome" runat="server" />
        <asp:RequiredFieldValidator ID="rfvNome" runat="server" ControlToValidate="txtNome" ErrorMessage="*" />
    </div>
    <%--CADASTRO SOBRENOMNE--%>
    <div>
        <asp:Label ID="lblSobrenome" runat="server" Text="Sobrenome: " />
        <asp:TextBox ID="txtSobrenome" runat="server" />
        <asp:RequiredFieldValidator ID="rfvSobrenome" runat="server" ControlToValidate="txtSobrenome" ErrorMessage="*" />
    </div>

    <%--CADASTRO SEXO--%>
    <div>
        <asp:Label ID="lblSexo" runat="server" Text="Sexo: " />
        <asp:DropDownList ID="ddlSexo" runat="server">
            <asp:ListItem Value="" Text="Selecione" />
            <asp:ListItem Value="masculino" Text="Masculino" />
            <asp:ListItem Value="feminino" Text="Feminino" />
            <asp:ListItem Value="outros" Text="Outros" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvSexo" runat="server" ControlToValidate="ddlSexo" ErrorMessage="*" />
    </div>

        <%--CADASTRO QUANTIDADE DE ACOMPANHANTE--%>
    <div>
        <asp:Label ID="lblQtdAcompanhante" runat="server" Text="Quantidade de Acompanhantes: " CssClass="abc" />
        <asp:TextBox ID="txtQtdAcompanhante" runat="server" TextMode="Number" />
        <asp:RequiredFieldValidator ID="rfvQtdAcompanhante" runat="server" ControlToValidate="txtQtdAcompanhante" ErrorMessage="*" />
    </div>

    <%-- CADASTRO CLASSE SOCIAL --%>
    <div>
        <asp:Label ID="lblClasseSocial" runat="server" Text="Classe Social: " />
        <asp:DropDownList ID="ddlClasseSocial" runat="server">
            <asp:ListItem Value="" Text="Selecione" />
            <asp:ListItem Value="economica" Text="Economica" />
            <asp:ListItem Value="primeiraClasse" Text="Primeira Classe" />
            <asp:ListItem Value="Executiva" Text="Executiva" />
        </asp:DropDownList>
        <asp:RequiredFieldValidator ID="rfvClasseSocial" runat="server" ControlToValidate="ddlClasseSocial" ErrorMessage="*" />
    </div>

    <%-- CADASTRO ACESSORIOS --%>
    <div>
        <asp:Label ID="lblAcessos" runat="server" Text="Acessos: " />
        <asp:CheckBoxList ID="chkAcessos" runat="server">
            <asp:ListItem Value="wifi">Wi-Fi</asp:ListItem>
            <asp:ListItem Value="servicoQuatro">Servico de Quarto</asp:ListItem>
            <asp:ListItem Value="arCondicionado">Ar-Condicionado</asp:ListItem>
        </asp:CheckBoxList>
    </div>

    

    
    
    <div>
        <asp:Button ID="Button1" runat="server" Text="Salvar" OnClick="Button1_Click" />
    </div>
    <asp:GridView ID="GridView1" runat="server" 
                    AutoGenerateColumns="false" 
                    DataKeyNames="Id" 
                    OnRowCancelingEdit="GridView1_RowCancelingEdit"
                    OnRowDeleting="GridView1_RowDeleting"
                    OnRowUpdating="GridView1_RowUpdating"
                    OnRowEditing="GridView1_RowEditing">
        <Columns>
            <asp:TemplateField HeaderText="Id">
                <ItemTemplate><%# Container.DataItemIndex %></ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Nome">
                    <ItemTemplate>
                        <%# Eval("Nome") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtNome" runat="server" Text='<%# Eval("Nome") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sobrenome">
                    <ItemTemplate>
                        <%# Eval("Sobrenome") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtSobrenome" runat="server" Text='<%# Eval("Sobrenome") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Sexo">
                    <ItemTemplate>
                        <%# Eval("Sexo") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtSexo" runat="server" Text='<%# Eval("Sexo") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Quantidade de Acompanhantes">
                    <ItemTemplate>
                        <%# Eval("QuantidadeAcompanhantes") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtQtdAcompanhantes" TextMode="Number" runat="server" Text='<%# Eval("QuantidadeAcompanhantes") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Classe">
                    <ItemTemplate>
                        <%# Eval("Classe") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtClasse" runat="server" Text='<%# Eval("Classe") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>

            <asp:TemplateField HeaderText="Wi-Fi">
                    <ItemTemplate>
                        <%# Eval("Wifi") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtWifi" runat="server" Text='<%# Eval("Wifi") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Servico de Quarto">
                    <ItemTemplate>
                        <%# Eval("ServicoQuarto") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtServicoQuarto" runat="server" Text='<%# Eval("ServicoQuarto") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Ar Condicionado">
                    <ItemTemplate>
                        <%# Eval("ArCondicionado") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox  ID="txtArCondicionado" runat="server" Text='<%# Eval("ArCondicionado") %>'></asp:TextBox>
                    </EditItemTemplate>
            </asp:TemplateField>


            <asp:CommandField ShowEditButton="true" HeaderText="Editar" />
            <asp:CommandField ShowDeleteButton="true" HeaderText="Excluir" />
        </Columns>
    </asp:GridView>
</asp:Content>
