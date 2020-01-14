unit UClassSocioEmpresa;

interface

uses System.SysUtils, System.Classes;

type
  TSocioAdmEmpresa = class(TPersistent)
  private

    FNome: string;
    FQual: string;
    FPaisOrigem: string;
    FNomeRepLegal: string;
    FQualRepLegal: string;

  public

    /// <summary>
    /// Nome do sócio.
    /// </summary>
    property Nome: string read FNome write FNome;

    /// <summary>
    /// Qualificação do sócio.
    /// </summary>
    property Qual: string read FQual write FQual;

    /// <summary>
    /// País de origem do sócio. Disponível apenas para sócios estrangeiros.
    /// </summary>
    property PaisOrigem: string read FPaisOrigem write FPaisOrigem;

    /// <summary>
    /// Nome do representante legal. Disponível apenas para sócios com representantes.
    /// </summary>
    property NomeRepLegal: string read FNomeRepLegal write FNomeRepLegal;

    /// <summary>
    /// Qualificação do representante legal. Disponível apenas para sócios com representantes.
    /// </summary>
    property QualRepLegal: string read FQualRepLegal write FQualRepLegal;

    constructor Create; overload;
    destructor Destroy; override;

  end;

implementation

{ TSocioAdmEmpresa }

constructor TSocioAdmEmpresa.Create;
begin

end;

destructor TSocioAdmEmpresa.Destroy;
begin

  inherited;
end;

end.
