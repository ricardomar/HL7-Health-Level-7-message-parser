function resultado=PID_16(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela002={'A','D','M','S','W'};

    if tamanho<=1 && sum(strcmp(campo,tabela002))==1 
        resultado=1;
    else
        resultado=0;
    end