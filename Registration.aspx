<%@ Page Title="Stduent Registration" Language="C#" MasterPageFile="~/Design.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        .cls_div {
            width: fit-content;
            margin: 50px auto;
            background-color: rgba(255, 255, 255, 0.7 ); /* Semi-transparent white */
             backdrop-filter: blur(10px);
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            justify-content: center;
            align-items: center;
        }

        .glasss {
            margin: 20px auto; /* Center the container horizontally */
            max-width: 90%; /* Set a maximum width for the container */
            overflow-x: auto; /* Add horizontal scrollbar if necessary */
           background-color: rgba(255, 255, 255, 0.5); /* Semi-transparent white */
            backdrop-filter: blur(10px); /* Blur effect */
            border-radius: 10px; /* Rounded corners */
            padding: 20px; /* Add padding */
            box-sizing: border-box; /* Include padding and border in the width */
        }

        input[type="text"], input[type="date"], input[type="tel"], select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        h2{
            font-weight:bold;
            font-size:40px;
        }
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

            input[type="submit"]:hover {
                background-color: #0056b3;
            }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="cls_div">
        <div class="glass">
            <center>
                <h2>Registration Form</h2>
            </center>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FirstName">First Name:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="FirstName" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="FirstName" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="LastName">Last Name:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidatfgor1" runat="server" ErrorMessage="*" ControlToValidate="LastName" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="LastName" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="DateOfBirth">Date of Birth:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldVfghalidator1" runat="server" ErrorMessage="*" ControlToValidate="DateOfBirth" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="DateOfBirth" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="SchoolName">School Name:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValihgjdator1" runat="server" ErrorMessage="*" ControlToValidate="SchoolName" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="SchoolName" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="PhoneNumber">Phone Number:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValgfhidator1" runat="server" ErrorMessage="*" ControlToValidate="PhoneNumber" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="PhoneNumber" CssClass="form-control" TextMode="Phone"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="AltPhoneNumber">Alternate Phone Number:</asp:Label><br>
                <asp:TextBox runat="server" ID="AltPhoneNumber" CssClass="form-control" TextMode="Phone"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email">Email:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFielddfgValidator1" runat="server" ErrorMessage="*" ControlToValidate="Email" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="State">State:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFiedfgldValidator1" runat="server" ErrorMessage="*" ControlToValidate="State" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="State" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="District">District:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFidfeldValidator1" runat="server" ErrorMessage="*" ControlToValidate="District" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:TextBox runat="server" ID="District" CssClass="form-control"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Course">Programme:</asp:Label>
                <asp:RequiredFieldValidator ID="RequireddfhFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="Course" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:DropDownList runat="server" ID="Course" CssClass="form-control" DataTextField="coursename" DataValueField="transid" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Programme" Value="" />


                </asp:DropDownList>
            </div>
            <br />
            <br />
            <asp:Button runat="server" ID="SubmitButton" Text="Register" OnClick="SubmitButton_Click" CssClass="btn btn-primary" />

        </div>

    </div>
</asp:Content>

