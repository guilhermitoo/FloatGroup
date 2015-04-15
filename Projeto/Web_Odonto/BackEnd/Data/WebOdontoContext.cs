using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.Linq;
using BackEnd.Entity;

namespace BackEnd.Data
{
    public class WebOdontoContext : DataContext
    {
        private string _sConexao { get; set; }

        private Table<Cidade> _tabelaCidade;
        private Table<Medicamento> _tabelaMedicamento;
        private Table<Convenio> _tabelaConvenio;
        private Table<Pessoa> _tabelaPessoa;

        public WebOdontoContext(string sConexao)
            : base(sConexao)
        {
            this._sConexao = sConexao;
        }

        public Table<Cidade> TabelaCidade 
        {
            get
            {
                if (_tabelaCidade == null)
                {
                    _tabelaCidade = this.GetTable<Cidade>();
                }
                return _tabelaCidade;
            }
            set
            {
                _tabelaCidade = value;
            }
        }

        public Table<Medicamento> TabelaMedicamento
        {
            get
            {
                if (_tabelaMedicamento == null)
                {
                    _tabelaMedicamento = this.GetTable<Medicamento>();
                }
                return _tabelaMedicamento;
            }
            set
            {
                _tabelaMedicamento = value;
            }
        }

        public Table<Convenio> TabelaConvenio
        {
            get
            {
                if (_tabelaConvenio == null)
                {
                    _tabelaConvenio = this.GetTable<Convenio>();
                }
                return _tabelaConvenio;
            }
            set
            {
                _tabelaConvenio = value;
            }
        }

        public Table<Pessoa> TabelaPessoa
        {
            get
            {
                if (_tabelaPessoa == null)
                {
                    _tabelaPessoa = this.GetTable<Pessoa>();
                }
                return _tabelaPessoa;
            }
            set
            {
                _tabelaPessoa = value;
            }
        }

    }
}
