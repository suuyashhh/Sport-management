<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINPNAL/Admin.Master" AutoEventWireup="true" CodeBehind="GroupAdmin.aspx.cs" Inherits="Sport_management.ADMINPNAL.GroupAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pagetitle">
        <h1>Menu</h1>
        <nav>
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="index.html">Registration</a></li>
                <li class="breadcrumb-item active">Group Event</li>
            </ol>
        </nav>
    </div>
     <div class="container">
        <div class="row">
            <div class="col-md-4 m-list"></div>
            <div class="col-md-4 m-list">
                <a class="yash" href="#">
                    <img decoding="async" src="../assets/img/Eventss.png" style="height: 280px!important" class="img-fluidd" alt=""><br />
                    Group Event</a>
            </div>
            <div class="col-md-4 m-list"></div>
        </div>
    </div>
    <section class="section">
        <div class="row">
            <div class="col-lg-3"></div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">ADD EVENT / Entry Fees</h5>

                        <!-- No Labels Form -->
                        <div class="row g-3">

                            <div class="col-md-8">
                                <asp:TextBox runat="server" ID="txtsport" CssClass="form-control" Style="border: 1px solid black" placeholder="ADD SPORT EVENT*"></asp:TextBox>
                            </div>
                            <div class="col-md-3">
                                <asp:TextBox runat="server" ID="txtfees" CssClass="form-control" TextMode="Number" Style="border: 1px solid black" placeholder="Entry Fees*"></asp:TextBox>
                            </div>

                            <div class="text-center">
                                <asp:Button runat="server" ID="btnnonveg" OnClick="btnnonveg_Click" OnClientClick="return valid()" CssClass="btn btn-success" Text="ADD" Style="margin-top: 10px" />
                            </div>
                        </div>
                        <!-- End No Labels Form -->

                    </div>
                </div>


            </div>

            <div class="col-lg-3"></div>
        </div>









        <div class="row">
            <div class="col-lg-12">

                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Registered</h5>


                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" OnRowEditing="gridv_RowEditing" OnRowCancelingEdit="gridv_RowCancelingEdit" OnRowUpdating="gridv_RowUpdating" OnRowDeleting="gridv_RowDeleting" CssClass="table " Style="text-align: center; margin-top: 90px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Sport Name:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblsport" Text='<%# Eval("Sport") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtsport" Text='<%# Eval("Sport") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fees:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblfees" Text='<%# Eval("Fees") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtfees" Text='<%# Eval("Fees") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>

                                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="190" />
                                </Columns>
                            </asp:GridView>
                        </div>




                    </div>
                </div>
            </div>
        </div>



    </section>

    <script>
        function valid() {
            var sport = document.getElementById('<%= this.txtsport.ClientID %>').value;
            var fees = document.getElementById('<%= this.txtfees.ClientID %>').value;


            if (sport == "" || fees == "") {
                swal("Please fill all details to proceed..!", "", "error");
                return false;
            }

            return true;
        }
    </script>




</asp:Content>
