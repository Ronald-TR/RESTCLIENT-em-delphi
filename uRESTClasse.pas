unit uRESTClasse;

interface
uses
IPPeerClient, REST.Client, Data.Bind.Components, Data.Bind.ObjectScope, REST.Types;
type

      TcRest = class
private
      RESTClient   : TRESTClient;
      RESTRequest  : TRESTRequest;
      RESTResponse : TRESTResponse;
public
      function Executar(metodo : string) : string; //executa o request e retorna o json com o metodo podendo ser get, post, put, delete e patch
      procedure addRecVal(recurso, valor: string);//adiciona o recurso e o segmento da uri (opcional�)
      constructor Create (BaseUrl : string); overload;

end;

implementation

{ cRest }

constructor TcRest.Create(BaseUrl : string);//construtor que instancia os objetos rest
begin
//instancia as variaveis rest e interliga ao request
      RESTClient   := TRESTClient.Create(BaseUrl);
      RESTRequest  := TRESTRequest.Create(nil);
      RESTResponse := TRESTResponse.Create(nil);
      RESTClient.AutoCreateParams := True;
      RESTRequest.AutoCreateParams := True;
      RESTRequest.HandleRedirects := true;
      RESTRequest.Client := RESTClient;
      RESTRequest.Response := RESTResponse;


end;

function TcRest.Executar(metodo : string): string;//executa e retorna o objeto json sem formatação
begin
      if metodo = '' then begin
      RESTRequest.Method := TRESTRequestMethod.rmGET;
      end
      else if (metodo = 'GET') or (metodo = 'get') then begin
      RESTRequest.Method := TRESTRequestMethod.rmGET;
      end
      else if (metodo = 'PUT') or (metodo = 'put') then begin
      RESTRequest.Method := TRESTRequestMethod.rmPUT;
      end
      else if (metodo = 'POST') or (metodo = 'post') then begin
      RESTRequest.Method := TRESTRequestMethod.rmPOST;
      end
      else if (metodo = 'DELETE') or (metodo = 'delete')then begin
      RESTRequest.Method := TRESTRequestMethod.rmDELETE;
      end
      else if (metodo = 'PATCH') or (metodo = 'patch') then begin
      RESTRequest.Method := TRESTRequestMethod.rmPATCH;
      end;

      RESTRequest.Execute;
      Result := RESTResponse.JSONText;
end;

procedure TcRest.addRecVal(recurso, valor: string);//adiciona o recurso e o segmento da uri
begin

      recurso := recurso + '/{valor}'; //adiciona a variavel valor a uri
      RESTRequest.Resource := recurso;
      RESTRequest.AddParameter('valor', valor, TRESTRequestParameterKind.pkURLSEGMENT);

end;

end.
