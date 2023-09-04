<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditUserData.aspx.cs" Inherits="WebApplication1.EditUserData" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit User Data</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Label ID="lblStatus" runat="server" ForeColor="Red"></asp:Label>
    </form>
    <script>
        // Retrieve the UserID from the URL and redirect to CountryState.aspx with the UserID as a query parameter
        var urlParams = new URLSearchParams(window.location.search);
        var userId = urlParams.get('UserId');
        window.location.href = 'CountryState.aspx?UserId=' + userId;
    </script>
</body>
</html>
