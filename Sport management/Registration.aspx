<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="Sport_management.Registration1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class="container py-5 my-5">
        <h1 class="headings">Sport Day Registration</h1>

        <div class="row jhg">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title" style="text-align:center" >Select Event</h5>

                        <!-- No Labels Form -->
                        <div class="row g-3">

                            <div class="col-md-8">

                                <asp:Button ID="induEvent" class="btn btn-outline-success my-2 my-sm-0" runat="server" OnClick="induEvent_Click1"  Text="Indivudual Event" style="margin-top: 20px;" />

                            </div>
                            <div class="col-md-4">

                                <asp:Button ID="GroupEvent" class="btn btn-outline-success my-2 my-sm-0" OnClick="GroupEvent_Click" runat="server"  Text="Group Event" style="margin-top: 20px;"  />
                               
                            </div>

                        </div>

                        <!-- End No Labels Form -->
                    </div>
                </div>


            </div>

            <div class="col-lg-3"></div>
        </div>


    </div>




</asp:Content>
