unit UClassAtividadeSecEmpresa;

interface

uses System.SysUtils, System.Classes;

type
  TAtividadeSecEmpresa = class(TPersistent)
  private

    FCode: string;
    FText: string;

  public

    /// <summary>
    /// C�digo CNAE da atividade no formato 00.00-0-00.
    /// </summary>
    property Code: string read FCode write FCode;

    /// <summary>
    /// Descri��o da atividade.
    /// </summary>
    property Text: string read FText write FText;

    function toString: string;

    constructor Create; overload;
    destructor Destroy; override;

  end;

implementation

{ TAtividadeEmpresa }

constructor TAtividadeSecEmpresa.Create;
begin

end;

destructor TAtividadeSecEmpresa.Destroy;
begin

  inherited;
end;

function TAtividadeSecEmpresa.toString: string;
begin

  Result := Self.FCode + ' - ' + Self.FText;

end;

end.
