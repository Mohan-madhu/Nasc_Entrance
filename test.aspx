<%@ Page Title="" Language="C#" MasterPageFile="~/Design.master" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Student Results</title>
    <div>


        <asp:Timer ID="Timer1" runat="server" Interval="1000" OnTick="Timer1_Tick"></asp:Timer>
        <asp:Label ID="TimerLabel" runat="server" Text="00:00"></asp:Label>

    </div>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" runat="Server">
</asp:Content>

