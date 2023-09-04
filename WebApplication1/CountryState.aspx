<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CountryState.aspx.cs" Inherits="WebApplication1.CountryState" %>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
  <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" rel="stylesheet">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">  
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>  
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>  
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.16/css/dataTables.bootstrap4.min.css" />  
    <script src="https://cdn.datatables.net/1.10.16/js/jquery.dataTables.min.js"></script>  
    <script src="https://cdn.datatables.net/1.10.16/js/dataTables.bootstrap4.min.js"></script>  
    <style>  
        .carousel-inner img {  
            width: 100%;  
            height: 350px;  
        }  
    </style>   

  <style>
    body {font-family: "Lato", sans-serif}
    .mySlides {display: none}
    .dot {
      height: 15px;
      width: 15px;
      margin: 0 2px;
      background-color: #817e7e;
      border-radius: 50%;
      display: inline-block;
      transition: background-color 0.6s ease;
      cursor: pointer;

      /* Add the following styles for the registration form */
    #registrationPanel {
      border: 10px solid #ccc; /* Add grey border around the form */
      border-radius: 50px;
      padding: 20px;
      background-color: #f5f5f5;
      margin-bottom: 20px;
    }

    #registrationPanel h2 {
      text-align: center;
      margin-bottom: 20px;
      color: #333;
    }

    .form-group {
      margin-bottom: 20px;
    }

    .form-label {
      color: #333;
      font-weight: bold;
      display: block;
      margin-bottom: 5px;
    }

    .form-control {
      width: 100%;
      height: 40px;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 6px;
      outline: none;
    }

    .gender-options {
      margin-top: 10px;
    }

    .form-check-inline {
      margin-right: 20px;
    }

    .form-check-inline label {
      margin-right: 5px;
    }
  }
  </style>
