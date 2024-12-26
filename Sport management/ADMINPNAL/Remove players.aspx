<%@ Page Title="" Language="C#" MasterPageFile="~/ADMINPNAL/Admin.Master" AutoEventWireup="true" CodeBehind="Remove players.aspx.cs" Inherits="Sport_management.ADMINPNAL.Remove_players" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
       <div class="container py-5 my-5">
        <h1 class="headings">View Sport Team</h1>
        <div class="row jhg">
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Individual Sports</h5>
                        <div class="row g-3">
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlindi" runat="server" AutoPostBack="False" DataTextField="Sport" DataValueField="srno" Style="width: 300px; height: 40px; border: 1px solid #ccc;">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <asp:Button runat="server" ID="btn_ddlV" CssClass="btn btn-success" OnClick="btn_ddlV_Click" Text="Search" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6">
                <div class="card">
                    <div class="card-body">
                        <h5 class="card-title">Group Sports</h5>
                        <div class="row g-3">
                            <div class="col-md-8">
                                <asp:DropDownList ID="ddlSport" runat="server" AutoPostBack="False" DataTextField="Sport" DataValueField="srno" Style="width: 300px; height: 40px; border: 1px solid #ccc;">
                                </asp:DropDownList>
                            </div>
                            <div class="col-md-4">
                                <asp:Button runat="server" ID="btnGroup" CssClass="btn btn-success" OnClick="btnGroup_Click" Text="Search" />

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="margin-top: 100px">
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-tital">Individual</div>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="gridv" DataKeyNames="srno" AutoGenerateColumns="false"
                                OnRowEditing="gridv_RowEditing" OnRowCancelingEdit="gridv_RowCancelingEdit"
                                OnRowUpdating="gridv_RowUpdating" OnRowDeleting="gridv_RowDeleting"
                                CssClass="table" Style="text-align: center; margin-top: 90px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Name:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblname" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtname" Text='<%# Eval("name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sport:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblsport" Text='<%# Eval("Sport") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtsport" Text='<%# Eval("Sport") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcont" Text='<%# Eval("contact") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtcont" Text='<%# Eval("contact") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Course:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcourse" Text='<%# Eval("course") %>'></asp:Label>
                                            <asp:Label runat="server" ID="lblyear" Text='<%# Eval("year") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtcourse" Text='<%# Eval("course") %>'></asp:TextBox>
                                            <asp:TextBox runat="server" ID="txtyear" Text='<%# Eval("year") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true" ItemStyle-Width="190" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-12">
                <div class="card">
                    <div class="card-body">
                        <div class="card-tital">Group</div>
                        <div class="table-responsive">
                            <asp:GridView runat="server" ID="GridGroup" DataKeyNames="srno" AutoGenerateColumns="false"
                                OnRowEditing="GridGroup_RowEditing" OnRowCancelingEdit="GridGroup_RowCancelingEdit"
                                OnRowUpdating="GridGroup_RowUpdating" OnRowDeleting="GridGroup_RowDeleting"
                                CssClass="table" Style="text-align: center; margin-top: 90px">
                                <Columns>
                                    <asp:TemplateField HeaderText="Name:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblname" Text='<%# Eval("name") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtname" Text='<%# Eval("name") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Sport:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblsport" Text='<%# Eval("Sport") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtsport" Text='<%# Eval("Sport") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Contact:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcont" Text='<%# Eval("contact") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtcont" Text='<%# Eval("contact") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Course:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblcourse" Text='<%# Eval("course") %>'></asp:Label>
                                            <asp:Label runat="server" ID="lblyear" Text='<%# Eval("year") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtcourse" Text='<%# Eval("course") %>'></asp:TextBox>
                                            <asp:TextBox runat="server" ID="txtyear" Text='<%# Eval("year") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Players:">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lblmsg" Text='<%# Eval("message") %>'></asp:Label>
                                        </ItemTemplate>
                                        <EditItemTemplate>
                                            <asp:TextBox runat="server" ID="txtmsg" Text='<%# Eval("message") %>'></asp:TextBox>
                                        </EditItemTemplate>
                                    </asp:TemplateField>
                                    <asp:CommandField ButtonType="Button" ShowEditButton="true" ShowDeleteButton="true"
                                        ItemStyle-Width="190" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
