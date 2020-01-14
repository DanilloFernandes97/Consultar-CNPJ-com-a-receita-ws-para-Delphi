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
    /// Nome do s�cio.
    /// </summary>
    property Nome: string read FNome write FNome;

    /// <summary>
    /// Qualifica��o do s�cio.
    /// </summary>
    property Qual: string read FQual write FQual;

    /// <summary>
    /// Pa�s de origem do s�cio. Dispon�vel apenas para s�cios estrangeiros.
    /// </summary>
    property PaisOrigem: string read FPaisOrigem write FPaisOrigem;

    /// <summary>
    /// Nome do representante legal. Dispon�vel apenas para s�cios com representantes.
    /// </summary>
    property NomeRepLegal: string read FNomeRepLegal write FNomeRepLegal;

    /// <summary>
    /// Qualifica��o do representante legal. Dispon�vel apenas para s�cios com representantes.
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
