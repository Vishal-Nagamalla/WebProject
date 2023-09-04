<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GridData.aspx.cs" Inherits="WebApplication1.GridData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>User Registration Data</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="6"
    OnRowEditing="GridView1_RowEditing" OnRowCommand="GridView1_RowCommand"
    DataKeyNames="UserId">
            <Columns>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button ID="btn_Edit" runat="server" Text="Edit" CommandName="Edit" CommandArgument="<%# ((GridViewRow) Container).RowIndex %>"/>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <a href='<%# "CountryState.aspx?UserId=" + Eval("UserId") %>'>Edit</a>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="UserId" HeaderText="ID" />
                <asp:TemplateField HeaderText="Full Name">
                    <ItemTemplate>
                        <asp:Label ID="lbl_FullName" runat="server" Text='<%# Eval("FullName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_FullName" runat="server" Text='<%# Bind("FullName") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Birthday">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Birthday" runat="server" Text='<%# Eval("Birthday") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Birthday" runat="server" Text='<%# Bind("Birthday") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Gender">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Gender" runat="server" Text='<%# Eval("Gender") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Gender" runat="server" Text='<%# Bind("Gender") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Address">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Address" runat="server" Text='<%# Eval("Address") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Address" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Country">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Country" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Country" runat="server" Text='<%# Bind("Country") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <asp:Label ID="lbl_State" runat="server" Text='<%# Eval("State") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_State" runat="server" Text='<%# Bind("State") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Username">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Username" runat="server" Text='<%# Eval("Username") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Username" runat="server" Text='<%# Bind("Username") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Password">
                    <ItemTemplate>
                        <asp:Label ID="lbl_Password" runat="server" Text='<%# Eval("Password") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txt_Password" runat="server" Text='<%# Bind("Password") %>'></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="#663300" ForeColor="#ffffff" />
            <RowStyle BackColor="#e7ceb6" />
        </asp:GridView>
    </form>
</body>
</html>
