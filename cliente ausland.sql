

select *
FROM     PessoaFJ PessoaFJ_Cliente (nolock)
where CNPJ_CPF='09426032000128'

--INNER JOIN 
--         Clientes (nolock) ON Clientes.EmpPessoa = PessoaFJ_Cliente.Empresa
--AND      Clientes.FilPessoa = PessoaFJ_Cliente.Filial
--AND      Clientes.Cliente = PessoaFJ_Cliente.Pessoa

--INNER JOIN 
--         Empresas (nolock) ON Empresas.Empresa = PessoaFJ_Cliente.Empresa
--AND      Empresas.Filial = PessoaFJ_Cliente.Filial