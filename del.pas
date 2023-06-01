unit del;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, Buttons,
  ExtCtrls;

type

  { TDel_Form }

  TDel_Form = class(TForm)
    Button_OK: TBitBtn;
    Button_Cancel: TBitBtn;
    Edit_id: TEdit;
    Image1: TImage;
    Label_id: TLabel;
  private

  public

  end;

var
  Del_Form: TDel_Form;

implementation

{$R *.lfm}

end.

