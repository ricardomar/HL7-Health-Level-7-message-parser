function resultado=EVN_1(campo)
    campo=char(campo);
    tamanho=length(campo);
    tabela3={'A01'};

    if tamanho<=3 && sum(strcmp(campo,tabela3))==1
        resultado=1;
    else
        resultado=0;
    end