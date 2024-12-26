<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Sport_management.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container" style="margin-top: 100px;">

        <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
            <div class="container">
                <div class="row justify-content-center">
                    <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                        
                        <!-- End Logo -->

                        <div class="card yashh mb-3" style="background-color: #21252C;">

                            <div class="card-body">

                                <div>
                                    <h1 class=" text-center" style="color: white;">Login</h1>
                                </div>

                                <div class="row g-3 needs-validation" novalidate="">

                                    <div class="col-12 shr">
                                        <div class="input-box">
                                            <asp:TextBox runat="server" ID="txtcontact" placeholder="PRN_ID No." CssClass="form-control"></asp:TextBox>

                                        </div>
                                    </div>

                                    <div class="col-12 shr">
                                        <div class="input-box">
                                            <asp:TextBox runat="server" ID="txtpass" placeholder="Password" CssClass="form-control"></asp:TextBox>
                                            <i class='bx bxs-lock-alt'></i>
                                        </div>
                                    </div>

                                    <div class="col-12 shr">
                                        <asp:Button runat="server" OnClientClick="return valid()" ID="btnbutton" class="btn" OnClick="btnbutton_Click" CssClass="btn btn-success w-100" Text="Login" />
                                    </div>
                                   
                                </div>

                            </div>
                        </div>


                    </div>
                </div>
            </div>

        </section>

    </div>

    <script>
        function valid() {
            var phone = document.getElementById('<%= this.txtcontact.ClientID %>').value;
        var pass = document.getElementById('<%= this.txtpass.ClientID %>').value;


            if (phone == "" || pass == "" || ) {
                swal("Please fill Login details..!", "", "error");
                return false;
            }

            return true;
        }
    </script>


</asp:Content>
