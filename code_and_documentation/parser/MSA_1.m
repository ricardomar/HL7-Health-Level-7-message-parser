function resultado=MSA_1(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela8={'AA','AE','AR','CA','CE','CR'};

    if tamanho<=2 && sum(strcmp(campo,tabela8))==1 
        resultado=1;
    else
        resultado=0;
    end