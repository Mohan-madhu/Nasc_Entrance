<%@ Page Title="" Language="C#" MasterPageFile="~/Design.master" AutoEventWireup="true" CodeFile="EntranceExam.aspx.cs" Inherits="EntranceExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <style>
        .countdown-panel {
            background-color: #f0f0f0;
            border: 1px solid #ccc;
            border-radius: 5px;
            padding: 20px;
            text-align: center;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
    <div class="container">

        <asp:Panel ID="pnl_instructions" runat="server">


            <asp:Button ID="btn_startexam" runat="server" Text="Start Exam" OnClick="btn_startexam_Click" />
        </asp:Panel>
        <asp:Panel ID="pnl_exam" runat="server" CssClass="panel-container">
            <div class="countdown-panel">



                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:Timer ID="CountdownTimer" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
                        <h2>Countdown Timer</h2>

                        <h1>Exam Timer</h1>
                        <p>
                            The exam will end in:
                  <asp:Label ID="TimerLabel" runat="server"></asp:Label>
                        </p>

                    </ContentTemplate>
                </asp:UpdatePanel>


            </div>

            <asp:Button ID="Button1" runat="server" Text="Start Exam" />









        </asp:Panel>
    </div>

</asp:Content>

