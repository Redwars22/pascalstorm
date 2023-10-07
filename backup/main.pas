unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, SynEdit,
  SynHighlighterPas;

type

  { TForm1 }

  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SynEdit1: TSynEdit;
    SynPasSyn1: TSynPasSyn;
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem3Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.MenuItem5Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem3Click(Sender: TObject);
begin
   if SaveDialog1.Execute then
    SynEdit1.Lines.SaveToFile( SaveDialog1.Filename );
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
   if OpenDialog1.Execute then
   begin
     if fileExists(OpenDialog1.Filename) then
       ShowMessage(OpenDialog1.Filename);
   end
   else
       ShowMessage('No file selected');
end;

end.

