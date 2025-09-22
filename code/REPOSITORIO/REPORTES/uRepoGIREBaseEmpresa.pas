unit uRepoGIREBaseEmpresa;

interface

uses Windows, SysUtils, Messages, Classes, Graphics, Controls,
  StdCtrls, ExtCtrls, Forms, Quickrpt, QRCtrls, uRepoGIREBaseLogo, jpeg;

type
  TRepoGIREBaseEmpresa = class(TRepoGIREBaseLogo)
    lblNombreEmpresa: TQRLabel;
    lbltitulo: TQRSysData;
  end;

implementation

{$R *.DFM}


end.
