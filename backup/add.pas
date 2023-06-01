unit add;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons;

type

  { TAdd_Form }

  TAdd_Form = class(TForm)
    Button_Cancel: TBitBtn;
    Button_OK: TBitBtn;
    ComboBox_gender: TComboBox;
    ComboBox_meal: TComboBox;
    Edit_animal: TEdit;
    Edit_name: TEdit;
    Edit_age: TEdit;
    Edit_aviar: TEdit;
    Label_Animal: TLabel;
    Label_Animal1: TLabel;
    Label_Animal2: TLabel;
    Label_Animal3: TLabel;
    Label_Animal4: TLabel;
    Label_Animal5: TLabel;
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  Add_Form: TAdd_Form;

implementation

{$R *.lfm}

{ TAdd_Form }

procedure TAdd_Form.FormShow(Sender: TObject);
begin

end;

end.

