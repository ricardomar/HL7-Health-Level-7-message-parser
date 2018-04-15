function [mensagemStatus,erroTipo1,erroTipo2] = verificaEVN(segmentoEVN,sepComp,sepRep,carEsc,sepSubComp)

[campos,posicao]=extraiCampos(segmentoEVN);


mensagemStatus='';
erroTipo1=0;
erroTipo2=0;

if size(find(posicao==0),2)~=0    
    if strcmp(campos(1,1),'EVN')==1
        if(size(find(posicao==2),2)~=0)
            if verificaData(campos(1,find(posicao==2)))==1
                if compara_data(campos(1,find(posicao==2)),converte_data())==0;
                    mensagemStatus=strvcat(mensagemStatus,'EVN campo 2: Data com estrutura correcta  Aviso- A data que introduziu é posterior à data actual!');
                    erroTipo2=1;
                end                 
            else
                mensagemStatus=strvcat(mensagemStatus,'EVN campo 2: Data com estrutura e/ou valores incorrectos.');
                erroTipo1=1;
            end
        else
            mensagemStatus=strvcat(mensagemStatus,'EVN campo 2: Campo Obrigatório');
            erroTipo1=1;
        end        
    else
        mensagemStatus=strvcat(mensagemStatus,'EVN ID não reconhecido');
        erroTipo1=1;
    end
else
    mensagemStatus=strvcat(mensagemStatus,'EVN ID ausente');
    erroTipo1=1;
end


if erroTipo1==0
    if(size(find(posicao==1),2)~=0)
        if EVN_1(campos(1,find(posicao==1)))==0
            mensagemStatus=strvcat(mensagemStatus,'EVN campo 1: O valor do campo não é válido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==3),2)~=0)
        if verificaData(campos(1,find(posicao==3)))==1            
            if compara_data(campos(1,find(posicao==3)),converte_data())==0;
                mensagemStatus=strvcat(mensagemStatus,'EVN campo 3: Data com estrutura correcta  Aviso- A data que introduziu é posterior à data actual!');
                erroTipo2=1;
            end                        
        else
            mensagemStatus=strvcat(mensagemStatus,'EVN campo 3: Data com estrutura e/ou valores incorrectos.');
            erroTipo2=1;
        end        
    end

    if(size(find(posicao==4),2)~=0)
        if EVN_4(campos(1,find(posicao==4)))==0
            mensagemStatus=strvcat(mensagemStatus,'EVN campo 4: O valor do campo não é válido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==5),2)~=0)
        if size(char(campos(1,find(posicao==5))),2)>60
            mensagemStatus=strvcat(mensagemStatus,'EVN campo 5: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==6),2)~=0)
        if verificaData(campos(1,find(posicao==6)))==1            
            if compara_data(campos(1,find(posicao==6)),converte_data())==0;
                mensagemStatus=strvcat(mensagemStatus,'EVN campo 6: Data com estrutura correcta  Aviso- A data que introduziu é posterior à data actual!');
                erroTipo2=1;
            end                        
        else
            mensagemStatus=strvcat(mensagemStatus,'EVN campo 6: Data com estrutura e/ou valores incorrectos.');
            erroTipo2=1;
        end        
    end    
    
    

    
else

end
    