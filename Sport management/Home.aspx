<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Sport_management.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    
    
    <div id="myCarousel" class="carousel slide d-block" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="first-slide" src="images/ban4.jpg" alt="First slide" />

                <div class="carousel-caption text-left">
                    <h1>Bharti Vidyapeeth College.</h1>
                    <p>Sports Management Portal</p>

                </div>
            </div>

            <div class="carousel-item">
                <img class="second-slide" src="images/ban2.jpg" alt="Second slide" />

                <div class="carousel-caption text-black-50">
                    <h1>Sports. Athelete.</h1>
                    <p>Automated Results</p>
                    <!--<p><a class="btn btn-lg btn-primary" href="#" role="button">Learn more</a></p>-->
                </div>
            </div>

            <div class="carousel-item">
                <img class="third-slide" src="images/ban3.jpg" alt="Third slide" />

                <div class="carousel-caption text-right">
                    <h1>Management Portal for college</h1>
                    <p>All sport activities included</p>
                    <%--<p><a class="btn btn-lg btn-primary" href="#" role="button">Browse gallery</a></p>--%>
                </div>
            </div>

        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>

</asp:Content>
