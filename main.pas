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
    MenuItem4: TMenuItem;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    SynEdit1: TSynEdit;
    SynPasSyn1: TSynPasSyn;
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

end.

