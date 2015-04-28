using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using BackEnd.EntityData;
using System.Configuration;
using BackEnd.Model;

namespace FrontEnd
{
    // VERIFICAR ESSE CODIGO
    public class Util
    {
        public bool ValidaCNPJ(string sCnpj)
        { 
            // esse método recebe um cnpj em uma string, faz as verificações de validação e retorna um booleano
            // TRUE = o CNPJ é válido
            // FALSE = o CNPJ é inválido
            return true;            
            
            // MÉTODO NÃO IMPLEMENTADO AINDA
        }

        public void ExibirMensagem(string mensagem)
        {        
            //ClientScript.RegisterStartupScript(System.Type.GetType("System.String"), "Alert",
              // "<script language='javascript'> { window.alert(\"" + mensagem + "\") }</script>");
        }
    }
}
