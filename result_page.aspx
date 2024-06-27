<%@ Page Language="C#" AutoEventWireup="true" CodeFile="result_page.aspx.cs" Inherits="result_page" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        #GridView1 {
            font-family: Arial, sans-serif;
            border-collapse: collapse;
            width: 100%;
        }

        h1 {
            text-align: center;
            font-family: Arial, sans-serif;
            margin-top: 0px;
        }

        #GridView1 td {
            border: 1px solid #dddddd;
            padding: 8px;
            text-align: left;
        }

        #GridView1 th {
            background-color: #007bff;
            color: white;
            text-align: center;
        }

        /* Alternate row color */
        #GridView1 tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .glass-container {
            margin: 2px;
            max-height: auto;
            max-width: 1100px;
            overflow-y: auto;
            background-color: rgba(255, 255, 255, 0.5); /* Semi-transparent white */
            backdrop-filter: blur(10px); /* Blur effect */
            border-radius: 10px; /* Optional: Add rounded corners */
            padding: 20px; /* Optional: Add padding */
            display: flex;
            margin-left: auto;
            margin-right: auto;
        }

        

        /* Hover effect */
        #GridView1 tr:hover {
            background-color: #ddd;
        }

        @media screen and (max-width: 768px) {
            /* Adjustments for smaller screens */
            #GridView1 {
                font-size: 12px; /* Reduce font size */
            }

                #GridView1 th, #GridView1 td {
                    padding: 6px; /* Reduce padding */
                }
        }
    </style>

    <style>
        body {
            background-image: url('../image/nehrubg.jpg'); /* Specify the path to your background image */
            background-size: cover; /* Cover the entire background */
            background-repeat: repeat-x; /* Repeat the background image only horizontally */
            animation: slide 20s linear infinite; /* Apply animation called "slide" */
        }

        @keyframes slide {
            from {
                background-position: 0 0; /* Start position */
            }

            to {
                background-position: 100% 0; /* End position */
            }
        }
    </style>

    <title>Result page</title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="glass">
            <h1>STUDENT DETAILS</h1>

            <div class="glass-container">


                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="centered-grid">
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

                        <asp:TemplateField HeaderText="Course ID">
                            <ItemTemplate>
                                <%# Eval("courseid") %>
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

        </div>
    </form>
    <div>
    </div>
</body>


</html>
