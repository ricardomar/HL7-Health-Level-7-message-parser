function resultado=PID_17(campo)
    campo=char(campo);
    tamanho=length(campo);
    tabela6={'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19',...
        '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31'};

    if tamanho<=3 && sum(strcmp(campo,tabela6))==1
        resultado=1;
    
    else
        resultado=0;
    end