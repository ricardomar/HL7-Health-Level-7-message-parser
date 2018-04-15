function [mensagemStatus,erroTipo1,erroTipo2] = verificaPID(segmentoPID,sepComp,sepRep,carEsc,sepSubComp)

[campos,posicao]=extraiCampos(segmentoPID);


mensagemStatus='';
erroTipo1=0;
erroTipo2=0;


if size(find(posicao==0),2)~=0
    if strcmp(campos(1,1),'PID')==1
        if(size(find(posicao==3),2)~=0)
            temp1 = extraiRepeticoes(campos(1,find(posicao==3)),sepRep);
            temp2=1;
            for i=1:size(temp1,2)
                if size(char(temp1(1,i)),2)>20
                    temp2=0;
                end
            end
            if temp2 == 1                
                if(size(find(posicao==5),2)~=0)
                    temp1 = extraiRepeticoes(campos(1,find(posicao==5)),sepRep);
                    temp2=1;
                    for i=1:size(temp1,2)
                         if size(char(temp1(1,i)),2)>48
                             temp2=0;
                         end
                    end
                    if temp2 == 0
                        mensagemStatus=strvcat(mensagemStatus,'PID campo 5: Limite de caracteres excedido');
                        erroTipo1=1;
                    end
                else
                    mensagemStatus=strvcat(mensagemStatus,'PID campo 5: Campo Obrigat�rio');
                    erroTipo1=1;
                end                
            else
                mensagemStatus=strvcat(mensagemStatus,'PID campo 3: Limite de caracteres excedido');
                erroTipo1=1;
            end                                
        else
            mensagemStatus=strvcat(mensagemStatus,'PID campo 3: Campo Obrigat�rio');
            erroTipo1=1;
        end
    else
        mensagemStatus=strvcat(mensagemStatus,'PID ID n�o reconhecido');
        erroTipo1=1;
    end
else
    mensagemStatus=strvcat(mensagemStatus,'PID ID ausente');
    erroTipo1=1;
end

