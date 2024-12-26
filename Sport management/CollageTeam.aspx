<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="CollageTeam.aspx.cs" Inherits="Sport_management.CollageTeam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .card {
            margin: 10px !important;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container py-5 my-5">
        <h1 class="headings">View Sport Team</h1>

        <div class="row jhg">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Individual Sports</h5>

                        <!-- No Labels Form -->
                        <div class="row g-3">
                            <div class="col-md-8">
                                <div id="Div1" runat="server">
                                    <asp:DropDownList ID="ddlindi" runat="server" AutoPostBack="False" DataTextField="Sport" DataValueField="Sport" Style="width: 300px; height: 40px; border: 1px solid #ccc;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Button runat="server" ID="btnGroup" CssClass="btn btn-success" OnClick="btnGroup_Click" Text="Search" />
                            </div>
                            <!-- End No Labels Form -->
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Group Sports </h5>
                        <!-- No Labels Form -->
                        <div class="row g-3">
                            <div class="col-md-8">
                                <div id="form1" runat="server">
                                    <asp:DropDownList ID="ddlSport" runat="server" AutoPostBack="False" DataTextField="Sport" DataValueField="Sport" Style="width: 300px; height: 40px; border: 1px solid #ccc;">
                                    </asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <asp:Button runat="server" ID="btn_ddlV" CssClass="btn btn-success" OnClick="btn_ddlV_Click" Text="Search" />
                            </div>
                            <!-- End No Labels Form -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <asp:Literal runat="server" ID="showfees"></asp:Literal>
        </div>
        <div class="row" style="margin-top: 100px;">
            <asp:Literal runat="server" ID="Sevent"></asp:Literal>
        </div>
    </div>
</asp:Content>
