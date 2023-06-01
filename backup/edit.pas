unit edit;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  DBCtrls, ExtCtrls;

type

  { TEdit_Form }

  TEdit_Form = class(TForm)
    Button_OK: TBitBtn;
    Button_Cancel: TBitBtn;
    DBComboBox_gender: TDBComboBox;
    DBComboBox_meal: TDBComboBox;
    DBEdit_animal: TDBEdit;
    DBEdit_name: TDBEdit;
    DBEdit_age: TDBEdit;
    DBEdit_aviar: TDBEdit;
    Image_BackGround: TImage;
    Label_Animal: TLabel;
    Label_Name: TLabel;
    Label_Age: TLabel;
    Label_Gender: TLabel;
    Label_Meal: TLabel;
    Label_Aviar: TLabel;
  private

  public

  end;

var
  Edit_Form: TEdit_Form;

implementation

{$R *.lfm}

end.

