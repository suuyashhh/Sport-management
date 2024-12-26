<%@ Page Title="" Language="C#" MasterPageFile="~/User.Master" AutoEventWireup="true" CodeBehind="Individual.aspx.cs" Inherits="Sport_management.Induvidual" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .form-control:disabled, .form-control:read-only {
            background-color: #21252C !important;
            opacity: 1;
        }

        .dd {
            width: 100%;
            height: 100%;
            background: transparent;
            border: none;
            outline: none;
            border: 2px solid rgba(225, 225, 225, .2);
            border-radius: 40px;
            font-size: 16px;
            color: white;
            padding: 20px 45px 20px 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <main>
        <div class="container">

            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-4 col-md-6 d-flex flex-column align-items-center justify-content-center">

                            <div class="d-flex justify-content-center py-4" style="margin-top: 100px">
                                <img src="images/BVDU-ed.png" class="navbar-brand" alt="CSMS" height="100" width="100" />

                            </div>
                            <!-- End Logo -->

                            <div class="card yashh mb-3" style="background-color: #21252C!important;">

                                <div class="card-body">

                                    <div>
                                        <h3 class=" text-center" style="color: white;">Induvidual Sport Registration</h3>
                                    </div>

                                    <div class="row g-3 needs-validation" novalidate="">

                                        <div class="col-12" style="margin-top: 40px">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtname" MaxLength="16" ToolTip="Maximum 16 Characters" placeholder="Enter Your Name" CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-user'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtemail" placeholder="Enter Your Email" CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-envelope'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box">
                                                <asp:TextBox runat="server" ID="txtcontact" placeholder="Enter Your Contact No." CssClass="form-control"></asp:TextBox>
                                                <i class='bx bxs-phone-call'></i>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box dd">
                                                <asp:DropDownList ID="ddlSport" runat="server" AutoPostBack="False" DataTextField="Sport" DataValueField="Sport"></asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box dd">
                                                <asp:DropDownList ID="ddlcourse" runat="server">
                                                    <asp:ListItem Text="BCA" Value="BCA" />
                                                    <asp:ListItem Text="BBA" Value="BBA" />
                                                    <asp:ListItem Text="MCA" Value="MCA" />
                                                    <asp:ListItem Text="MBA" Value="MBA" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box dd">
                                                <asp:DropDownList ID="ddlyear" runat="server">
                                                    <asp:ListItem Text="I" Value="I" />
                                                    <asp:ListItem Text="II" Value="II" />
                                                    <asp:ListItem Text="III" Value="III" />
                                                </asp:DropDownList>
                                            </div>
                                        </div>

                                        <div class="col-12">
                                            <div class="input-box" style="background-color: #21252C!important;">
                                                <asp:FileUpload runat="server" CssClass="form-control" ID="file" AllowMultiple="false" Style="height: auto" />
                                            </div>
                                        </div>



                                        <div class="col-12">
                                            <asp:Button runat="server" ID="btnbutton" OnClick="btnbutton_Click" class="btn" OnClientClick="return valid()" CssClass="btn btn-success w-100" Text="Register" />
                                        </div>
                                    </div>

                                </div>
                            </div>


                        </div>
                    </div>
                </div>

            </section>

        </div>
    </main>



    <script>
        function valid() {
            var name = document.getElementById('<%= this.txtname.ClientID %>').value;
           var email = document.getElementById('<%= this.txtemail.ClientID %>').value;
           var phone = document.getElementById('<%= this.txtcontact.ClientID %>').value;
           var ddlSport = document.getElementById('<%= this.ddlSport.ClientID %>');
           var fileUpload = document.getElementById('<%= this.file.ClientID %>');

            mobilecon = /^\d{10}$/;
            emailcon = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([com\co\.\in])+$/;

            if (name == "" || email == "" || phone == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }
            if (phone != '') {
                if (!phone.match(mobilecon)) {
                    swal("Please Enter Valid Contact Number", "", "warning");
                    return false;
                }
            }
            if (email != '') {
                if (!email.match(emailcon)) {
                    swal("Please Enter Valid Email-Id", "", "error");
                    return false;
                }
            }

            if (ddlSport.selectedIndex == 0) {
                swal("Please Select a Sport", "", "error");
                return false;
            }

            if (fileUpload.files.length === 0) {
                swal("Please Upload A Payment SS", "", "error");
                return false;
            }

            return true;
        }
    </script>



</asp:Content>
