<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="ViewScorbord.aspx.cs" Inherits="Sport_management.ViewScorbord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <div class="container py-5 my-5">
        <h1 class="headings">ScoreBoard</h1>

        <div class="row jhg">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Sport Name</h5>

                        <!-- No Labels Form -->
                        <div class="row g-3">

                            <div class="col-md-8">

                                <%--<asp:TextBox runat="server" ID="txtm" CssClass="form-control" Style="border: 1px solid black" placeholder="Food Name*"></asp:TextBox>
                                --%>
                                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="border: 1px solid black">Dropdown
                                </a>
                                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                    <a class="dropdown-item" href="#">Cricket</a>
                                    <a class="dropdown-item" href="#">footboll</a>
                                    <a class="dropdown-item" href="#">kabbadi</a>
                                    <a class="dropdown-item" href="#">running</a>
                                    <a class="dropdown-item" href="#">Chess</a>
                                </div>

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
