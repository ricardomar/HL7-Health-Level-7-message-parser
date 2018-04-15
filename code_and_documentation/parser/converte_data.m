function data_s=converte_data()


    Ano_s=num2str(year(now));
    Mes_s=month(now);
    Dia_s=day(now);
    Hora_s=hour(now);
    Minuto_s=minute(now);
    Segundo_s=second(now);
    
   
    if Mes_s<10
        Mes_s=horzcat('0',num2str(Mes_s));
    elseif Mes_s>=10
        Mes_s=num2str(Mes_s);
    end
    
     if Dia_s<10
        Dia_s=horzcat('0',num2str(Dia_s));
     elseif Mes_s>=10
        Dia_s=num2str(Dia_s);
     end
    if Hora_s<10
        Hora_s=horzcat('0',num2str(Hora_s));
    elseif Hora_s>=10
        Hora_s=num2str(Hora_s);
    end
    if Minuto_s<10
        Minuto_s=horzcat('0',num2str(Minuto_s));
    elseif Minuto_s>=10
        Minuto_s=num2str(Minuto_s);
    end
    if Segundo_s<10
        Segundo_s=horzcat('0',num2str(round(Segundo_s)));
    elseif Segundo_s>=10
        Segundo_s=num2str(round(Segundo_s));
    end
    
    data_s=horzcat(Ano_s,Mes_s,Dia_s,Hora_s,Minuto_s,Segundo_s);