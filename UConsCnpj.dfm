object FrmPrincipal: TFrmPrincipal
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Consulta CNPJ'
  ClientHeight = 447
  ClientWidth = 810
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  KeyPreview = True
  OldCreateOrder = False
  Position = poScreenCenter
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  object PanelTop: TPanel
    Left = 0
    Top = 0
    Width = 810
    Height = 57
    Align = alTop
    TabOrder = 0
    ExplicitWidth = 447
    object LabelCnpj: TLabel
      Left = 12
      Top = 5
      Width = 22
      Height = 13
      Caption = 'Cnpj'
    end
    object BtnConsulta: TBitBtn
      Left = 139
      Top = 17
      Width = 75
      Height = 25
      Caption = 'Consultar'
      TabOrder = 0
      OnClick = BtnConsultaClick
    end
    object EdtCnpj: TEdit
      Left = 12
      Top = 20
      Width = 121
      Height = 21
      NumbersOnly = True
      TabOrder = 1
      Text = '12924111000173'
    end
    object BtnConsTeste: TBitBtn
      Left = 272
      Top = 17
      Width = 75
      Height = 25
      Caption = 'BtnConsTeste'
      TabOrder = 2
      OnClick = BtnConsTesteClick
    end
  end
  object PanelClient: TPanel
    Left = 0
    Top = 57
    Width = 810
    Height = 390
    Align = alClient
    TabOrder = 1
    ExplicitLeft = -8
    ExplicitTop = 63
    ExplicitWidth = 674
    ExplicitHeight = 278
    object LabelAtividadePrincipal: TLabel
      Left = 12
      Top = 185
      Width = 87
      Height = 13
      Caption = 'Atividade principal'
    end
    object LabelNomeEmpresa: TLabel
      Left = 12
      Top = 9
      Width = 86
      Height = 13
      Caption = 'Nome da empresa'
    end
    object LabelDataSituacao: TLabel
      Left = 279
      Top = 9
      Width = 81
      Height = 13
      Caption = 'Data da situa'#231#227'o'
    end
    object Label1: TLabel
      Left = 279
      Top = 66
      Width = 42
      Height = 13
      Caption = 'Telefone'
    end
    object Label2: TLabel
      Left = 464
      Top = 66
      Width = 28
      Height = 13
      Caption = 'E-mail'
    end
    object Label3: TLabel
      Left = 153
      Top = 126
      Width = 28
      Height = 13
      Caption = 'Bairro'
    end
    object Label4: TLabel
      Left = 354
      Top = 126
      Width = 37
      Height = 13
      Caption = 'N'#250'mero'
    end
    object LabelUf: TLabel
      Left = 493
      Top = 126
      Width = 11
      Height = 13
      Caption = 'Uf'
    end
    object Label5: TLabel
      Left = 575
      Top = 126
      Width = 19
      Height = 13
      Caption = 'Cep'
    end
    object Label6: TLabel
      Left = 12
      Top = 126
      Width = 43
      Height = 13
      Caption = 'Munic'#237'pio'
    end
    object LabelPorte: TLabel
      Left = 410
      Top = 9
      Width = 26
      Height = 13
      Caption = 'Porte'
    end
    object Label7: TLabel
      Left = 680
      Top = 9
      Width = 66
      Height = 13
      Caption = 'Capital Social'
    end
    object Label8: TLabel
      Left = 410
      Top = 185
      Width = 110
      Height = 13
      Caption = 'Atividades secund'#225'rias'
    end
    object Label9: TLabel
      Left = 544
      Top = 9
      Width = 20
      Height = 13
      Caption = 'Tipo'
    end
    object Label10: TLabel
      Left = 12
      Top = 281
      Width = 83
      Height = 13
      Caption = 'Quadro de s'#243'cios'
    end
    object Label11: TLabel
      Left = 12
      Top = 66
      Width = 83
      Height = 13
      Caption = 'Natureza Jur'#237'dica'
    end
    object EdtNomeEmpresa: TEdit
      Left = 12
      Top = 26
      Width = 253
      Height = 21
      TabOrder = 0
    end
    object MemoAtividadePrincipal: TMemo
      Left = 12
      Top = 204
      Width = 385
      Height = 65
      TabOrder = 12
    end
    object EdtDataSituacao: TMaskEdit
      Left = 279
      Top = 26
      Width = 118
      Height = 21
      EditMask = '!99/99/99;1;_'
      MaxLength = 8
      TabOrder = 1
      Text = '  /  /  '
    end
    object EdtTelefone: TEdit
      Left = 279
      Top = 82
      Width = 167
      Height = 21
      TabOrder = 5
    end
    object EdtEmail: TEdit
      Left = 464
      Top = 82
      Width = 253
      Height = 21
      TabOrder = 6
    end
    object EdtBairro: TEdit
      Left = 153
      Top = 143
      Width = 177
      Height = 21
      TabOrder = 8
    end
    object EdtUf: TEdit
      Left = 493
      Top = 143
      Width = 65
      Height = 21
      TabOrder = 10
    end
    object EdtCep: TEdit
      Left = 575
      Top = 143
      Width = 121
      Height = 21
      TabOrder = 11
    end
    object EdtNumero: TEdit
      Left = 354
      Top = 143
      Width = 121
      Height = 21
      TabOrder = 9
    end
    object EdtMunicipio: TEdit
      Left = 12
      Top = 143
      Width = 121
      Height = 21
      TabOrder = 7
    end
    object EdtPorte: TEdit
      Left = 410
      Top = 26
      Width = 121
      Height = 21
      TabOrder = 2
    end
    object EdtCapitalSocial: TCurrencyEdit
      Left = 680
      Top = 26
      Width = 115
      Height = 21
      TabOrder = 4
    end
    object MemoAtividadesSecundarias: TMemo
      Left = 410
      Top = 204
      Width = 385
      Height = 65
      TabOrder = 13
    end
    object EdtTipo: TEdit
      Left = 544
      Top = 26
      Width = 121
      Height = 21
      TabOrder = 3
    end
    object MemoQuadroSocios: TMemo
      Left = 12
      Top = 301
      Width = 783
      Height = 78
      TabOrder = 14
    end
    object EdtNaturezaJuridica: TEdit
      Left = 12
      Top = 82
      Width = 253
      Height = 21
      TabOrder = 15
    end
  end
  object RESTClient: TRESTClient
    Accept = 'application/json, text/plain; q=0.9, text/html;q=0.8,'
    AcceptCharset = 'UTF-8, *;q=0.8'
    BaseURL = 'https://www.receitaws.com.br/v1/cnpj'
    Params = <>
    HandleRedirects = True
    RaiseExceptionOn500 = False
    Left = 539
    Top = 11
  end
  object RESTRequest: TRESTRequest
    Client = RESTClient
    Params = <>
    Response = RESTResponse
    SynchronizedEvents = False
    Left = 387
    Top = 11
  end
  object RESTResponse: TRESTResponse
    ContentType = 'application/json'
    Left = 467
    Top = 11
  end
end
