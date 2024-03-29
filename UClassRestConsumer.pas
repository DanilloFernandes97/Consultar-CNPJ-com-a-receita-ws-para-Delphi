unit UClassRestConsumer;

interface

uses System.SysUtils, System.Classes, REST.Client, REST.Types;

type
  TRestConsumer = class(TPersistent)

  private
    FRESTRequest: TRESTRequest;
    FRESTResponse: TRESTResponse;
    FRESTClient: TRESTClient;

    procedure preparaObjetos();

  public

    property RESTRequest: TRESTRequest read FRESTRequest write FRESTRequest;
    property RESTResponse: TRESTResponse read FRESTResponse write FRESTResponse;
    property RESTClient: TRESTClient read FRESTClient write FRESTClient;

    constructor Create overload;
    destructor Destroy;

  end;

implementation

{ TRestClient }

constructor TRestConsumer.Create;
begin

  Self.FRESTRequest := TRESTRequest.Create(nil);
  Self.FRESTResponse := TRESTResponse.Create(nil);
  Self.FRESTClient := TRESTClient.Create(nil);

  Self.preparaObjetos;
end;

destructor TRestConsumer.Destroy;
begin
  Self.FRESTRequest.Destroy;
  Self.FRESTResponse.Destroy;
  Self.FRESTClient.Destroy;
  inherited;
end;

procedure TRestConsumer.preparaObjetos;
begin

  Self.FRESTClient.Accept :=
    'application/json, text/plain; q=0.9, text/html;q=0.8,';
  Self.FRESTClient.AcceptCharset := 'UTF-8, *;q=0.8';
  Self.FRESTClient.AutoCreateParams := True;
  Self.FRESTClient.BaseURL := 'https://www.receitaws.com.br/v1/cnpj';
  Self.FRESTClient.ConnectTimeout := 30000;
  Self.FRESTClient.FallbackCharsetEncoding := 'utf-8';
  Self.FRESTClient.ReadTimeout := 30000;
  // Self.FRESTClient.RedirectsWithGET := [Post301,Post302,Post303,Put303,Delete303];
  Self.RESTClient.SynchronizedEvents := True;
  Self.FRESTClient.RaiseExceptionOn500 := False;

  Self.FRESTResponse.ContentType := 'application/json';

  Self.FRESTRequest.Accept :=
    'application/json, text/plain; q=0.9, text/html;q=0.8,';
  Self.FRESTRequest.AcceptCharset := 'UTF-8, *;q=0.8';
  Self.FRESTRequest.Client := Self.FRESTClient;
  Self.FRESTRequest.ConnectTimeout := 30000;
  Self.FRESTRequest.HandleRedirects := True;
  Self.FRESTRequest.Method := rmGET;
  Self.FRESTRequest.ReadTimeout := 30000;
  Self.FRESTRequest.Response := Self.FRESTResponse;
  Self.FRESTRequest.Response.ContentType := 'application/json';
  Self.FRESTRequest.SynchronizedEvents := False;

end;

end.