if erroTipo1==0

    if(size(find(posicao==1),2)~=0)
        if size(char(campos(1,find(posicao==1))),2)>4
            mensagemStatus=strvcat(mensagemStatus,'PID campo 1: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==2),2)~=0)
        if size(char(campos(1,find(posicao==2))),2)>20
            mensagemStatus=strvcat(mensagemStatus,'PID campo 2: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==4),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==4)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>20
                temp2=1;
            end
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'PID campo 4: Limite de caracteres excedido');        
            erroTipo2=1;
        end                        
    end

    if(size(find(posicao==6),2)~=0)
        if size(char(campos(1,find(posicao==6))),2)>48
            mensagemStatus=strvcat(mensagemStatus,'PID campo 6: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==7),2)~=0)
        if verificaData(campos(1,find(posicao==7)))==1            
            if compara_data(campos(1,find(posicao==7)),converte_data())==0;
                mensagemStatus=strvcat(mensagemStatus,'PIN campo 7: Data com estrutura correcta  Aviso- A data que introduziu � posterior � data actual!');
                erroTipo2=1;
            end                        
        else
            mensagemStatus=strvcat(mensagemStatus,'PIN campo 7: Data com estrutura e/ou valores incorrectos.');
            erroTipo2=1;
        end        
    end
    
    if(size(find(posicao==8),2)~=0)
        if PID_8(campos(1,find(posicao==8)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 8: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==9),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==9)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>48
                temp2=1;
            end
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'PID campo 9: Limite de caracteres excedido');        
            erroTipo2=1;
        end                                

    end    

    if(size(find(posicao==10),2)~=0)
        if PID_10(campos(1,find(posicao==10)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 10: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==11),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==11)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>106
                temp2=1;
            end
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'PID campo 11: Limite de caracteres excedido');        
            erroTipo2=1;
        end                                
        

    end    

    if(size(find(posicao==12),2)~=0)
        if size(char(campos(1,find(posicao==12))),2)>4
            mensagemStatus=strvcat(mensagemStatus,'PID campo 12: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==13),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==13)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>40
                temp2=1;
            end
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'PID campo 13: Limite de caracteres excedido');        
            erroTipo2=1;
        end  
    end    

    if(size(find(posicao==14),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==14)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>40
                temp2=1;
            end
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'PID campo 14: Limite de caracteres excedido');        
            erroTipo2=1;
        end  
    end    

    if(size(find(posicao==15),2)~=0)
        if PID_15(campos(1,find(posicao==15)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 15: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==16),2)~=0)
        if PID_16(campos(1,find(posicao==16)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 16: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==17),2)~=0)
        if PID_17(campos(1,find(posicao==17)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 17: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==18),2)~=0)
        if size(char(campos(1,find(posicao==18))),2)>20
            mensagemStatus=strvcat(mensagemStatus,'PID campo 18: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end    

    if(size(find(posicao==19),2)~=0)
        if size(char(campos(1,find(posicao==19))),2)>16
            mensagemStatus=strvcat(mensagemStatus,'PID campo 19: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end    

    if(size(find(posicao==20),2)~=0)
        if size(char(campos(1,find(posicao==20))),2)>25
            mensagemStatus=strvcat(mensagemStatus,'PID campo 20: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==21),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==21)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>20
                temp2=1;
            end
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'PID campo 21: Limite de caracteres excedido');        
            erroTipo2=1;
        end  
    end    
    
    if(size(find(posicao==22),2)~=0)
        if PID_22(campos(1,find(posicao==22)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 22: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end

    if(size(find(posicao==23),2)~=0)
        if size(char(campos(1,find(posicao==23))),2)>60
            mensagemStatus=strvcat(mensagemStatus,'PID campo 23: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end 
    
    if(size(find(posicao==24),2)~=0)
        if PID_24(campos(1,find(posicao==24)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 24: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==25),2)~=0)
        if size(char(campos(1,find(posicao==25))),2)>2
            mensagemStatus=strvcat(mensagemStatus,'PID campo 25: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end 

    if(size(find(posicao==26),2)~=0)
        temp1=extraiRepeticoes(campos(1,find(posicao==26)),sepRep);
        temp2=0;
        for i=1:size(temp1,2)
            if size(char(temp1(1,i)),2)>4
                temp2=1;
            end
        end
        if temp2 == 1
            mensagemStatus=strvcat(mensagemStatus,'PID campo 26: Limite de caracteres excedido');        
            erroTipo2=1;
        end  
   
    end
    
    if(size(find(posicao==27),2)~=0)                
        if PID_27(campos(1,find(posicao==27)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 27: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end 
    
    if(size(find(posicao==28),2)~=0)
        if size(char(campos(1,find(posicao==28))),2)>80
            mensagemStatus=strvcat(mensagemStatus,'PID campo 28: Limite de caracteres excedido');
            erroTipo2=1;
        end
    end
    
    if(size(find(posicao==29),2)~=0)
        if verificaData(campos(1,find(posicao==29)))==1            
            if compara_data(campos(1,find(posicao==29)),converte_data())==0;
                mensagemStatus=strvcat(mensagemStatus,'PIN campo 29: Data com estrutura correcta  Aviso- A data que introduziu � posterior � data actual!');
                erroTipo2=1;
            end                        
        else
            mensagemStatus=strvcat(mensagemStatus,'PIN campo 29: Data com estrutura e/ou valores incorrectos.');
            erroTipo2=1;
        end        
    end
    
    if(size(find(posicao==30),2)~=0)
        if PID_30(campos(1,find(posicao==30)))==0
            mensagemStatus=strvcat(mensagemStatus,'PID campo 30: O valor do campo n�o � v�lido');
            erroTipo2=1;
        end
    end     
    
    
    
else
    
end