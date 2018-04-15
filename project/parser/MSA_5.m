function resultado=MSA_5(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela102={'D','F'};

    if tamanho<=1 && sum(strcmp(campo,tabela102))==1 
        resultado=1;

    else
        resultado=0;
    end