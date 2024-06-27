<%@ Page Title="" Language="C#" MasterPageFile="~/Design.master" AutoEventWireup="true" CodeFile="ViewAlterQuestions.aspx.cs" Inherits="ViewAlterQuestions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Question?");
        }
    </script>
    <style>
       
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
            <asp:DropDownList runat="server" ID="Course" AutoPostBack="true" CssClass="form-control" DataTextField="coursename" OnSelectedIndexChanged="Course_SelectedIndexChanged" DataValueField="transid" AppendDataBoundItems="true">
                <asp:ListItem Text="Select Programme" Value="" />


            </asp:DropDownList>
        </div>
        <br />
        <asp:Panel runat="server" ID="pnl_editqns" Visible="false" CssClass="panel-container" Width="50%">
            <br />
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Course">Programme:</asp:Label>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="Course" ForeColor="Red" SetFocusOnError="true"></asp:RequiredFieldValidator>
                <br>
                <asp:DropDownList runat="server" ID="ddlcourseedit" CssClass="form-control" DataTextField="coursename" DataValueField="transid" AppendDataBoundItems="true">
                    <asp:ListItem Text="Select Programme" Value="" />


                </asp:DropDownList>
            </div>
            <br />

            Question :
 <br />
            <asp:Label ID="lblqnsid" runat="server" Visible="false"></asp:Label>

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
            <br />
            <asp:Button ID="btn_updqns" runat="server" Text="Update Question" CssClass="btn btn-success" OnClick="btn_updqns_Click" />
        </asp:Panel>
        <br />
        <asp:GridView ID="gv_qns" runat="server" Visible="false" Width="100%" AutoGenerateColumns="false" OnRowCommand="gv_qns_RowCommand" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4">

            <Columns>
                <asp:TemplateField HeaderStyle-Width="3% ">
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
                        <asp:Label ID="lblqnsid" runat="server" Text='<%#Eval("transid") %>' Visible="false"></asp:Label>
                        <asp:Label ID="txtqns" runat="server" TextMode="MultiLine" Width="90%" ForeColor="Black" Text='<%#Eval("question") %>'></asp:Label><br />
                        <br />
                        Options :<br />
                        <asp:CheckBox runat="server" ID="a" Enabled='<%# (Eval("option1").ToString() == Eval("answer").ToString())?true:false %>' Checked='<%# (Eval("option1").ToString() == Eval("answer").ToString())?true:false %>' />
                        <asp:Label runat="server" ID="opt_a" Text='<%#Eval("option1") %>'></asp:Label>
                        <br />

                        <asp:CheckBox runat="server" ID="b" Enabled='<%# (Eval("option2").ToString() == Eval("answer").ToString())?true:false %>' Checked='<%# (Eval("option2").ToString() == Eval("answer").ToString())?true:false %>' />
                        <asp:Label runat="server" ID="opt_b" Text='<%#Eval("option2") %>'></asp:Label>
                        <br />

                        <asp:CheckBox runat="server" ID="c" Enabled='<%# (Eval("option3").ToString() == Eval("answer").ToString())?true:false %>' Checked='<%# (Eval("option3").ToString() == Eval("answer").ToString())?true:false %>' />
                        <asp:Label runat="server" ID="opt_c" Text='<%#Eval("option3") %>'></asp:Label>
                        <br />

                        <asp:CheckBox runat="server" ID="d" Enabled='<%# (Eval("option4").ToString() == Eval("answer").ToString())?true:false %>' Checked='<%# (Eval("option4").ToString() == Eval("answer").ToString())?true:false %>' />
                        <asp:Label runat="server" ID="opt_d" Text='<%#Eval("option4") %>'></asp:Label>
                        <br />

                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderStyle-Width="10% ">
                    <HeaderTemplate>
                        Action
                    </HeaderTemplate>
                    <ItemTemplate>

                        <center>
                            <asp:Button ID="Button1" runat="server" Text="Edit" CssClass=" btn btn-primary" CommandName="editqns" CommandArgument='<%#Container.DataItemIndex %>' />
                            <br />
                            <br />
                            <asp:Button ID="Button2" runat="server" Text="Delete" OnClientClick="return  confirmDelete()" CssClass="btn btn-danger" CommandName="delqns" CommandArgument='<%#Container.DataItemIndex %>' />
                        </center>
                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>
            <FooterStyle BackColor="#FFFFCC" ForeColor="#330099"></FooterStyle>

            <HeaderStyle CssClass="catchy-header" BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
            <PagerStyle HorizontalAlign="Center" BackColor="#FFFFCC" ForeColor="#330099"></PagerStyle>

            <RowStyle CssClass="catchy-ow" BackColor="White" ForeColor="#330099" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399"></SelectedRowStyle>

            <SortedAscendingCellStyle BackColor="#FEFCEB"></SortedAscendingCellStyle>

            <SortedAscendingHeaderStyle BackColor="#AF0101"></SortedAscendingHeaderStyle>

            <SortedDescendingCellStyle BackColor="#F6F0C0"></SortedDescendingCellStyle>

            <SortedDescendingHeaderStyle BackColor="#7E0000"></SortedDescendingHeaderStyle>
            <AlternatingRowStyle CssClass="catchy-alt-row" />
        </asp:GridView>
    </div>
</asp:Content>

