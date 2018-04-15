function resultado=PID_22(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela189={'H','NH','U'};

    if tamanho<=3 && sum(strcmp(campo,tabela189))==1 
        resultado=1;

    else
        resultado=0;
    end