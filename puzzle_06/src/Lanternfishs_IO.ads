with Lanternfishs;
use Lanternfishs;

with Ada.Numerics.Big_Numbers.Big_Integers;
use Ada.Numerics.Big_Numbers;

with Ada.Text_IO;

package Lanternfishs_IO is

    procedure get
       (File :        Ada.Text_IO.File_Type;
        Item : in out Life_Timer);

    procedure get_next
       (File :        Ada.Text_IO.File_Type;
        Item : in out Life_Timer);

    package Population_IO is new Big_Integers.Signed_Conversions (Population);

end Lanternfishs_IO;