function resultado=MSH_11(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela103={'D','P','T'};

    if tamanho<=3 && sum(strcmp(campo,tabela103))==1 
        resultado=1;

    else
        resultado=0;
    end