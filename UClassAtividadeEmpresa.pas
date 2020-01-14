unit UClassAtividadeEmpresa;

interface

uses System.SysUtils, System.Classes;

type
  TAtividadeEmpresa = class(TPersistent)
  private

    FTipoAtividade: Byte;
    FCode: string;
    FText: string;

  public

    /// <summary>
    /// Tipo da atividade, 0 = Atividade principal, 1 = Atividade secundária.
    /// </summary>
    property TipoAtividade: Byte read FTipoAtividade write FTipoAtividade;

    /// <summary>
    /// Código CNAE da atividade no formato 00.00-0-00.
    /// </summary>
    property Code: string read FCode write FCode;

    /// <summary>
    /// Descrição da atividade.
    /// </summary>
    property Text: string read FText write FText;

    constructor Create; overload;
    destructor Destroy; override;

  end;

implementation

{ TAtividadeEmpresa }

constructor TAtividadeEmpresa.Create;
begin

end;

destructor TAtividadeEmpresa.Destroy;
begin

  inherited;
end;

end.
