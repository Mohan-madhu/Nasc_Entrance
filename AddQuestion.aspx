<%@ Page Title="Add Questions" Language="C#" MasterPageFile="~/Design.master" AutoEventWireup="true" CodeFile="AddQuestion.aspx.cs" Inherits="AddQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        /* Style for the container */
        .container {
            margin: 0 auto;
            padding: 20px;
            background-color: #f0f0f0;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }


        /* Style for the grid view */
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <center>
        <h1>ADD QUESTION</h1>
    </center>
    <div class="container">

        <br />
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Course">Programme:</asp:Label>
            <asp:RequiredFieldValidator ID="RequireddfhFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="Course" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
            <br>
            <asp:DropDownList runat="server" ID="Course" CssClass="form-control" DataTextField="coursename" DataValueField="transid" AppendDataBoundItems="true">
                <asp:ListItem Text="Select Programme" Value="" />


            </asp:DropDownList>
        </div>
        <br />
        <asp:GridView ID="gv_qns" runat="server" Width="100%" AutoGenerateColumns="false" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">

            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        S.No
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#Container.DataItemIndex +1  %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <HeaderTemplate>
                        Question
                    </HeaderTemplate>
                    <ItemTemplate>
                        Question :
                        <br />
                        <asp:TextBox ID="txtqns" runat="server" TextMode="MultiLine" Width="90%" CssClass="form-control"></asp:TextBox><br />
                        Options :<br />
                        <asp:CheckBox runat="server" ID="a" />
                        <asp:TextBox runat="server" ID="opt_a" CssClass="form-control"></asp:TextBox>
                        <br />

                        <asp:CheckBox runat="server" ID="b" />
                        <asp:TextBox runat="server" ID="opt_b" CssClass="form-control"></asp:TextBox>
                        <br />

                        <asp:CheckBox runat="server" ID="c" />
                        <asp:TextBox runat="server" ID="opt_c" CssClass="form-control"></asp:TextBox>
                        <br />

                        <asp:CheckBox runat="server" ID="d" />
                        <asp:TextBox runat="server" ID="opt_d" CssClass="form-control"></asp:TextBox>
                        <br />

                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

            <HeaderStyle CssClass="catchy-header" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

            <RowStyle CssClass="catchy-row" BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
            <AlternatingRowStyle CssClass="catchy-alt-row" />
        </asp:GridView>
    </div>

    <asp:Button ID="Button1" runat="server" Text="Add Questions" OnClick="Button1_Click" CssClass="btn btn-primary" />
</asp:Content>

