function resultado=MSH_2(campo)
    
    campo=char(campo);
    tamanho = size(campo,2);
    
    if tamanho==4
        caracteres = {campo(1,1),campo(1,2),campo(1,3),campo(1,4)};
        if sum(strcmp('|',caracteres)) ~= 0
           resultado = 0;
        else
           if sum(strcmp(campo(1,1),caracteres)) > 1 || sum(strcmp(campo(1,2),caracteres))>1 || sum(strcmp(campo(1,3),caracteres))>1 || sum(strcmp(campo(1,4),caracteres))>1
               resultado = 0;
           else
               resultado =1;
           end
        end        
    else
        resultado = 0;
    end