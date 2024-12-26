<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Sport_management.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section id="contact" class="contact">
        <div class="container" data-aos="fade-up">
            <div class="section-title">
                <h2>Contact</h2>
                <p>Contact Us</p>
            </div>
        </div>
        <div data-aos="fade-up">
       <iframe style="border:0; width: 100%; height: 350px;" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3821.2477258596923!2d74.25239407477308!3d16.71448688406246!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc1005044caede9%3A0xcf5d63e76abee41e!2sBharati%20Vidyapeeth%20Institute%20of%20Management%20Kolhapur!5e0!3m2!1sen!2sin!4v1713495050611!5m2!1sen!2sin" width="600" height="450" style="border:0;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe> </div>
        <div class="container" data-aos="fade-up">
            <div class="row mt-5">
                <div class="col-lg-4">
                    <div class="info">
                        <div class="address">
                            <i class="bi bi-geo-alt"></i>
                            <h4>Location:</h4>
                            <p>Bharti Vidyapeeth Institute Of Management Kolhapur</p>
                        </div>
                        <div class="open-hours">
                            <i class="bi bi-clock"></i>
                            <h4>Open Office:</h4>
                            <p>
                                Monday-Saturday:<br>
                                11:00 AM - 5.00 PM
                            </p>
                        </div>
                        <div class="email">
                            <i class="bi bi-envelope"></i>
                            <h4>Email:</h4>
                            <p>bhartiVidya@email.com</p>
                        </div>
                        <div class="phone">
                            <i class="bi bi-phone"></i>
                            <h4>Call:</h4>
                            <p>+91 8180821173</p>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8 mt-5 mt-lg-0">
                    <div action="forms/contact.php" method="post" role="form" class="php-email-form">
                        <div class="row">
                            <div class="col-md-6 form-group">
                                <asp:TextBox runat="server" CssClass="form-control" ID="name" placeholder="Your Name"></asp:TextBox>
                            </div>
                            <div class="col-md-6 form-group mt-3 mt-md-0">
                                 <asp:TextBox runat="server" CssClass="form-control" ID="email" placeholder="Your Email"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group mt-3">
                             <asp:TextBox runat="server" CssClass="form-control" ID="subject" placeholder="Subject"></asp:TextBox>
                        </div>
                        <div class="form-group mt-3">
                            <asp:TextBox runat="server" CssClass="form-control" TextMode="MultiLine" Rows="8" ID="message" placeholder="Message"></asp:TextBox>
                        </div>
                        <div class="my-3">
                            <div class="loading">Loading</div>
                            <div class="error-message"></div>
                            <div class="sent-message">Your message has been sent. Thank you!</div>
                        </div>
                        <div class="text-center">
                            <asp:Button runat="server" OnClick="BTN_SUBMIT_Click" ID="BTN_SUBMIT" TEXT="Send Message" Style="background:#cda45e;border:0;padding: 10px 35px;color:#fff;transition:0.4s;border-radius:50px;" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
        </section>
</asp:Content>
