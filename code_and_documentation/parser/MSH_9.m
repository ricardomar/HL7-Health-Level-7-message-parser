function resultado=MSH_9(campo,separador)

    campo=char(campo);
    tamanho=length(campo);

    tabela76={'ADT','ACK'};
    tabela3={'A01'};

    if tamanho==7 && campo(1,4)==separador && sum(strcmp(campo(1,1:3),tabela76))==1 && sum(strcmp(campo(1,5:7),tabela3))==1
        resultado=1;

    else
        resultado=0;
    end
    
            