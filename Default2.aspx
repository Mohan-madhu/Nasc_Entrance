<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default2.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Exam Timer</h1>
            <p>The exam will end in:
                <asp:Label ID="TimerLabel" runat="server"></asp:Label></p>
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <asp:Timer ID="CountdownTimer" runat="server" Interval="1000" OnTick="CountdownTimer_Tick"></asp:Timer>
        </div>
    </form>
</body>
</html>
