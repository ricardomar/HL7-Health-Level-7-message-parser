function resultado=PID_8(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela001={'F','M','H','T','O','U'};

    if tamanho<=1 && sum(strcmp(campo,tabela001))==1 
        resultado=1;
    else
        resultado=0;
    end