unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, Menus, SynEdit,
  SynHighlighterPas, Process;

type

  { TForm1 }

  TForm1 = class(TForm)
    About: TMenuItem;
    CopyProgr: TMenuItem;
    ExitProgr: TMenuItem;
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem10: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    Open: TMenuItem;
    OpenDialog1: TOpenDialog;
    PasteProgr: TMenuItem;
    Save: TMenuItem;
    SaveDialog1: TSaveDialog;
    SelectAllProgr: TMenuItem;
    Separator1: TMenuItem;
    Separator2: TMenuItem;
    Separator3: TMenuItem;
    SynEdit1: TSynEdit;
    SynPasSyn1: TSynPasSyn;
    procedure AboutClick(Sender: TObject);
    procedure CopyProgrClick(Sender: TObject);
    procedure MenuItem2Click(Sender: TObject);
    procedure MenuItem4Click(Sender: TObject);
    procedure MenuItem5Click(Sender: TObject);
    procedure MenuItem8Click(Sender: TObject);
    procedure OpenClick(Sender: TObject);
    procedure PasteProgrClick(Sender: TObject);
    procedure SaveClick(Sender: TObject);
    procedure SelectAllProgrClick(Sender: TObject);
    procedure SynEdit1Change(Sender: TObject);
  private

  public

  end;

const
  BoilerplateCode =
    'program HelloWorld;' + sLineBreak +
    'begin' + sLineBreak +
    '  writeln(''Hello, World!'');' + sLineBreak +
    'end.';

var
  Form1: TForm1;
  FileContent: TStringList;
  searchText: string;
  startPos: LongInt;
  FoundPos: Integer;
  CompilerProcess: TProcess;
  filename: string;
  CompileSuccess: Boolean;

implementation

{$R *.lfm}

{ TForm1 }

procedure TForm1.SaveClick(Sender: TObject);
begin
     if SaveDialog1.Execute then
        begin
             SynEdit1.Lines.SaveToFile( SaveDialog1.Filename );
             Form1.Caption := SaveDialog1.Filename + ' - Andrew''s PascalStorm 2023';
             filename := SaveDialog1.Filename;
        end;
end;

procedure TForm1.SelectAllProgrClick(Sender: TObject);
begin
  SynEdit1.SelectAll;
end;

procedure TForm1.SynEdit1Change(Sender: TObject);
begin
  If MenuItem2.Checked then
  begin
       If filename <> '' then
       begin
          SynEdit1.Lines.SaveToFile( filename );
       end;
  end;
end;

procedure TForm1.AboutClick(Sender: TObject);
begin
    MessageDlg('Andrew''s PascalStorm' + LineEnding +
             'Version: 2023' + LineEnding +
             'Copyright © 2023 AndrewNation Software, Inc.' + LineEnding +
             'Website: https://https://andrewnationdev.vercel.app' + LineEnding +
             'Email: andrewnationdev@gmail.com',
             mtInformation, [mbOK], 0);
end;

procedure TForm1.CopyProgrClick(Sender: TObject);
begin
  SynEdit1.CopyToClipboard;
end;

procedure TForm1.MenuItem2Click(Sender: TObject);
begin
  If not MenuItem2.Checked then
  begin
      MenuItem2.Checked := true;
      Exit;
  end;

  MenuItem2.Checked := false;
end;

procedure TForm1.MenuItem4Click(Sender: TObject);
begin
  SynEdit1.Clear;
  SynEdit1.Text := BoilerplateCode;
end;

procedure TForm1.MenuItem5Click(Sender: TObject);
begin

end;

procedure TForm1.MenuItem8Click(Sender: TObject);
begin
    CompilerProcess := TProcess.Create(nil);
  try
    CompilerProcess.Executable := 'fpc'; // Path to the Free Pascal Compiler executable
    CompilerProcess.Parameters.Add(filename); // Replace with your source file path
    CompilerProcess.Options := [poWaitOnExit];
    CompilerProcess.Execute;

    CompileSuccess := CompilerProcess.ExitStatus = 0; // Check if the compilation was successful

    if CompileSuccess then
    begin
      MessageDlg('Project compiled successfully', mtInformation, [mbOK], 0);

      // Optionally, you can execute the compiled binary here
      // For example, if your Pascal program creates an executable file named "myprogram.exe":
      // CompilerProcess.Executable := 'myprogram.exe';
      // CompilerProcess.Parameters.Clear;
      // CompilerProcess.Execute;
    end
    else
    begin
      MessageDlg('Compilation failed', mtError, [mbOK], 0);
    end;
  except
    on E: Exception do
    begin
      MessageDlg(E.Message, mtError, [mbOK], 0);
    end;
  end;
end;

procedure TForm1.OpenClick(Sender: TObject);
begin
  if OpenDIalog1.Execute then
    if fileExists(OpenDialog1.Filename) then
    begin
         FileContent := TStringList.Create;
         try
           FileContent.LoadFromFile(OpenDialog1.Filename);
           SynEdit1.Lines.Assign(FileContent);
         finally
           FileContent.Free;
           Form1.Caption := OpenDialog1.Filename + ' - Andrew''s PascalStorm 2023';
           filename := OpenDialog1.Filename;
         end;

         Exit;
    end;

    ShowMessage('No file selected');
end;

procedure TForm1.PasteProgrClick(Sender: TObject);
begin
  SynEdit1.PasteFromClipboard;
end;

end.

