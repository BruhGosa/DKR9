unit add;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

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
    Image_BackGround: TImage;
    Label_Animal: TLabel;
    Label_Name: TLabel;
    Label_Age: TLabel;
    Label_Gender: TLabel;
    Label_Meal: TLabel;
    Label_Aviar: TLabel;
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

