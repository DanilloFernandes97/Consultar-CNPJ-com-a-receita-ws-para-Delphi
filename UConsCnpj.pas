unit UConsCnpj;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls,
  Vcl.Forms, Vcl.Dialogs, IPPeerClient, System.Json,
  Data.Bind.Components, Data.Bind.ObjectScope,
  Vcl.StdCtrls, Vcl.Buttons, Vcl.ExtCtrls, Vcl.Mask, RxToolEdit, RxCurrEdit,
  UClassRestConsumer;

type
  TFrmPrincipal = class(TForm)
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
    BtnConsNomeEmp: TBitBtn;
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
    Label8: TLabel;
    MemoAtividadesSecundarias: TMemo;
    Label9: TLabel;
    EdtTipo: TEdit;
    Label10: TLabel;
    MemoQuadroSocios: TMemo;
    EdtNaturezaJuridica: TEdit;
    Label11: TLabel;
    BtnLimparCampos: TButton;
    Label12: TLabel;
    EdtCapitalSocial: TEdit;
    procedure BtnConsultaClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure BtnConsNomeEmpClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BtnLimparCamposClick(Sender: TObject);
  private

    FRestConsumer: TRestConsumer;

    procedure consultaCnpj;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

uses Data.DBXJSONReflect, UClassEmpresa;

{$R *.dfm}

procedure TFrmPrincipal.BtnConsNomeEmpClick(Sender: TObject);
var
  lEmpresa: TEmpresa;
  lJsonObject: TJSONObject;
begin

  try

    Self.FRestConsumer.RESTClient.Accept := '';

    Self.FRestConsumer.RestRequest.Resource := '/{cnpj}';

    Self.FRestConsumer.RestRequest.Params.AddUrlSegment('cnpj', EdtCnpj.Text);

    Self.FRestConsumer.RestRequest.Execute;

    lJsonObject := Self.FRestConsumer.RESTResponse.JSONValue as TJSONObject;

    if (Self.FRestConsumer.RESTResponse.StatusCode = 200) then
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
      raise Exception.Create('Erro ao realizar consulta do cnpj, motivo ' +
        E.Message);
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

  Self.consultaCnpj;

end;

procedure TFrmPrincipal.BtnLimparCamposClick(Sender: TObject);
begin

  EdtNomeEmpresa.Clear;
  EdtDataSituacao.Clear;
  EdtPorte.Clear;
  EdtTipo.Clear;
  EdtCapitalSocial.Clear;
  EdtNaturezaJuridica.Clear;
  EdtTelefone.Clear;
  EdtEmail.Clear;
  EdtMunicipio.Clear;
  EdtBairro.Clear;
  EdtNumero.Clear;
  EdtUf.Clear;
  EdtCep.Clear;
  MemoAtividadePrincipal.Lines.Clear;
  MemoAtividadesSecundarias.Lines.Clear;
  MemoQuadroSocios.Lines.Clear;

end;

procedure TFrmPrincipal.consultaCnpj;
var

  lJsonObject: TJSONObject;
  lJsonSubObject: TJSONObject;

  lJsonArray: TJSONArray;

  lCount: SmallInt;

  lAuxValorCapitalSocial: Double;

begin

  try

    Self.FRestConsumer.RestRequest.Resource := '/{cnpj}';

    Self.FRestConsumer.RestRequest.Params.AddUrlSegment('cnpj', EdtCnpj.Text);

    Self.FRestConsumer.RestRequest.Execute;

    lJsonObject := Self.FRestConsumer.RESTResponse.JSONValue as TJSONObject;

    if (Self.FRestConsumer.RESTResponse.StatusCode = 200) then
    begin

      EdtNomeEmpresa.Text := lJsonObject.Values['nome'].Value;

      EdtDataSituacao.Text := lJsonObject.Values['data_situacao'].Value;

      EdtPorte.Text := lJsonObject.Values['porte'].Value;

      EdtTipo.Text := lJsonObject.Values['tipo'].Value;

      lAuxValorCapitalSocial :=
        StrToCurr(StringReplace(lJsonObject.Values['capital_social'].Value, '.',
        ',', [rfReplaceAll]));

      EdtCapitalSocial.Text := FormatFloat(',0.00', lAuxValorCapitalSocial);

      EdtNaturezaJuridica.Text := lJsonObject.Values['natureza_juridica'].Value;

      EdtTelefone.Text := lJsonObject.Values['telefone'].Value;

      EdtMunicipio.Text := lJsonObject.Values['municipio'].Value;

      EdtBairro.Text := lJsonObject.Values['bairro'].Value;

      EdtNumero.Text := lJsonObject.Values['numero'].Value;

      EdtUf.Text := lJsonObject.Values['uf'].Value;

      EdtCep.Text := lJsonObject.Values['cep'].Value;

      EdtEmail.Text := lJsonObject.Values['email'].Value;

      lJsonArray := lJsonObject.Get('atividade_principal')
        .JSONValue as TJSONArray;

      // Se o count n�o de certo, tente com o size.
      for lCount := 0 to lJsonArray.Count - 1 do
      begin

        lJsonSubObject := lJsonArray.Items[lCount] as TJSONObject;

        MemoAtividadePrincipal.Lines.Add(lJsonSubObject.Values['code'].Value +
          ' - ' + lJsonSubObject.Values['text'].Value);

        MemoAtividadePrincipal.Lines.Add('');

      end;

      //

      // Atividades secund�rias.
      // Se o count n�o de certo, tente com o size.
      for lCount := 0 to lJsonArray.Count - 1 do
      begin

        lJsonSubObject := lJsonArray.Items[lCount] as TJSONObject;

        MemoAtividadesSecundarias.Lines.Add(lJsonSubObject.Values['code'].Value
          + ' - ' + lJsonSubObject.Values['text'].Value);

        MemoAtividadesSecundarias.Lines.Add('');

      end;

      //

      // Quadro de S�cios
      lJsonArray := lJsonObject.Get('qsa').JSONValue as TJSONArray;

      for lCount := 0 to lJsonArray.Count - 1 do
      begin

        lJsonSubObject := lJsonArray.Items[lCount] as TJSONObject;

        MemoQuadroSocios.Lines.Add(lJsonSubObject.Values['qual'].Value + ' - ' +
          lJsonSubObject.Values['nome'].Value);

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
      raise Exception.Create('Erro ao realizar consulta do cnpj, motivo ' +
        E.Message);
    end;
  end;

end;

procedure TFrmPrincipal.FormCreate(Sender: TObject);
begin
  Self.FRestConsumer := TRestConsumer.Create;
end;

procedure TFrmPrincipal.FormDestroy(Sender: TObject);
begin
  Self.FRestConsumer.Destroy;
end;

procedure TFrmPrincipal.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin

  if (Key = VK_ESCAPE) then
  begin

    Close;

  end;

end;

end.
