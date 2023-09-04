<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="bannerimagemaster.aspx.cs" Inherits="WebApplication1.bannerimagemaster" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Banner Image Master</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>  
            <h1>Image Upload</h1>  
            <asp:Table runat="server" >  
                <asp:TableRow>  
                    <asp:TableCell>Image Name</asp:TableCell>
                    <asp:TableCell><asp:TextBox runat="server" ID="TextBox1"></asp:TextBox></asp:TableCell>  
                </asp:TableRow>   
                <asp:TableRow>  
                    <asp:TableCell>Image Upload</asp:TableCell>
                    <asp:TableCell><asp:FileUpload ID="FileUpload1" runat="server" /></asp:TableCell>  
                </asp:TableRow>  
                <asp:TableRow>  
                    <asp:TableCell>Status</asp:TableCell>
                    <asp:TableCell>
                        <asp:DropDownList runat="server" ID="ddlStatus">
                            <asp:ListItem Text="Active" Value="1" />
                            <asp:ListItem Text="Inactive" Value="0" />
                        </asp:DropDownList>
                    </asp:TableCell>
                </asp:TableRow>
                <asp:TableRow>  
                    <asp:TableCell></asp:TableCell>
                    <asp:TableCell><asp:Button runat="server" ID="Button2" Text="SAVE DATA" OnClick="btnSave_Click" /></asp:TableCell>  
                </asp:TableRow>  
            </asp:Table>  
        </div>  
    </form>
</body>
</html>