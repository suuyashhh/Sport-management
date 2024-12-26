<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINPNAL/Admin.Master" AutoEventWireup="true" CodeBehind="ContactAdmin.aspx.cs" Inherits="Sport_management.ADMINPNAL.ContactAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="pagetitle">
        <h1>Contact</h1>
    </div>
    <section class="section">
        <div class="row">
            <h1 class="fe-2" style="text-align: center!important;">Contact...!</h1>
        </div>
        <div class="row">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Registered</h5>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" OnRowEditing="gridv_RowEditing" OnRowCancelingEdit="gridv_RowCancelingEdit" OnRowUpdating="gridv_RowUpdating" OnRowDeleting="gridv_RowDeleting" CssClass="table " Style="text-align: center; margin-top: 90px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Name:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblname" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtname" Text='<%# Eval("name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblemail" Text='<%# Eval("email") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtemail" Text='<%# Eval("email") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcont" Text='<%# Eval("subject") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtsubject" Text='<%# Eval("subject") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Message:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblmsg" Text='<%# Eval("message") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtmessage" Text='<%# Eval("message") %>'></asp:TextBox>
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
</asp:Content>
