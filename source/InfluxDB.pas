unit InfluxDB;

interface

uses
  System.SysUtils,
  InfluxDB.Interfaces,
  InfluxDB.Request;

type

  TInfluxDB = class(TInfluxRequest, IInfluxDB)
  public
    constructor Create(AHost: String; APort: Integer); overload;
    constructor Create(AHost: String; APort: Integer; AUsername, APassword : String); overload;
    class function CreateClient(Host: String; Port: Integer): IInfluxDB;  overload;
    class function CreateClient(Host: String; Port: Integer;Username, Password : String): IInfluxDB;  overload;
  end;

implementation

{ TInfluxDBClient }

constructor TInfluxDB.Create(AHost: String; APort: Integer);
begin
  inherited Create;
  Self.Host := AHost;
  Self.Port := APort;
  Self.Username := '';
  Self.Password := '';
end;

constructor TInfluxDB.Create(AHost: String; APort: Integer; AUsername, APassword: String);
begin
  inherited Create;
  Self.Host := AHost;
  Self.Port := APort;
  Self.Username := AUsername;
  Self.Password := APassword;
end;


class function TInfluxDB.CreateClient(Host: String; Port: Integer): IInfluxDB;
begin
  Result := TInfluxDB.Create(Host, Port);
end;


class function TInfluxDB.CreateClient(Host: String; Port: Integer; Username, Password: String): IInfluxDB;
begin
  Result := TInfluxDB.Create(Host, Port, Username, Password);
end;

end.
