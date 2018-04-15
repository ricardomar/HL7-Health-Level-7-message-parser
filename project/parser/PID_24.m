function resultado=PID_24(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela136={'Y','N'};

    if tamanho<=2 && sum(strcmp(campo,tabela136))==1 
        resultado=1;

    else
        resultado=0;
    end