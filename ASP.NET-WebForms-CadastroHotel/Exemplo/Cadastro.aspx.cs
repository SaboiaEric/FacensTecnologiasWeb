using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Exemplo
{
    public partial class Cadastro : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Application["Passagems"] == null)
                Application["Passagems"] = new List<Passagem>();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SalvarPassagem();
            PreencherGrid();
            //rpPassagems.DataSource = Passagems;
            //rpPassagems.DataBind();
        }

        private void PreencherGrid()
        {
            GridView1.DataSource = Application["Passagems"];
            GridView1.DataBind();
        }

        private void SalvarPassagem()
        {
            Passagem u = new Passagem();
            u.Id = (Application["Passagems"] as List<Passagem>).Count;
            u.Nome = txtNome.Text;
            u.Sobrenome = txtSobrenome.Text;
            u.Sexo = ddlSexo.SelectedValue;
            u.QuantidadeAcompanhantes = !string.IsNullOrEmpty(txtQtdAcompanhante.Text) ? Convert.ToInt32(txtQtdAcompanhante.Text) : 0;
            u.Classe = ddlClasseSocial.SelectedValue;
            for (int i = 0; i < chkAcessos.Items.Count; i++)
            {
                if (chkAcessos.Items[0].Enabled)
                    u.Wifi = true;
                if (chkAcessos.Items[1].Enabled)
                    u.ServicoQuarto = true; ;
                if (chkAcessos.Items[2].Enabled)
                    u.ArCondicionado = true; ;
            }
            (Application["Passagems"] as List<Passagem>).Add(u);
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            PreencherGrid();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            GridView1.EditIndex = -1;
            PreencherGrid();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            GridView1.EditIndex = -1;
            PreencherGrid();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            PreencherGrid();
        }
    }

    /// <summary>
    /// Classe utilizada no projeto
    /// </summary>
    public class Passagem
    {
        public int Id {get; set;}
        public string Nome{get; set;}

        public string Sobrenome { get; set; }

        public string Sexo { get; set; }

        public int QuantidadeAcompanhantes {get; set;}

        public string Classe { get; set; }

        public bool Wifi { get; set; }

        public bool ServicoQuarto { get; set; }

        public bool ArCondicionado { get; set; }
    }

}