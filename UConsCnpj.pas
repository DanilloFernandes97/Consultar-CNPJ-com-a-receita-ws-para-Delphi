unit UConsCnpj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, IPPeerClient, System.Json, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit;

type
  TFrmPrincipal = class(TForm)
    RESTClient: TRESTClient;
    RESTRequest: TRESTRequest;
    RESTResponse: TRESTResponse;
    LabelNomeEmpresa: TLabel;
    EdtNomeEmpresa: TEdit;
    PanelTop: TPanel;
    BtnConsulta: TBitBtn;
    LabelCnpj: TLabel;
    EdtCnpj: TEdit;
    MemoAtividadePrincipal: TMemo;
    LabelAtividadePrincipal: TLabel;
    PanelClient: TPanel;
    LabelDataSituacao: TLabel;
    EdtDataSituacao: TMaskEdit;
    BtnConsTeste: TBitBtn;
    EdtTelefone: TEdit;
    Label1: TLabel;
    EdtEmail: TEdit;
    Label2: TLabel;
    EdtBairro: TEdit;
    Label3: TLabel;
    Label4: TLabel;
    EdtUf: TEdit;
    LabelUf: TLabel;
    EdtCep: TEdit;
    Label5: TLabel;
    EdtNumero: TEdit;
    EdtMunicipio: TEdit;
    Label6: TLabel;
    EdtPorte: TEdit;
    LabelPorte: TLabel;
    Label7: TLabel;
    EdtCapitalSocial: TCurrencyEdit;
    Label8: TLabel;
    MemoAtividadesSecundarias: TMemo;
    Label9: TLabel;
    EdtTipo: TEdit;
    Label10: TLabel;
    MemoQuadroSocios: TMemo;
    EdtNaturezaJuridica: TEdit;
    Label11: TLabel;
    procedure BtnConsultaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnConsTesteClick(Sender: TObject);
  private
    procedure ConsultaCnpj;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses Data.DBXJSONReflect, UClassEmpresa;

{$R *.dfm}

procedure TFrmPrincipal.BtnConsTesteClick(Sender: TObject);
var
  lEmpresa: TEmpresa;
  lJsonObject: TJSONObject;
begin

  try

    RESTRequest.Resource := '/{cnpj}';

    RESTRequest.Params.AddUrlSegment('cnpj', EdtCnpj.Text);

    RESTRequest.Execute;

    lJsonObject := RESTResponse.JSONValue as TJSONObject;

    if (RESTResponse.StatusCode = 200) then
    begin

      lEmpresa := TEmpresa.Create;
      try

        lEmpresa.Nome := lJsonObject.Values['nome'].Value;

        EdtNomeEmpresa.Text := lEmpresa.Nome;

      finally
        lEmpresa.Destroy;
      end;

    end
    else
    begin

      raise Exception.Create(lJsonObject.Values['message'].Value);

    end;

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao realizar consulta do cnpj, motivo ' + E.Message);
    end;
  end;

end;

procedure TFrmPrincipal.BtnConsultaClick(Sender: TObject);
begin

  if (Trim(EdtCnpj.Text).IsEmpty) then
  begin

    EdtCnpj.SetFocus;

    raise Exception.Create('Campo CNPJ � obrigat�rio');

  end;

  if (Trim(EdtCnpj.Text).Length <> 14) then
  begin

    EdtCnpj.SetFocus;

    raise Exception.Create('CNPJ � inv�lido');

  end;

  Self.ConsultaCnpj;

end;

procedure TFrmPrincipal.ConsultaCnpj;
var

  lJsonObject: TJSONObject;
  lJsonSubObject: TJSONObject;

  lJsonArray: TJSONArray;

  lCount: SmallInt;

begin

  try

    RESTRequest.Resource := '/{cnpj}';

    RESTRequest.Params.AddUrlSegment('cnpj', EdtCnpj.Text);

    RESTRequest.Execute;

     lJsonObject := RESTResponse.JSONValue as TJSONObject;

    if (RESTResponse.StatusCode = 200) then
    begin

      // Nome da empresa.
      EdtNomeEmpresa.Text := lJsonObject.Values['nome'].Value;
      //

      EdtDataSituacao.Text := lJsonObject.Values['data_situacao'].Value;

      EdtPorte.Text := lJsonObject.Values['porte'].Value;

      EdtTipo.Text := lJsonObject.Values['tipo'].Value;

      EdtCapitalSocial.Value := StrToCurr( StringReplace(lJsonObject.Values['capital_social'].Value, '.', ',', [rfReplaceAll]));

      EdtNaturezaJuridica.Text := lJsonObject.Values['natureza_juridica'].Value;

      EdtTelefone.Text := lJsonObject.Values['telefone'].Value;

      EdtMunicipio.Text := lJsonObject.Values['municipio'].Value;

      EdtBairro.Text := lJsonObject.Values['bairro'].Value;

      EdtNumero.Text := lJsonObject.Values['numero'].Value;

      EdtUf.Text := lJsonObject.Values['uf'].Value;

      EdtCep.Text := lJsonObject.Values['cep'].Value;

      EdtEmail.Text := lJsonObject.Values['email'].Value;

      // Atividade principal.
      lJsonArray := lJsonObject.Get('atividade_principal').JSONValue as TJSONArray;

      for lCount := 0 to lJsonArray.Count - 1 do // Qualquer coisa tenta com o size.
      begin

        lJsonSubObject := lJsonArray.Items[lCount] as TJSONObject;

        MemoAtividadePrincipal.Lines.Add(lJsonSubObject.Values['code'].Value + ' - ' + lJsonSubObject.Values
          ['text'].Value);

        MemoAtividadePrincipal.Lines.Add('');

      end;

      //

      // Atividades secund�rias.
      for lCount := 0 to lJsonArray.Count - 1 do // Qualquer coisa tenta com o size.
      begin

        lJsonSubObject := lJsonArray.Items[lCount] as TJSONObject;

        MemoAtividadesSecundarias.Lines.Add(lJsonSubObject.Values['code'].Value + ' - ' + lJsonSubObject.Values
          ['text'].Value);

        MemoAtividadesSecundarias.Lines.Add('');

      end;

      //

      // Quadro de S�cios
      lJsonArray := lJsonObject.Get('qsa').JsonValue as TJSONArray;

      for lCount := 0 to lJsonArray.Count - 1 do
      begin

        lJsonSubObject := lJsonArray.Items[lCount] as TJSONObject;

        MemoQuadroSocios.Lines.Add(lJsonSubObject.Values['qual'].Value + ' - ' + lJsonSubObject.Values
          ['nome'].Value);

        MemoQuadroSocios.Lines.Add('');

      end;

    end
    else
    begin

      raise Exception.Create(lJsonObject.Values['message'].Value);

    end;

  except
    on E: Exception do
    begin
      raise Exception.Create('Erro ao realizar consulta do cnpj, motivo ' + E.Message);
    end;
  end;

end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin

  if (Key = VK_ESCAPE) then
  begin

    Close;

  end;

end;

end.
