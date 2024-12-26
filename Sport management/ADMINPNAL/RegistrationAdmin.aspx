<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINPNAL/Admin.Master" AutoEventWireup="true" CodeBehind="RegistrationAdmin.aspx.cs" Inherits="Sport_management.ADMINPNAL.Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container py-5 my-5">
        <h1 class="headings">Sport Day Registration</h1>
        <div class="row" style="margin-top: 100px">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Individual Events Registration</h5>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false" OnRowCommand="gridv_RowCommand" OnRowDeleting="gridv_RowDeleting1" CssClass="table " Style="text-align: center; margin-top: 90px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Event:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblevent" Text='<%# Eval("Event") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sport:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblsport" Text='<%# Eval("Sport") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Name:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblname" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Email:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblemail" Text='<%# Eval("email") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcont" Text='<%# Eval("contact") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Course:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcourse" Text='<%# Eval("course") %>'></asp:Label>
                                            <asp:Label runat="server" ID="lblyear" Text='<%# Eval("year") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Photo:">
                                        <ItemTemplate>
                                            <a href='<%# Eval("photos") %>' target="_blank">
                                                <img src='<%# Eval("photos") %>' alt="Image" style="width: 100px; height: 100px;" />
                                            </a>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button runat="server" CommandName="InsertData" CommandArgument='<%# Container.DataItemIndex %>' Text="Insert" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="true" ItemStyle-Width="190" />

                                </Columns>
                            </asp:GridView>
                        </div>
 </div>
                </div>
            </div>
        </div>
 <div class="row" style="margin-top: 100px">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Group Events Registration</h5>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="GridView1" DataKeyNames="srno" AutoGenerateColumns="false" OnRowCommand="GridView1_RowCommand" OnRowDeleting="GridView1_RowDeleting" CssClass="table " Style="text-align: center; margin-top: 90px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Event:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblevent" Text='<%# Eval("Event") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sport:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblsport" Text='<%# Eval("Sport") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Group Name:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblname" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblemail" Text='<%# Eval("email") %>'></asp:Label>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcont" Text='<%# Eval("contact") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>

                                    <asp:TemplateField HeaderText="Players:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblmsg" Text='<%# Eval("message") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Course:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcourse" Text='<%# Eval("course") %>'></asp:Label>
                                            <asp:Label runat="server" ID="lblyear" Text='<%# Eval("year") %>'></asp:Label>
                                        </ItemTemplate>

                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Photo:">
                                        <ItemTemplate>
                                            <a href='<%# Eval("photos") %>' target="_blank">
                                                <img src='<%# Eval("photos") %>' alt="Image" style="width: 100px; height: 100px;" />
                                            </a>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:Button runat="server" CommandName="InsertData" CommandArgument='<%# Container.DataItemIndex %>' Text="Insert" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" ShowDeleteButton="true" ItemStyle-Width="190" />
                                </Columns>
                            </asp:GridView>
                        </div>
 </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
