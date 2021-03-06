with Ada.Characters.Handling;
use Ada.Characters.Handling;

with Ada.Command_Line;

with Ada.Text_IO;
use Ada.Text_IO;

package body Command_Line is

    procedure Get_Args (args : in out Program_args) is

        Bad_Arguments : exception;

        package ACL renames Ada.Command_Line;
--        package NB_Days_IO is new Ada.Text_IO.Integer(Natural);

    begin

        -- Help ?
        for i in 1 .. ACL.Argument_Count loop
            if ACL.Argument (i) = "-h" then
                raise Bad_Arguments;
            end if;
        end loop;

        case ACL.Argument_Count is
            when 1 =>
                args.Fuel_Mode      := LINEAR;
                args.Data_File_Name := To_Bounded_String (ACL.Argument (1));

            when 2 =>
                if To_Upper (ACL.Argument (1)) = "LINEAR" then
                    args.Fuel_Mode := LINEAR;
                elsif To_Upper (ACL.Argument (1)) = "PROGRESSIVE" then
                    args.Fuel_Mode := PROGRESSIVE;
                else
                    raise Bad_Arguments;
                end if;

                args.Data_File_Name := To_Bounded_String (ACL.Argument (2));

            when others =>
                raise Bad_Arguments;
        end case;

    exception
        when Bad_Arguments =>
            New_Line (Standard_Error);
            Put_Line (Standard_Error, "Usage : " & ACL.Command_Name & " file_name ");
            New_Line (Standard_Error);
            ACL.Set_Exit_Status (ACL.Failure);
            raise;

    end Get_Args;

end Command_Line;
