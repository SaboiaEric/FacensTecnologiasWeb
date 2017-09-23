using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace GridViewADONET
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindGridView();
            }
        }

        private string GetConnectionString()
        {
            return ConfigurationManager.ConnectionStrings["ConnectionStringCliente"].ConnectionString;
        }

        private void BindGridView()
        {

            DataTable dt = new DataTable();
            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                string sqlStatement = "SELECT * FROM clientes";
                using (SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection))
                {
                    SqlDataAdapter sqlDa = new SqlDataAdapter(sqlCmd);
                    sqlDa.Fill(dt);

                    gvCliente.DataSource = dt;
                    gvCliente.DataBind();
                }
            }
        }

        protected void btnSalvar_Click(object sender, EventArgs e)
        {
            string nome = txtNome.Text;

            string cpf = txtCPF.Text;

            string endereco = txtEndereco.Text;

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {
                //string sqlStatement = "INSERT INTO clientes(nome, cpf, endereco) values('" + nome + "', '" + cpf + "','" + endereco + "')";

                //http://www.andrealveslima.com.br/blog/index.php/2015/10/21/pare-de-concatenar-strings-nas-suas-sentencas-sql-utilize-parametros-do-ado-net/
                //https://stackoverflow.com/questions/681583/sql-injection-on-insert

                string sqlStatement = "INSERT INTO clientes(nome, cpf, endereco) values(@NOME,@CPF,@ENDERECO)";
                using (SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection))
                {

                    sqlCmd.Parameters.AddWithValue("@NOME", nome);
                    sqlCmd.Parameters.AddWithValue("@CPF", cpf);
                    sqlCmd.Parameters.AddWithValue("@ENDERECO", endereco);
                    connection.Open();

                    sqlCmd.ExecuteNonQuery();

                    connection.Close();
                }

            }

            BindGridView();
        }

        protected void OnRowEditing(object sender, GridViewEditEventArgs e)
        {

            BindGridView();
        }

        protected void OnRowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            int id = Convert.ToInt32(gvCliente.DataKeys[e.RowIndex].Value);
            GridViewRow gvr = gvCliente.Rows[e.RowIndex];

            string nome = (gvr.FindControl("txtNome") as TextBox).Text;
            string cpf = (gvr.FindControl("txtCPF") as TextBox).Text;
            string sqlStatement = "UPDATE clientes SET NOME = @newNome where cpf = @cpf";

            using (SqlConnection connection = new SqlConnection(GetConnectionString()))
            {

                //string sqlStatement = "INSERT INTO clientes(nome, cpf, endereco) values('" + nome + "', '" + cpf + "','" + endereco + "')";

                //http://www.andrealveslima.com.br/blog/index.php/2015/10/21/pare-de-concatenar-strings-nas-suas-sentencas-sql-utilize-parametros-do-ado-net/
                //https://stackoverflow.com/questions/681583/sql-injection-on-insert
                //http://www.c-sharpcorner.com/UploadFile/9f0ae2/gridview-edit-delete-and-update-in-Asp-Net/

                using (SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection))
                {

                    sqlCmd.Parameters.AddWithValue("@newNome", nome);
                    sqlCmd.Parameters.AddWithValue("@cpf", cpf);
                    connection.Open();

                    sqlCmd.ExecuteNonQuery();

                    connection.Close();
                }

            }

            gvCliente.EditIndex = -1;
            BindGridView();
        }

        protected void OnRowCancelingEdit(object sender, EventArgs e)
        {
            gvCliente.EditIndex = -1;
            BindGridView();
        }

        protected void OnRowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridViewRow row = (GridViewRow)gvCliente.Rows[e.RowIndex];
            Label lbldeleteid = (Label)row.FindControl("lblNome");
            string sqlStatement = "DELETE FROM clientes where nome = @nome";

            try
            {
                using (SqlConnection connection = new SqlConnection(GetConnectionString()))
                {

                    //string sqlStatement = "INSERT INTO clientes(nome, cpf, endereco) values('" + nome + "', '" + cpf + "','" + endereco + "')";

                    //http://www.andrealveslima.com.br/blog/index.php/2015/10/21/pare-de-concatenar-strings-nas-suas-sentencas-sql-utilize-parametros-do-ado-net/
                    //https://stackoverflow.com/questions/681583/sql-injection-on-insert
                    //http://www.c-sharpcorner.com/UploadFile/9f0ae2/gridview-edit-delete-and-update-in-Asp-Net/

                    using (SqlCommand sqlCmd = new SqlCommand(sqlStatement, connection))
                    {

                        sqlCmd.Parameters.AddWithValue("@NOME", lbldeleteid.Text);
                        connection.Open();

                        sqlCmd.ExecuteNonQuery();

                        connection.Close();
                    }

                }
            }
            catch (Exception ex)
            {
                string error = ex.Message;
            }


            BindGridView();
        }

        protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow && e.Row.RowIndex != gvCliente.EditIndex)
            {
                (e.Row.Cells[3].Controls[2] as LinkButton).Attributes["onclick"] = "return confirm('Do you want to delete this row?');";
            }
        }
    }
}
