<%@ Page Title="" Language="C#" MasterPageFile="~/Design.master" AutoEventWireup="true" CodeFile="result_stu.aspx.cs" Inherits="fonts_result_stu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <style>
        /* Styles for page heading */
        .heading {
            text-align: center;
            font-family: Arial, sans-serif;
            margin-top: 20px;
            font-weight:bold;
        }

        /* Styles for the glass container */
        .glass {
            margin: auto; /* Center the container horizontally */
            max-width: 100%; /* Set a maximum width for the container */
            overflow-x: auto; /* Add horizontal scrollbar if necessary */
            background-color: rgba(255, 255, 255, 0.2);; /* Semi-transparent white */
            backdrop-filter: blur(10px); /* Blur effect */
            border-radius: 10px; /* Rounded corners */
            padding: 20px; /* Add padding */
            box-sizing: border-box; /* Include padding and border in the width */
        }

        /* Styles for the GridView */
        .GridView1 {
            font-family: Arial, sans-serif;
            width: min-content; /* Set width to 100% to ensure it fills the container */
            table-layout: auto; /* Allow the table to adjust its width based on content */
            margin-top: 20px;
            border-collapse: collapse; /* Collapse border spacing */
        }

            .GridView1 th, .GridView1 td {
                border: 1px solid #dddddd;
                padding: 8px;
                text-align: left;
                white-space: nowrap; /* Prevent text wrapping in cells */
                font-weight: bold;
                font-size: 15px;
            }

            .GridView1 th {
                background-color: #007bff;
                color: white;
                text-align: center;
                font-weight: bold; /* Make column headers bold */
            }

            /* Add mouse effect while hovering over rows */
            .GridView1 tr:hover {
                background-color: #f5f5f5; /* Light gray background color */
                cursor: pointer; /* Change cursor to pointer on hover */
            }

        /* Background animation */
        body {
            background-image: url('../image/nehrubg.jpg'); /* Specify the path to your background image */
            background-size: cover; /* Cover the entire background */
            background-repeat: repeat; /* Repeat the background image only horizontally */
            animation: slide 20s linear infinite; /* Apply animation called "slide" */
        }

        .glass-container1 {
            width: 10%;
            margin: 0 auto;
            Bbackground:rgba(255, 255, 255, 0.2) ;
            border-radius: 15px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1), 0 1px 3px rgba(0, 0, 0, 0.08);
        }

        @keyframes slide {
            from {
                background-position: 0 0; /* Start position */
            }

            to {
                background-position: 100% 0; /* End position */
            }
        }

        /* Responsive adjustments */
        @media screen and (max-width: 768px) {
            .glass {
                overflow-x: auto; 
                width : auto;
            }

            .GridView1 th, .GridView1 td {
                white-space: normal;
                width:auto;
            }
            body {
    background-image: url('../image/nehrubg.jpg');
    background-size: cover; /* Cover the entire background */
    background-repeat: no-repeat; /* Prevent the background from repeating */
    animation: slide 20s linear infinite;
}

@keyframes slide {
    from {
        background-position: 0 0; /* Start position */
    }
    to {
        background-position: 100% 0; /* End position */
    }
}
        }
    </style>






    <style>
        .horizontal-scrollable-gridview {
            overflow-x: auto; /* Enable horizontal scrolling */
            white-space: nowrap; /* Prevents items from wrapping to the next line */
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <h1 class="heading">STUDENT DETAILS</h1>

    <div class="glass">


        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="GridView1">
            <Columns>
                <asp:TemplateField HeaderText="Name">
                    <ItemTemplate>
                        <%# Eval("firstname") %> <%# Eval("lastname") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="DOB">
                    <ItemTemplate>
                        <%# Eval("dateofbirth") %>
                    </ItemTemplate>
                </asp:TemplateField>

               
                <asp:TemplateField HeaderText="Course Name">
                    <ItemTemplate>
                        <%# Eval("coursename") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="School Name">
                    <ItemTemplate>
                        <%# Eval("schoolname") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Phone Number">
                    <ItemTemplate>
                        <%# Eval("phonenumber") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText=" Alter Phone Number">
                    <ItemTemplate>
                        <%# Eval("altphonenumber") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Email">
                    <ItemTemplate>
                        <%# Eval("email") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="State">
                    <ItemTemplate>
                        <%# Eval("state") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="District">
                    <ItemTemplate>
                        <%# Eval("district") %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Mark">
                    <ItemTemplate>
                        <%# Eval("mark") %>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
        </asp:GridView>

    </div>


    <div>
    </div>
</asp:Content>

