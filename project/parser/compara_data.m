

function validade=compara_data(data1,data2)
     data1=char(data1);
     data2=char(data2);
    
    Ano_m=str2double(data1(1:4));
    Mes_m=str2double(data1(5:6));
    Dia_m=str2double(data1(7:8));
    Hora_m=str2double(data1(9:10));
    Minuto_m=str2double(data1(11:12));
    Segundo_m=str2double(data1(13:14));
    
    Ano_s=str2double(data2(1:4));
    Mes_s=str2double(data2(5:6));
    Dia_s=str2double(data2(7:8));
    Hora_s=str2double(data2(9:10));
    Minuto_s=str2double(data2(11:12));
    Segundo_s=str2double(data2(13:14));

   

    if Ano_m==Ano_s 
        if Mes_m==Mes_s
            if Dia_m==Dia_s
                if Hora_m==Hora_s
                    if Minuto_m==Minuto_s
                        if Segundo_m<=Segundo_s
                            validade=1;
                        else
                            validade=0;
                        end
                    elseif Minuto_m<Minuto_s
                        validade=1;
                    else
                        validade=0;
                    end
                elseif Hora_m<Hora_s
                    validade=1;
                else
                    validade=0;
                end
            elseif Dia_m<Dia_s
                validade=1;
            else
                validade=0;
            end
        elseif Mes_m<Mes_s
            validade=1;
        else 
            validade=0;
        end                                                
    elseif Ano_m<Ano_s
        validade=1;
    else
        validade=0;
    end