</head>
<body>
  <form id="frm" runat="server">
  <!-- Navbar -->
  <div class="w3-top">
    <div class="w3-bar w3-black w3-card">
      <a class="w3-bar-item w3-button w3-padding-large w3-hide-medium w3-hide-large w3-right" href="javascript:void(0)" onclick="myFunction()" title="Toggle Navigation Menu"><i class="fa fa-bars"></i></a>
      <a href="#" class="w3-bar-item w3-button w3-padding-large">HOME</a>
      <a href="#band" class="w3-bar-item w3-button w3-padding-large w3-hide-small">MISSION</a>
      <a href="#contact" class="w3-bar-item w3-button w3-padding-large w3-hide-small">REGISTER</a>
    </div>
  </div>
  
  <!-- Navbar on small screens (remove the onclick attribute if you want the navbar to always show on top of the content when clicking on the links) -->
  <div id="navDemo" class="w3-bar-block w3-black w3-hide w3-hide-large w3-hide-medium w3-top" style="margin-top:46px">
    <a href="#band" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">MISSION</a>
    <a href="#contact" class="w3-bar-item w3-button w3-padding-large" onclick="myFunction()">REGISTER</a>
  </div>

    <!-- Page content ... -->
      <div id="myCarousel" class="carousel slide" data-ride="carousel">  
        <div class="carousel-inner" role="listbox">  
            <asp:Repeater ID="rptBannerImages" runat="server">  
                <ItemTemplate>  
                    <div class="carousel-item <%#GetActiveClass(Container.ItemIndex) %>">  
                        <img src="<%#Eval("ImgPath")%>" />  
                    </div>  
                </ItemTemplate>  
            </asp:Repeater>  
        </div>  
        <a class="carousel-control-prev" href="#myCarousel" data-slide="prev" role="button">  
            <span class="carousel-control-prev-icon"></span>  
        </a>  
        <a class="carousel-control-next" href="#myCarousel" data-slide="next" role="button">  
            <span class="carousel-control-next-icon"></span>  
        </a>  
    </div>  
      
    <!-- Mission Section -->
  <div class="w3-container w3-content w3-center w3-padding-64" style="max-width:800px" id="band">
    <div class="w3-row w3-padding-32">
      <section class="about" id="about">
        <div class="container">
          <h2 class="title">Our Mission</h2>
          <div class="row">
            <div class="col-md-6">
              <img src="4.jpg" alt="" style="width: 100%;">
            </div>
            <div class="col-md-6">
              <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum</p>
            </div>
          </div>
        </div>
      </section>
    </div>
  </div>

 <!-- The Contact Section -->
      <div class="w3-container w3-content w3-padding-64" style="max-width:800px" id="contact">
        <div class="w3-row w3-padding-32">
          <asp:Panel ID="registrationPanel" runat="server" CssClass="form-group">
            <h2 class="form-label">Registration Form</h2>
            <asp:Label ID="lblResult" runat="server"></asp:Label>
            <div class="form-group">
              <label for="txtFullName" class="form-label">Full Name</label>
              <asp:TextBox ID="txtFullName" runat="server" Class="form-control" placeholder="Enter Full name"></asp:TextBox>
            </div>
            <div class="form-group">
              <label for="txtBirthday" class="form-label">Birthday</label>
              <asp:TextBox ID="txtBirthday" runat="server" Class="form-control" placeholder="Enter Birthday"></asp:TextBox>
            </div>
            <div class="form-group">
              <label for="txtUsername" class="form-label">Username</label>
              <asp:TextBox ID="txtUsername" runat="server" Class="form-control" placeholder="Enter Username"></asp:TextBox>
            </div>
            <div class="form-group">
              <label for="txtPassword" class="form-label">Password</label>
              <asp:TextBox ID="txtPassword" runat="server" Class="form-control" placeholder="Enter Password" ></asp:TextBox>
            </div>
            <div class="form-group gender-options">
              <h5 class="form-label">Gender</h5>
                <asp:RadioButtonList ID="rbtGender" runat="server" RepeatDirection="Horizontal">

                        <asp:ListItem>Male</asp:ListItem>
                        <asp:ListItem>Female</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>

                </asp:RadioButtonList>
            </div>
            <div class="form-group">
              <label for="txtAddress" class="form-label">Address</label>
              <asp:TextBox ID="txtAddress" runat="server" Class="form-control" placeholder="Enter Address"></asp:TextBox>
            </div>
            <div class="row">
              <div class="col-md-6">
                <div class="form-group">
                  <label for="ddlCountry" class="form-label">Country</label>
                  <asp:DropDownList ID="ddlCountry" runat="server" Class="form-control" AutoPostBack="true" OnSelectedIndexChanged ="ddlCountry_SelectedIndexChanged">
                  </asp:DropDownList>
                </div>
              </div>
              <div class="col-md-6">
                <div class="form-group">
                  <label for="ddlState" class="form-label">State</label>
                  <asp:Panel ID="pnlState" runat="server">
                    <asp:DropDownList ID="ddlState" runat="server" Class="form-control">
                    </asp:DropDownList>
                  </asp:Panel>
                </div>
              </div>
            </div>
            <div class="row">
              <div class="col-md-12">
                 <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-submit btn-block" style="background-color: #666;" onmouseover="this.style.backgroundColor='#007bff';" onmouseout="this.style.backgroundColor='#666';" Onclick ="btnSubmit_Click" />
              </div>
            </div>
          </asp:Panel>
        </div>
      </div>

    <!-- JS for list -->
    <script>

        function showStateDropdown() {
            var countrySelect = document.getElementById("country-select");
            var stateDropdown = document.getElementById("state-dropdown");
            var indiaDropdown = document.getElementById("india-dropdown");

            var selectedCountry = countrySelect.value;
            if (selectedCountry === "US") {
                stateDropdown.style.display = "block";
                indiaDropdown.style.display = "none";
            } else if (selectedCountry === "IN") {
                stateDropdown.style.display = "none";
                indiaDropdown.style.display = "block";
            } else {
                stateDropdown.style.display = "none";
                indiaDropdown.style.display = "none";
            }
        }

        function plusSlides(n) {
            showSlides(slideIndex += n);
        }

        // Used to toggle the menu on small screens when clicking on the menu button
        function myFunction() {
          var x = document.getElementById("navDemo");
          if (x.className.indexOf("w3-show") == -1) {
              x.className += " w3-show";
          } else { 
              x.className = x.className.replace(" w3-show", "");
          }
        }

        // Function to handle password masking
        function maskPassword(inputElement) {
            var maskedPassword = '';
            for (var i = 0; i < inputElement.value.length; i++) {
                maskedPassword += '*';
            }
            inputElement.setAttribute('type', 'text');
            inputElement.value = maskedPassword;
        }

        // Function to revert password field to password type on focus out
        function unmaskPassword(inputElement) {
            inputElement.setAttribute('type', 'password');
        }
    </script>

    <!-- CSS for Style -->
    <style>
        body {
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
        }
        .container {
        position: relative;
        max-width: 700px;
        width: 100%;
        background: rgb(211,211,211);
        padding: 25px;
        border-radius: 8px;
        box-shadow: 0 0 15px rgba(0, 0, 0, 0.1);
        }
        .container header {
        font-size: 1.5rem;
        color: #333;
        font-weight: 500;
        text-align: center;
        }
        .container .form {
        margin-top: 30px;
        }
        .form .input-box {
        width: 100%;
        margin-top: 20px;
        }
        .input-box label {
        color: #333;
        }
        .form :where(.input-box input, .select-box) {
        position: relative;
        height: 50px;
        width: 100%;
        outline: none;
        font-size: 1rem;
        color: #707070;
        margin-top: 8px;
        border: 1px solid #ddd;
        border-radius: 6px;
        padding: 0 15px;
        }
        .input-box input:focus {
        box-shadow: 0 1px 0 rgba(0, 0, 0, 0.1);
        }
        .form .column {
        display: flex;
        column-gap: 15px;
        }
        .form .gender-box {
        margin-top: 20px;
        }
        .gender-box h3 {
        color: #333;
        font-size: 1rem;
        font-weight: 400;
        margin-bottom: 8px;
        }
        .form :where(.gender-option, .gender) {
        display: flex;
        align-items: center;
        column-gap: 50px;
        flex-wrap: wrap;
        }
        
        .form :where(.gender input, .gender label) {
        cursor: pointer;
        }
        .gender label {
        color: #707070;
        }
        .address :where(input, .select-box) {
        margin-top: 15px;
        }
        .select-box select {
        height: 100%;
        width: 100%;
        outline: none;
        border: none;
        color: #707070;
        font-size: 1rem;
        }
        .form button {
        height: 55px;
        width: 100%;
        color: #fff;
        font-size: 1rem;
        font-weight: 400;
        margin-top: 30px;
        border: none;
        cursor: pointer;
        transition: all 0.2s ease;
        background: rgb(10, 10, 10);
        }
        /*Responsive*/
        @media screen and (max-width: 500px) {
        .form .column {
            flex-wrap: wrap;
        }
        .form :where(.gender-option, .gender) {
            row-gap: 15px;
        }
        }
    </style>
    </form>
</body>
</html>