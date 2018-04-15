function resultado=PID_10(campo)

    campo=char(campo);

    tamanho=length(campo);
    tabela5={'I', 'A', 'P', 'B', 'W', 'H', 'O', 'U'};

    if tamanho<=1 && sum(strcmp(campo,tabela5))==1
        resultado=1;

    else
        resultado=0;
    end