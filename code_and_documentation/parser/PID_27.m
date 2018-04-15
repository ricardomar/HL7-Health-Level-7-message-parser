function resultado=PID_27(campo)
    campo=char(campo);
    tamanho=length(campo);


    if tamanho<=60 
        resultado=1;

    else
        resultado=0;
    end