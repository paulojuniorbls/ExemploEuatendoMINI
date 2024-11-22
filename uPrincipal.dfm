object Form9: TForm9
  Left = 0
  Top = 0
  Caption = 'Mini Exemplo componente EuAtendo'
  ClientHeight = 352
  ClientWidth = 399
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object Image1: TImage
    Left = 199
    Top = 119
    Width = 194
    Height = 179
    Proportional = True
  end
  object Label1: TLabel
    Left = 8
    Top = 9
    Width = 99
    Height = 15
    Caption = 'Nome da instancia'
  end
  object Label2: TLabel
    Left = 8
    Top = 53
    Width = 98
    Height = 15
    Caption = 'Senha da instancia'
  end
  object Label3: TLabel
    Left = 8
    Top = 102
    Width = 43
    Height = 15
    Caption = 'Contato'
  end
  object edtNomeInstancia: TEdit
    Left = 8
    Top = 24
    Width = 185
    Height = 23
    TabOrder = 0
  end
  object edtSenha: TEdit
    Left = 8
    Top = 70
    Width = 185
    Height = 23
    TabOrder = 1
  end
  object edtContato: TEdit
    Left = 8
    Top = 119
    Width = 185
    Height = 23
    TabOrder = 2
    Text = '559982385000'
  end
  object mensagem: TMemo
    Left = 8
    Top = 148
    Width = 185
    Height = 141
    Lines.Strings = (
      'Esta '#233' uma mensagem de teste, '
      'se voce recebeu'#55358#56606
      #233' porque deu certo '#55357#56845'.'
      ''
      '*Pode usar negrito* e qualquer '
      'outro comando '
      'nativo '
      'do WhatsApp')
    TabOrder = 3
  end
  object Button1: TButton
    Left = 199
    Top = 24
    Width = 194
    Height = 25
    Caption = '1 - Criar instancia'
    TabOrder = 4
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 8
    Top = 295
    Width = 185
    Height = 25
    Caption = '4 - Enviar mensagem de texto'
    TabOrder = 5
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 8
    Top = 324
    Width = 185
    Height = 25
    Caption = '5 - Enviar anexo'
    TabOrder = 6
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 199
    Top = 88
    Width = 194
    Height = 25
    Caption = '3 - Status da instancia'
    TabOrder = 7
    OnClick = Button4Click
  end
  object Button5: TButton
    Left = 199
    Top = 56
    Width = 194
    Height = 25
    Caption = '2 - Obter qrCode'
    TabOrder = 8
    OnClick = Button5Click
  end
  object euAtendo: TApiEuAtendo
    VersionAPI = V2
    CodigoPais = '55'
    GlobalAPI = 'ASD3F21APIDEVS6A5SPAULOJRDEVFA1'
    EvolutionApiURL = 'https://apiv2demo.apicomponente.com.br'
    OnStatusInstancia = euAtendoStatusInstancia
    OnCriarInstancia = euAtendoCriarInstancia
    OnObterQrCode = euAtendoObterQrCode
    Left = 352
    Top = 301
  end
  object arquivo: TOpenDialog
    Left = 208
    Top = 300
  end
end
