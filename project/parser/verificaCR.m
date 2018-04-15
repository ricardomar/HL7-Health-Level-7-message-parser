function resultado = verificaCR(segmentos)
    
    nSegmentos=size(segmentos,1);
    
    resultado=1;
    for i=1:nSegmentos
        posCR=strfind(segmentos(i,:),'<CR>');
        if size(posCR,1)==0
            resultado=0;
        end
    end
