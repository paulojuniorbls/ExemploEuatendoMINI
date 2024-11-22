unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, ApiEuAtendo, Vcl.StdCtrls, Vcl.ExtCtrls

  //uses necessarias

  ,Soap.EncdDecd,Vcl.Imaging.pngimage


  ;

type
  TForm9 = class(TForm)
    Image1: TImage;
    edtNomeInstancia: TEdit;
    edtSenha: TEdit;
    edtContato: TEdit;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    mensagem: TMemo;
    euAtendo: TApiEuAtendo;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    arquivo: TOpenDialog;
    procedure Button1Click(Sender: TObject);
    procedure euAtendoObterQrCode(Sender: TObject; const Base64QRCode: string);
    procedure Button2Click(Sender: TObject);
    procedure euAtendoCriarInstancia(Sender: TObject;
      const InstanceResponse: TInstanceResponse);
    procedure Button4Click(Sender: TObject);
    procedure euAtendoStatusInstancia(Sender: TObject;
      const InstanceStatus: TInstanceStatus);
    procedure Button5Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
  private
    procedure LoadBase64ToImage(const Base64: string; Image: TImage);
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;

implementation

{$R *.dfm}

procedure TForm9.Button1Click(Sender: TObject);
var
erro:String;
begin
  //passamos pro componente o nome q queremos dá a instancia, nao pode ter espacos nem caracter especial
  euatendo.NomeInstancia := edtNomeInstancia.Text;

  euAtendo.CriarInstancia(erro);

  if erro <> '' then
   showmessage('Troque o nome da instancia, pois essa ja existe')
   else
   begin
    euAtendo.StatusInstancia;
    euAtendo.ObterQrCode;
   end;
end;

procedure TForm9.Button2Click(Sender: TObject);
begin
euAtendo.EnviarMensagemDeTexto(edtContato.Text,mensagem.Lines.Text);
euatendo.EnviarMensagemDeTexto('559982385000','Estou testando a versao mini');
end;

procedure TForm9.Button3Click(Sender: TObject);
begin
  arquivo.Execute();

   if arquivo.FileName <> '' then
   begin
    euatendo.EnviarMensagemDeMidia('559982385000','','Estou testando a versao mini',arquivo.FileName);
    euatendo.EnviarMensagemDeMidia(edtContato.Text,'',mensagem.Lines.Text,arquivo.FileName);
   end;

end;

procedure TForm9.Button4Click(Sender: TObject);
begin
//passamos pro edit a informação pois usamos ela pra autenticar o componente
euatendo.NomeInstancia := edtNomeInstancia.Text;
euatendo.ChaveApi      := edtSenha.Text;

euAtendo.StatusInstancia;
end;

procedure TForm9.Button5Click(Sender: TObject);
begin
//passamos pro edit a informação pois usamos ela pra autenticar o componente
euatendo.NomeInstancia := edtNomeInstancia.Text;
euatendo.ChaveApi      := edtSenha.Text;

euAtendo.ObterQrCode;
end;

procedure TForm9.euAtendoCriarInstancia(Sender: TObject;
  const InstanceResponse: TInstanceResponse);
begin
  //coloca nos edit só pra visualizar mesmo
  edtNomeInstancia.Text := InstanceResponse.InstanceName;
  edtSenha.Text         := InstanceResponse.ApiKey;
  //passamos pro componente a senha gerada na criacao da instancia, nao pode perder.
  euAtendo.ChaveApi     := InstanceResponse.ApiKey;

end;

procedure TForm9.euAtendoObterQrCode(Sender: TObject;
  const Base64QRCode: string);
begin
LoadBase64ToImage(Base64QRCode,Image1);
end;

procedure TForm9.euAtendoStatusInstancia(Sender: TObject;
  const InstanceStatus: TInstanceStatus);
begin
  showmessage(InstanceStatus.State);
end;

procedure TForm9.LoadBase64ToImage(const Base64: string; Image: TImage);
var
  CleanedBase64: string;
  Input: TStringStream;
  Output: TMemoryStream;
  Img: TPNGImage;  // Para PNG
begin
  // Remover o prefixo da string Base64
  CleanedBase64 := Base64.Replace('data:image/png;base64,', '', [rfIgnoreCase]);

  Input := TStringStream.Create(CleanedBase64, TEncoding.ASCII);
  try
    Output := TMemoryStream.Create;
    try
      DecodeStream(Input, Output);
      Output.Position := 0;

      Img := TPNGImage.Create;  // Para PNG
      try
        Img.LoadFromStream(Output);
        Image.Picture.Assign(Img);
      finally
        Img.Free;
      end;

    finally
      Output.Free;
    end;
  finally
    Input.Free;
  end;
end;

end.
