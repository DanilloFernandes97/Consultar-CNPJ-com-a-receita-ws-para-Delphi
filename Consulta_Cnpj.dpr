program Consulta_Cnpj;

uses
  Vcl.Forms,
  UClassAtividadeEmpresa in 'UClassAtividadeEmpresa.pas',
  UClassEmpresa in 'UClassEmpresa.pas',
  UClassSocioEmpresa in 'UClassSocioEmpresa.pas',
  UConsCnpj in 'UConsCnpj.pas' {FrmPrincipal},
  UClassRestConsumer in 'UClassRestConsumer.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.Run;
end.
