function varargout = parser_hl7(varargin)
% PARSER_HL7 M-file for parser_hl7.fig
%      PARSER_HL7, by itself, creates a new PARSER_HL7 or raises the existing
%      singleton*.
%
%      H = PARSER_HL7 returns the handle to a new PARSER_HL7 or the handle to
%      the existing singleton*.
%
%      PARSER_HL7('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PARSER_HL7.M with the given input arguments.
%
%      PARSER_HL7('Property','Value',...) creates a new PARSER_HL7 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before parser_hl7_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to parser_hl7_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help parser_hl7

% Last Modified by GUIDE v2.5 17-Nov-2007 10:34:45

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @parser_hl7_OpeningFcn, ...
                   'gui_OutputFcn',  @parser_hl7_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before parser_hl7 is made visible.
function parser_hl7_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to parser_hl7 (see VARARGIN)

% Choose default command line output for parser_hl7
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes parser_hl7 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = parser_hl7_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mensagem = get(handles.edit1,'String');
mensagem=upper(mensagem);



[segmentos,colunas]=size(mensagem);


mensagemErro='';

if segmentos >0 && colunas > 0
    
    if verificaCR(mensagem)==1
        
    [tipoMSG,sepComp,sepRep,carEsc,sepSubComp,mensagemStatus,erroTipo1,erroTipo2] = verificaMSH(mensagem(1,:));
    if erroTipo1 == 0
        
        if erroTipo2==1
            mensagemErro=strvcat(mensagemErro,mensagemStatus);
        end
        
        if strcmp(tipoMSG,'ADT^A01')==1
            if segmentos >= 4
                [mensagemStatus,erroTipo1,erroTipo2] = verificaEVN(mensagem(2,:),sepComp,sepRep,carEsc,sepSubComp);

                
                if erroTipo1==1
                    mensagemErro=strvcat(mensagemErro,mensagemStatus);
                else
                    if erroTipo2==1
                       mensagemErro=strvcat(mensagemErro,mensagemStatus);
                    end
                end
                
                 [mensagemStatus,erroTipo1,erroTipo2] = verificaPID(mensagem(3,:),sepComp,sepRep,carEsc,sepSubComp);
                
                 if erroTipo1==1
                     mensagemErro=strvcat(mensagemErro,mensagemStatus);
                 else
                     if erroTipo2==1
                         mensagemErro=strvcat(mensagemErro,mensagemStatus);
                     end
                 end
                 
                 [mensagemStatus,erroTipo1] = verificaPV1(mensagem(4,:));
                
                 if erroTipo1==1
                     mensagemErro=strvcat(mensagemErro,mensagemStatus);
                 end
                                  
                 if size(mensagemErro,2)~=0               
                     set(handles.edit2,'String',mensagemErro);
                 else
                     set(handles.edit2,'String','A mensagem não contém erros!' );
                 end

            else
                set(handles.edit2,'String','A mensagem ADT^A01 tem no mínimo 4 segmentos obrigatórios');
            end            
        elseif strcmp(tipoMSG,'ACK^A01')==1
            if segmentos >= 2
                [mensagemStatus,erroTipo1,erroTipo2] = verificaMSA(mensagem(2,:),sepComp,sepRep,carEsc,sepSubComp);
                
                if erroTipo1==1
                    mensagemErro=strvcat(mensagemErro,mensagemStatus);
                else
                    if erroTipo2==1
                        mensagemErro=strvcat(mensagemErro,mensagemStatus);
                    end
                end
                        
                 if size(mensagemErro,2)~=0               
                     set(handles.edit2,'String',mensagemErro);
                 else
                     set(handles.edit2,'String','A mensagem não contém erros!' );
                 end
                
            else
                set(handles.edit2,'String','A mensagem ACK^A01 tem no mínimo 2 segmentos obrigatórios');
            end
        end    
    else
        set(handles.edit2,'String',mensagemStatus);
    end
    
    else
        set(handles.edit2,'String','Um ou mais segmentos inseridos não contém o separador <CR>');
    end
        
else
    set(handles.edit2,'String','Insira a mensagem a validar');
end



