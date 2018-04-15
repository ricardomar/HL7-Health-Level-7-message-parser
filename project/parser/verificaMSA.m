function [mensagemStatus,erroTipo1,erroTipo2] = verificaMSA(segmentoMSA,sepComp,sepRep,carEsc,sepSubComp)

[campos,posicao]=extraiCampos(segmentoMSA);

mensagemStatus='';
erroTipo1=0;
erroTipo2=0;


if size(find(posicao==0),2)~=0
    if strcmp(campos(1,1),'MSA')==1
        if(size(find(posicao==1),2)~=0)
            if MSA_1(campos(1,find(posicao==1)))==1
                if(size(find(posicao==2),2)~=0)
                    if size(char(campos(1,find(posicao==2))),2)>20
                        mensagemStatus=strvcat(mensagemStatus,'MSA campo 2: Limite de caracteres excedido');
                        erroTipo1=1;
                    end                
                else
                    mensagemStatus=strvcat(mensagemStatus,'MSA campo 2: Campo Obrigat�rio');
                    erroTipo1=1;
                end
            else
                mensagemStatus=strvcat(mensagemStatus,'MSA campo 1: O valor do campo n�o � v�lido');
                erroTipo1=1;
            end        
        else
            mensagemStatus=strvcat(mensagemStatus,'MSA campo 1: Campo Obrigat�rio');
            erroTipo1=1;
        end
    else
        mensagemStatus=strvcat(mensagemStatus,'MSA ID n�o reconhecido');
        erroTipo1=1;
    end
else
    mensagemStatus=strvcat(mensagemStatus,'MSA ID ausente');
    erroTipo1=1;
end


if erroTipo1==0
    
    if(size(find(posicao==3),2)~=0)
        if size(char(campos(1,find(posicao==3))),2)>80
            mensagemStatus=strvcat(mensagemStatus,'MSA campo 3: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end    
    
    if(size(find(posicao==4),2)~=0)
        if size(char(campos(1,find(posicao==4))),2)>15
            mensagemStatus=strvcat(mensagemStatus,'MSA campo 4: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end    
    
    if(size(find(posicao==5),2)~=0)
        if MSA_5(campos(1,find(posicao==5)))==0
            mensagemStatus=strvcat(mensagemStatus,'MSA campo 5: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==6),2)~=0)
        if size(char(campos(1,find(posicao==6))),2)>100
            mensagemStatus=strvcat(mensagemStatus,'MSA campo 6: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end     
    
else
    
end
