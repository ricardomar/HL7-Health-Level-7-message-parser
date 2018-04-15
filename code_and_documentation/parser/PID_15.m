function resultado=PID_15(campo)
    campo=char(campo);
    tamanho=length(campo);

    tabela296={'ASE','AR','HY','BN','KM','CJD','YUH','ZH','HR','CS','NL','EN','PT','RO','RU','SM','SR','SK','SO','ES','TL','TH','TO','UK','UR','VI','YI','OTH'};

    if tamanho<=60 && sum(strcmp(campo,tabela296))==1 
        resultado=1;

    else
        resultado=0;
    end