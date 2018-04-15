function [tipoMSG,sepComp,sepRep,carEsc,sepSubComp,mensagemStatus,erroTipo1,erroTipo2] = verificaMSH(segmentoMSH)



[campos,posicao]=extraiCampos(segmentoMSH);


temp='';

mensagemStatus='';
erroTipo1=0;
erroTipo2=0;

sepComp='';
sepRep='';
carEsc='';
sepSubComp='';
tipoMSG='';



if size(find(posicao==0),2)~=0    
    if strcmp(campos(1,1),'MSH')==1
        if(size(find(posicao==1),2)~=0)
            if MSH_2(campos(1,2))==1
                temp=char(campos(1,2));
                sepComp=temp(1,1);
                sepRep=temp(1,2);
                carEsc=temp(1,3);
                sepSubComp=temp(1,4);
                
                if(size(find(posicao==8),2)~=0)
                    if MSH_9(campos(1,find(posicao==8)),sepComp)==1
                        tipoMSG=char(campos(1,find(posicao==8)));                                                
                        if(size(find(posicao==9),2)~=0)
                            if size(char(campos(1,find(posicao==9))),2)<=20
                                if(size(find(posicao==10),2)~=0)
                                    if MSH_11(campos(1,find(posicao==10)))
                                        if(size(find(posicao==11),2)~=0)                                            
                                            if MSH_12(campos(1,find(posicao==11)))
                                                
                                            else                                                
                                                mensagemStatus=strvcat(mensagemStatus,'MSH campo 12: O valor do campo não é válido');
                                                erroTipo1=1;
                                            end                                            
                                        else
                                            mensagemStatus=strvcat(mensagemStatus,'MSH campo 12: Campo Obrigatório');
                                            erroTipo1=1;
                                        end
                                    else
                                        mensagemStatus=strvcat(mensagemStatus,'MSH campo 11: O valor do campo não é válido'); 
                                        erroTipo1=1;
                                    end                                    
                                else
                                    mensagemStatus=strvcat(mensagemStatus,'MSH campo 11: Campo Obrigatório'); 
                                    erroTipo1=1;
                                end                                
                            else
                                mensagemStatus=strvcat(mensagemStatus,'MSH campo 10: Limite de caracteres excedido');
                                erroTipo1=1;
                            end
                        else
                            mensagemStatus=strvcat(mensagemStatus,'MSH campo 10: Campo Obrigatório');
                            erroTipo1=1;
                        end
                    else
                        mensagemStatus=strvcat(mensagemStatus,'MSH campo 9: O valor do campo não é válido');
                        erroTipo1=1;
                    end
                else
                        mensagemStatus=strvcat(mensagemStatus,'MSH campo 9: Campo Obrigatório');
                        erroTipo1=1;
                end                
            else
                mensagemStatus=strvcat(mensagemStatus,'MSH campo 2: O valor do campo não é válido');
                erroTipo1=1;
            end
        else
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 2: Campo Obrigatório');
            erroTipo1=1;
        end
    else
        mensagemStatus=strvcat(mensagemStatus,'MSH ID não reconhecido');
        erroTipo1=1;
    end
else
    mensagemStatus=strvcat(mensagemStatus,'MSH ID ausente');
    erroTipo1=1;
end



if erroTipo1==0
    if(size(find(posicao==2),2)~=0)
        if size(char(campos(1,find(posicao==2))),2)>180
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 3: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==3),2)~=0)
        if size(char(campos(1,find(posicao==3))),2)>180
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 4: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==4),2)~=0)
        if size(char(campos(1,find(posicao==4))),2)>180
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 5: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==5),2)~=0)
        if size(char(campos(1,find(posicao==5))),2)>180
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 6: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end    

    if(size(find(posicao==6),2)~=0)
        if verificaData(campos(1,find(posicao==6)))==1            
            if compara_data(campos(1,find(posicao==6)),converte_data())==0;
                mensagemStatus=strvcat(mensagemStatus,'MSH campo 7: Data com estrutura correcta  Aviso- A data que introduziu é posterior à data actual!');
                erroTipo2=1;
            end                        
        else
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 7: Data com estrutura e/ou valores incorrectos.');
            erroTipo2=1;
        end        
    end
    
    if(size(find(posicao==7),2)~=0)
        if size(char(campos(1,find(posicao==7))),2)>40
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 8: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end    
    
    if(size(find(posicao==12),2)~=0)
        if size(char(campos(1,find(posicao==12))),2)>15
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 13: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==13),2)~=0)
        if size(char(campos(1,find(posicao==13))),2)>180
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 14: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end    

    if(size(find(posicao==14),2)~=0)
        if MSH_15(campos(1,find(posicao==14)))==0
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 15: O valor do campo não é válido');
            erroTipo2=1;
        end
    end    
    
    if(size(find(posicao==15),2)~=0)
        if MSH_16(campos(1,find(posicao==15)))==0
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 16: O valor do campo não é válido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==16),2)~=0)
        if size(char(campos(1,find(posicao==16))),2)>2
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 17: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==17),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==17)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>6
                temp2=1;    
            end            
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 18: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==18),2)~=0)
        if size(char(campos(1,find(posicao==18))),2)>60
            mensagemStatus=strvcat(mensagemStatus,'MSH campo 19: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
              
else
    
end



