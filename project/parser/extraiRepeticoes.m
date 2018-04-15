function repCampos=extraiRepeticoes(campo,sepRep)

    campo=char(campo);
    caracteres=size(campo,2);
    posInicio=1;
    
    repCampos=cell(1,0);
    contaCampos=1;
    
    if size(strfind(campo,sepRep),1)==0    
        repCampos(1,1)={campo};
    else    
        for i=1:caracteres
            if campo(i)==sepRep
            
                repCampos(1,contaCampos)={campo(1,posInicio:i-1)};
        
                posInicio=i+1;
                contaCampos=contaCampos+1;
            end
            if i==caracteres
                repCampos(1,contaCampos)={campo(1,posInicio:caracteres)};            
            end                    
        end
    end
    
    