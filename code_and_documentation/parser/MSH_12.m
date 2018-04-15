function resultado=MSH_12(campo)
    campo=char(campo);
    
    tamanho=length(campo);

    tabela104={'2.0','2.0D','2.1','2.2','2.3','2.3.1'};

    if tamanho<=7 && sum(strcmp(campo,tabela104))==1
        resultado=1;

    else
        resultado=0;
    end
    
            