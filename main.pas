unit main;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, SQLite3Conn, SQLDB, DB, SQLite3DS, Forms, Controls,
  Graphics, Dialogs, DBGrids, Buttons, DBCtrls, StdCtrls, ExtCtrls, add, del,
  edit, BASS;

type

  { TMain_Form }

  TMain_Form = class(TForm)
    Button_Add: TSpeedButton;
    Button_Delete: TSpeedButton;
    Button_Edit: TSpeedButton;
    Button_Search: TButton;
    Button_Sort: TSpeedButton;
    ComboBox_Search: TComboBox;
    DataSource1: TDataSource;
    DBGrid: TDBGrid;
    Edit_Search: TEdit;
    Image_Heading: TImage;
    Image_Bakcground: TImage;
    Label_Search_1: TLabel;
    Label_Search_2: TLabel;
    SQLite3Connection1: TSQLite3Connection;
    Sqlite3Dataset1: TSqlite3Dataset;
    SQLQuery1: TSQLQuery;
    SQLTransaction1: TSQLTransaction;
    procedure Button_AddClick(Sender: TObject);
    procedure Button_DeleteClick(Sender: TObject);
    procedure Button_EditClick(Sender: TObject);
    procedure Button_SearchClick(Sender: TObject);
    procedure Button_SortClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure SQLite3Connection1AfterConnect(Sender: TObject);

  private

  public

  end;

var
  Main_Form: TMain_Form;
  StreamHandle: HSTREAM;
  filemusic: string;

implementation

{$R *.lfm}

{ TMain_Form }

procedure TMain_Form.FormCreate(Sender: TObject);
begin
  {DBGrid.Columns[0].Width := 100;}
  try
     SQLite3Dataset1.Open;
     SQLite3Connection1.Connected:=True;
  except
     On E:Exception do
        ShowMessage('Ошибка открытия базы: '+ E.Message);
  end;

    if not BASS_Init(-1, 44100, 0, Handle, nil) then
  begin
    ShowMessage('BASS initialization error');
    Exit;
  end;

  StreamHandle := BASS_StreamCreateFile(False, PChar('main_music.mp3'), 0, 0, BASS_SAMPLE_LOOP);
  if StreamHandle = 0 then
  begin
    ShowMessage('Error loading music');
    Exit;
  end;

  BASS_ChannelPlay(StreamHandle, False);

end;

procedure TMain_Form.SQLite3Connection1AfterConnect(Sender: TObject);
begin

end;


procedure TMain_Form.Button_AddClick(Sender: TObject);
begin
  Add_Form.Edit_animal.Text:='';
  Add_Form.Edit_name.Text:='';
  Add_Form.Edit_age.Text:='';
  Add_Form.Edit_aviar.Text:='';
  Add_Form.ShowModal;
  if Add_Form.ModalResult <> mrOK then exit;

  SQLite3Dataset1.Close;

  with SQLQuery1 do
  begin
    SQL.Clear;
    SQL.Add('INSERT INTO ZooTbl(animal, name, age, gender, meal, aviar) VALUES(:ANIMAL,:NAME,:AGE,:GENDER,:MEAL,:AVIAR)');
    ParamByName('ANIMAL').Text:=Add_Form.Edit_animal.Text;
    ParamByName('NAME').Text:=Add_Form.Edit_name.Text;
    ParamByName('AGE').Text:=Add_Form.Edit_age.Text;
    ParamByName('GENDER').Text:=Add_Form.ComboBox_gender.Text;
    ParamByName('MEAL').Text:=Add_Form.ComboBox_meal.Text;
    ParamByName('AVIAR').Text:=Add_Form.Edit_aviar.Text;
    ExecSQL;
    SQLTransaction.Commit;
    Close;
  end;

  SQLite3Dataset1.Open;
end;

procedure TMain_Form.Button_DeleteClick(Sender: TObject);
begin
  Del_Form.Edit_id.Text:='';
  Del_Form.ShowModal;
  if Del_Form.ModalResult <> mrOK then exit;

  SQLite3Dataset1.Close;

  with SQLQuery1 do
  begin
    SQL.Clear;
    SQL.Add('DELETE FROM ZooTbl where id=:ID');
    ParamByName('ID').Text:=Del_Form.Edit_id.Text;
    ExecSQL;
    SQLTransaction.Commit;
    Close;
  end;

  SQLite3Dataset1.Open;
end;

procedure TMain_Form.Button_EditClick(Sender: TObject);
begin
  Edit_Form.ShowModal;
  if Edit_Form.ModalResult <> mrOK then exit;
  SQLite3Dataset1.Open;
end;

procedure TMain_Form.Button_SearchClick(Sender: TObject);
begin
  SQLite3Dataset1.Locate(ComboBox_Search.Text,Edit_Search.Text,[loCaseInsensitive, loPartialKey]);
end;

procedure TMain_Form.Button_SortClick(Sender: TObject);
begin
  SQLite3Dataset1.Close;
  sleep(1000);
  SQLTransaction1.Commit;
  SQLite3Dataset1.Open;
end;

end.

