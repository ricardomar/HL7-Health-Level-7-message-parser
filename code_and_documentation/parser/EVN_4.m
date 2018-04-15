function resultado=EVN_4(campo)
    campo=char(campo);

    tamanho=length(campo);

    tabela62={'01','02','03','04','05','06','07'};

    if tamanho<=3 && sum(strcmp(campo,tabela62))==1 
        resultado=1;

    else
        resultado=0;
    end